.class public final Lcom/google/android/libraries/places/internal/zzbmd;
.super Lcom/google/android/libraries/places/internal/zzbbs;
.source "SourceFile"


# static fields
.field static final zza:J

.field static final zzb:J

.field private static final zzm:Ljava/util/logging/Logger;

.field private static final zzn:Lcom/google/android/libraries/places/internal/zzazq;

.field private static final zzo:Lcom/google/android/libraries/places/internal/zzazd;

.field private static final zzp:Ljava/lang/reflect/Method;

.field private static final zzt:Lcom/google/android/libraries/places/internal/zzbqn;


# instance fields
.field final zzc:Lcom/google/android/libraries/places/internal/zzbdb;

.field final zzd:Ljava/util/List;

.field final zze:Ljava/lang/String;

.field final zzf:Ljava/lang/String;

.field final zzg:Lcom/google/android/libraries/places/internal/zzazq;

.field final zzh:Lcom/google/android/libraries/places/internal/zzazd;

.field final zzi:J

.field final zzj:Lcom/google/android/libraries/places/internal/zzbah;

.field final zzk:Lcom/google/android/libraries/places/internal/zzbqn;

.field final zzl:Lcom/google/android/libraries/places/internal/zzbqn;

.field private final zzq:Ljava/util/List;

.field private final zzr:Lcom/google/android/libraries/places/internal/zzbmc;

.field private final zzs:Lcom/google/android/libraries/places/internal/zzbmb;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    const-class v0, Lcom/google/android/libraries/places/internal/zzbmd;

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
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbmd;->zzm:Ljava/util/logging/Logger;

    .line 12
    .line 13
    const-wide/32 v0, 0x1b7740

    .line 14
    .line 15
    .line 16
    sput-wide v0, Lcom/google/android/libraries/places/internal/zzbmd;->zza:J

    .line 17
    .line 18
    const-wide/16 v0, 0x3e8

    .line 19
    .line 20
    sput-wide v0, Lcom/google/android/libraries/places/internal/zzbmd;->zzb:J

    .line 21
    .line 22
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbjd;->zzp:Lcom/google/android/libraries/places/internal/zzbql;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbqn;->zza(Lcom/google/android/libraries/places/internal/zzbql;)Lcom/google/android/libraries/places/internal/zzbqn;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbmd;->zzt:Lcom/google/android/libraries/places/internal/zzbqn;

    .line 29
    .line 30
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzazq;->zzb()Lcom/google/android/libraries/places/internal/zzazq;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbmd;->zzn:Lcom/google/android/libraries/places/internal/zzazq;

    .line 35
    .line 36
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzazd;->zza()Lcom/google/android/libraries/places/internal/zzazd;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbmd;->zzo:Lcom/google/android/libraries/places/internal/zzazd;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    :try_start_0
    const-class v0, Lcom/google/android/libraries/places/internal/zzbea;

    .line 44
    .line 45
    sget v2, Lcom/google/android/libraries/places/internal/zzbea;->a:I

    .line 46
    .line 47
    const-string v2, "getClientInterceptor"

    .line 48
    .line 49
    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 50
    .line 51
    filled-new-array {v3, v3, v3, v3}, [Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 56
    .line 57
    .line 58
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    goto :goto_2

    .line 60
    :catch_0
    move-exception v0

    .line 61
    move-object v7, v0

    .line 62
    goto :goto_0

    .line 63
    :catch_1
    move-exception v0

    .line 64
    move-object v7, v0

    .line 65
    goto :goto_1

    .line 66
    :goto_0
    sget-object v2, Lcom/google/android/libraries/places/internal/zzbmd;->zzm:Ljava/util/logging/Logger;

    .line 67
    .line 68
    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 69
    .line 70
    const-string v5, "<clinit>"

    .line 71
    .line 72
    const-string v6, "Unable to apply census stats"

    .line 73
    .line 74
    const-string v4, "io.grpc.internal.ManagedChannelImplBuilder"

    .line 75
    .line 76
    invoke-virtual/range {v2 .. v7}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 77
    .line 78
    .line 79
    goto :goto_2

    .line 80
    :goto_1
    sget-object v2, Lcom/google/android/libraries/places/internal/zzbmd;->zzm:Ljava/util/logging/Logger;

    .line 81
    .line 82
    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 83
    .line 84
    const-string v5, "<clinit>"

    .line 85
    .line 86
    const-string v6, "Unable to apply census stats"

    .line 87
    .line 88
    const-string v4, "io.grpc.internal.ManagedChannelImplBuilder"

    .line 89
    .line 90
    invoke-virtual/range {v2 .. v7}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 91
    .line 92
    .line 93
    :goto_2
    sput-object v1, Lcom/google/android/libraries/places/internal/zzbmd;->zzp:Ljava/lang/reflect/Method;

    .line 94
    .line 95
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/google/android/libraries/places/internal/zzayl;Lcom/google/android/libraries/places/internal/zzayf;Lcom/google/android/libraries/places/internal/zzbmc;Lcom/google/android/libraries/places/internal/zzbmb;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbbs;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object p2, Lcom/google/android/libraries/places/internal/zzbmd;->zzt:Lcom/google/android/libraries/places/internal/zzbqn;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbmd;->zzk:Lcom/google/android/libraries/places/internal/zzbqn;

    .line 7
    .line 8
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbmd;->zzl:Lcom/google/android/libraries/places/internal/zzbqn;

    .line 9
    .line 10
    new-instance p2, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbmd;->zzq:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbdb;->zzb()Lcom/google/android/libraries/places/internal/zzbdb;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbmd;->zzc:Lcom/google/android/libraries/places/internal/zzbdb;

    .line 22
    .line 23
    new-instance p2, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbmd;->zzd:Ljava/util/List;

    .line 29
    .line 30
    const-string p2, "pick_first"

    .line 31
    .line 32
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbmd;->zzf:Ljava/lang/String;

    .line 33
    .line 34
    sget-object p2, Lcom/google/android/libraries/places/internal/zzbmd;->zzn:Lcom/google/android/libraries/places/internal/zzazq;

    .line 35
    .line 36
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbmd;->zzg:Lcom/google/android/libraries/places/internal/zzazq;

    .line 37
    .line 38
    sget-object p2, Lcom/google/android/libraries/places/internal/zzbmd;->zzo:Lcom/google/android/libraries/places/internal/zzazd;

    .line 39
    .line 40
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbmd;->zzh:Lcom/google/android/libraries/places/internal/zzazd;

    .line 41
    .line 42
    sget-wide p2, Lcom/google/android/libraries/places/internal/zzbmd;->zza:J

    .line 43
    .line 44
    iput-wide p2, p0, Lcom/google/android/libraries/places/internal/zzbmd;->zzi:J

    .line 45
    .line 46
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbah;->zza()Lcom/google/android/libraries/places/internal/zzbah;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbmd;->zzj:Lcom/google/android/libraries/places/internal/zzbah;

    .line 51
    .line 52
    const-string p2, "target"

    .line 53
    .line 54
    invoke-static {p1, p2}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbmd;->zze:Ljava/lang/String;

    .line 58
    .line 59
    iput-object p4, p0, Lcom/google/android/libraries/places/internal/zzbmd;->zzr:Lcom/google/android/libraries/places/internal/zzbmc;

    .line 60
    .line 61
    iput-object p5, p0, Lcom/google/android/libraries/places/internal/zzbmd;->zzs:Lcom/google/android/libraries/places/internal/zzbmb;

    .line 62
    .line 63
    return-void
.end method


# virtual methods
.method public final zza()Lcom/google/android/libraries/places/internal/zzbbr;
    .locals 17

    .line 1
    move-object/from16 v2, p0

    .line 2
    .line 3
    iget-object v0, v2, Lcom/google/android/libraries/places/internal/zzbmd;->zzr:Lcom/google/android/libraries/places/internal/zzbmc;

    .line 4
    .line 5
    new-instance v9, Lcom/google/android/libraries/places/internal/zzbmf;

    .line 6
    .line 7
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbma;

    .line 8
    .line 9
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbmc;->zza()Lcom/google/android/libraries/places/internal/zzbfw;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    new-instance v4, Lcom/google/android/libraries/places/internal/zzbij;

    .line 14
    .line 15
    invoke-direct {v4}, Lcom/google/android/libraries/places/internal/zzbij;-><init>()V

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbjd;->zzp:Lcom/google/android/libraries/places/internal/zzbql;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbqn;->zza(Lcom/google/android/libraries/places/internal/zzbql;)Lcom/google/android/libraries/places/internal/zzbqn;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    sget-object v6, Lcom/google/android/libraries/places/internal/zzbjd;->zzr:Lcom/google/android/libraries/places/internal/zznc;

    .line 25
    .line 26
    new-instance v7, Ljava/util/ArrayList;

    .line 27
    .line 28
    iget-object v0, v2, Lcom/google/android/libraries/places/internal/zzbmd;->zzq:Ljava/util/List;

    .line 29
    .line 30
    invoke-direct {v7, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 31
    .line 32
    .line 33
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbmd;->zzp:Ljava/lang/reflect/Method;

    .line 34
    .line 35
    const/4 v8, 0x0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    :try_start_0
    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 39
    .line 40
    sget-object v11, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 41
    .line 42
    filled-new-array {v10, v10, v11, v10}, [Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v10

    .line 46
    invoke-virtual {v0, v8, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/google/android/libraries/places/internal/zzayp;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    goto :goto_3

    .line 53
    :catch_0
    move-exception v0

    .line 54
    move-object v15, v0

    .line 55
    goto :goto_0

    .line 56
    :catch_1
    move-exception v0

    .line 57
    move-object v15, v0

    .line 58
    goto :goto_2

    .line 59
    :goto_0
    sget-object v10, Lcom/google/android/libraries/places/internal/zzbmd;->zzm:Ljava/util/logging/Logger;

    .line 60
    .line 61
    sget-object v11, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 62
    .line 63
    const-string v13, "getEffectiveInterceptors"

    .line 64
    .line 65
    const-string v14, "Unable to apply census stats"

    .line 66
    .line 67
    const-string v12, "io.grpc.internal.ManagedChannelImplBuilder"

    .line 68
    .line 69
    invoke-virtual/range {v10 .. v15}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    :cond_0
    :goto_1
    move-object v0, v8

    .line 73
    goto :goto_3

    .line 74
    :goto_2
    sget-object v10, Lcom/google/android/libraries/places/internal/zzbmd;->zzm:Ljava/util/logging/Logger;

    .line 75
    .line 76
    sget-object v11, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 77
    .line 78
    const-string v13, "getEffectiveInterceptors"

    .line 79
    .line 80
    const-string v14, "Unable to apply census stats"

    .line 81
    .line 82
    const-string v12, "io.grpc.internal.ManagedChannelImplBuilder"

    .line 83
    .line 84
    invoke-virtual/range {v10 .. v15}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :goto_3
    const/4 v10, 0x0

    .line 89
    if-eqz v0, :cond_1

    .line 90
    .line 91
    invoke-interface {v7, v10, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    :cond_1
    :try_start_1
    const-class v0, Lcom/google/android/libraries/places/internal/zzbeb;

    .line 95
    .line 96
    const-string v11, "getClientInterceptor"

    .line 97
    .line 98
    invoke-virtual {v0, v11, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v0, v8, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Lcom/google/android/libraries/places/internal/zzayp;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_2

    .line 107
    .line 108
    move-object v8, v0

    .line 109
    goto :goto_8

    .line 110
    :catch_2
    move-exception v0

    .line 111
    move-object/from16 v16, v0

    .line 112
    .line 113
    goto :goto_4

    .line 114
    :catch_3
    move-exception v0

    .line 115
    move-object/from16 v16, v0

    .line 116
    .line 117
    goto :goto_5

    .line 118
    :catch_4
    move-exception v0

    .line 119
    move-object/from16 v16, v0

    .line 120
    .line 121
    goto :goto_6

    .line 122
    :catch_5
    move-exception v0

    .line 123
    move-object/from16 v16, v0

    .line 124
    .line 125
    goto :goto_7

    .line 126
    :goto_4
    sget-object v11, Lcom/google/android/libraries/places/internal/zzbmd;->zzm:Ljava/util/logging/Logger;

    .line 127
    .line 128
    sget-object v12, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 129
    .line 130
    const-string v14, "getEffectiveInterceptors"

    .line 131
    .line 132
    const-string v15, "Unable to apply census stats"

    .line 133
    .line 134
    const-string v13, "io.grpc.internal.ManagedChannelImplBuilder"

    .line 135
    .line 136
    invoke-virtual/range {v11 .. v16}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 137
    .line 138
    .line 139
    goto :goto_8

    .line 140
    :goto_5
    sget-object v11, Lcom/google/android/libraries/places/internal/zzbmd;->zzm:Ljava/util/logging/Logger;

    .line 141
    .line 142
    sget-object v12, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 143
    .line 144
    const-string v14, "getEffectiveInterceptors"

    .line 145
    .line 146
    const-string v15, "Unable to apply census stats"

    .line 147
    .line 148
    const-string v13, "io.grpc.internal.ManagedChannelImplBuilder"

    .line 149
    .line 150
    invoke-virtual/range {v11 .. v16}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 151
    .line 152
    .line 153
    goto :goto_8

    .line 154
    :goto_6
    sget-object v11, Lcom/google/android/libraries/places/internal/zzbmd;->zzm:Ljava/util/logging/Logger;

    .line 155
    .line 156
    sget-object v12, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 157
    .line 158
    const-string v14, "getEffectiveInterceptors"

    .line 159
    .line 160
    const-string v15, "Unable to apply census stats"

    .line 161
    .line 162
    const-string v13, "io.grpc.internal.ManagedChannelImplBuilder"

    .line 163
    .line 164
    invoke-virtual/range {v11 .. v16}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 165
    .line 166
    .line 167
    goto :goto_8

    .line 168
    :goto_7
    sget-object v11, Lcom/google/android/libraries/places/internal/zzbmd;->zzm:Ljava/util/logging/Logger;

    .line 169
    .line 170
    sget-object v12, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 171
    .line 172
    const-string v14, "getEffectiveInterceptors"

    .line 173
    .line 174
    const-string v15, "Unable to apply census stats"

    .line 175
    .line 176
    const-string v13, "io.grpc.internal.ManagedChannelImplBuilder"

    .line 177
    .line 178
    invoke-virtual/range {v11 .. v16}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 179
    .line 180
    .line 181
    :goto_8
    if-eqz v8, :cond_2

    .line 182
    .line 183
    invoke-interface {v7, v10, v8}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 184
    .line 185
    .line 186
    :cond_2
    sget-object v8, Lcom/google/android/libraries/places/internal/zzbqt;->zza:Lcom/google/android/libraries/places/internal/zzbqt;

    .line 187
    .line 188
    invoke-direct/range {v1 .. v8}, Lcom/google/android/libraries/places/internal/zzbma;-><init>(Lcom/google/android/libraries/places/internal/zzbmd;Lcom/google/android/libraries/places/internal/zzbfw;Lcom/google/android/libraries/places/internal/zzbij;Lcom/google/android/libraries/places/internal/zzbqn;Lcom/google/android/libraries/places/internal/zznc;Ljava/util/List;Lcom/google/android/libraries/places/internal/zzbqt;)V

    .line 189
    .line 190
    .line 191
    invoke-direct {v9, v1}, Lcom/google/android/libraries/places/internal/zzbmf;-><init>(Lcom/google/android/libraries/places/internal/zzbbr;)V

    .line 192
    .line 193
    .line 194
    return-object v9
.end method

.method public final zzb()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbmd;->zzs:Lcom/google/android/libraries/places/internal/zzbmb;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbmb;->zza()I

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x1bb

    .line 7
    .line 8
    return p0
.end method
