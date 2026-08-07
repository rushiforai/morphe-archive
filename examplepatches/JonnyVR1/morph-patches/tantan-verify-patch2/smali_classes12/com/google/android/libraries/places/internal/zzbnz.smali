.class public final Lcom/google/android/libraries/places/internal/zzbnz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzbkj;


# static fields
.field private static final zza:Ljava/util/logging/Logger;

.field private static final zzb:Ljava/lang/reflect/Constructor;

.field private static final zzc:Ljava/lang/reflect/Method;

.field private static final zzd:Ljava/lang/reflect/Method;

.field private static final zze:Ljava/lang/RuntimeException;

.field private static final zzf:[Ljava/lang/Object;


# instance fields
.field private final zzg:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    const-class v0, Lcom/google/android/libraries/places/internal/zzbnz;

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
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbnz;->zza:Ljava/util/logging/Logger;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    :try_start_0
    const-string v0, "java.util.concurrent.atomic.LongAdder"

    .line 15
    .line 16
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v2, "add"

    .line 21
    .line 22
    sget-object v3, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 23
    .line 24
    filled-new-array {v3}, [Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 29
    .line 30
    .line 31
    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 32
    :try_start_1
    const-string v3, "sum"

    .line 33
    .line 34
    invoke-virtual {v0, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 35
    .line 36
    .line 37
    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 38
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    array-length v4, v0

    .line 43
    const/4 v5, 0x0

    .line 44
    :goto_0
    if-ge v5, v4, :cond_1

    .line 45
    .line 46
    aget-object v6, v0, v5

    .line 47
    .line 48
    invoke-virtual {v6}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    array-length v7, v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 53
    if-nez v7, :cond_0

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_0
    add-int/lit8 v5, v5, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :catchall_0
    move-exception v0

    .line 60
    goto :goto_2

    .line 61
    :cond_1
    move-object v6, v1

    .line 62
    :goto_1
    move-object v7, v1

    .line 63
    goto :goto_4

    .line 64
    :goto_2
    move-object v7, v0

    .line 65
    move-object v0, v2

    .line 66
    move-object v8, v3

    .line 67
    goto :goto_3

    .line 68
    :catchall_1
    move-exception v0

    .line 69
    move-object v7, v0

    .line 70
    move-object v8, v1

    .line 71
    move-object v0, v2

    .line 72
    goto :goto_3

    .line 73
    :catchall_2
    move-exception v0

    .line 74
    move-object v7, v0

    .line 75
    move-object v0, v1

    .line 76
    move-object v8, v0

    .line 77
    :goto_3
    sget-object v2, Lcom/google/android/libraries/places/internal/zzbnz;->zza:Ljava/util/logging/Logger;

    .line 78
    .line 79
    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 80
    .line 81
    const-string v5, "<clinit>"

    .line 82
    .line 83
    const-string v6, "LongAdder can not be found via reflection, this is normal for JDK7 and below"

    .line 84
    .line 85
    const-string v4, "io.grpc.internal.ReflectionLongAdderCounter"

    .line 86
    .line 87
    invoke-virtual/range {v2 .. v7}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 88
    .line 89
    .line 90
    move-object v2, v0

    .line 91
    move-object v6, v1

    .line 92
    move-object v3, v8

    .line 93
    :goto_4
    if-nez v7, :cond_2

    .line 94
    .line 95
    if-eqz v6, :cond_2

    .line 96
    .line 97
    sput-object v6, Lcom/google/android/libraries/places/internal/zzbnz;->zzb:Ljava/lang/reflect/Constructor;

    .line 98
    .line 99
    sput-object v2, Lcom/google/android/libraries/places/internal/zzbnz;->zzc:Ljava/lang/reflect/Method;

    .line 100
    .line 101
    sput-object v3, Lcom/google/android/libraries/places/internal/zzbnz;->zzd:Ljava/lang/reflect/Method;

    .line 102
    .line 103
    sput-object v1, Lcom/google/android/libraries/places/internal/zzbnz;->zze:Ljava/lang/RuntimeException;

    .line 104
    .line 105
    goto :goto_5

    .line 106
    :cond_2
    sput-object v1, Lcom/google/android/libraries/places/internal/zzbnz;->zzb:Ljava/lang/reflect/Constructor;

    .line 107
    .line 108
    sput-object v1, Lcom/google/android/libraries/places/internal/zzbnz;->zzc:Ljava/lang/reflect/Method;

    .line 109
    .line 110
    sput-object v1, Lcom/google/android/libraries/places/internal/zzbnz;->zzd:Ljava/lang/reflect/Method;

    .line 111
    .line 112
    new-instance v0, Ljava/lang/RuntimeException;

    .line 113
    .line 114
    invoke-direct {v0, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 115
    .line 116
    .line 117
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbnz;->zze:Ljava/lang/RuntimeException;

    .line 118
    .line 119
    :goto_5
    const-wide/16 v0, 0x1

    .line 120
    .line 121
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbnz;->zzf:[Ljava/lang/Object;

    .line 130
    .line 131
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbnz;->zze:Ljava/lang/RuntimeException;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    :try_start_0
    sget-object v1, Lcom/google/android/libraries/places/internal/zzbnz;->zzb:Ljava/lang/reflect/Constructor;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbnz;->zzg:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    return-void

    .line 18
    :catch_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :catch_1
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :catch_2
    move-exception p0

    .line 23
    goto :goto_2

    .line 24
    :goto_0
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    throw v0

    .line 28
    :goto_1
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    throw v0

    .line 32
    :goto_2
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    throw v0

    .line 36
    :cond_0
    throw v0
.end method

.method public static zzb()Z
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzbnz;->zze:Ljava/lang/RuntimeException;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public final zza(J)V
    .locals 0

    .line 1
    :try_start_0
    sget-object p1, Lcom/google/android/libraries/places/internal/zzbnz;->zzc:Ljava/lang/reflect/Method;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnz;->zzg:Ljava/lang/Object;

    .line 4
    .line 5
    sget-object p2, Lcom/google/android/libraries/places/internal/zzbnz;->zzf:[Ljava/lang/Object;

    .line 6
    .line 7
    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :catch_1
    move-exception p0

    .line 17
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
