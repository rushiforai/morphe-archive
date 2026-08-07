.class public final Lcom/google/android/libraries/places/internal/zzc;
.super Lcom/google/android/libraries/places/internal/zzatu;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavg;


# static fields
.field private static final zzb:Lcom/google/android/libraries/places/internal/zzc;

.field private static volatile zze:Lcom/google/android/libraries/places/internal/zzavn;


# instance fields
.field private zzf:I

.field private zzg:Lcom/google/android/libraries/places/internal/zzco;

.field private zzh:Lcom/google/android/libraries/places/internal/zzai;

.field private zzi:Lcom/google/android/libraries/places/internal/zzj;

.field private zzj:Lcom/google/android/libraries/places/internal/zzl;

.field private zzk:Lcom/google/android/libraries/places/internal/zzg;

.field private zzl:Lcom/google/android/libraries/places/internal/zzu;

.field private zzm:Lcom/google/android/libraries/places/internal/zze;

.field private zzn:Lcom/google/android/libraries/places/internal/zzp;

.field private zzo:Lcom/google/android/libraries/places/internal/zzaa;

.field private zzp:Lcom/google/android/libraries/places/internal/zzy;

.field private zzq:Lcom/google/android/libraries/places/internal/zzr;

.field private zzr:Lcom/google/android/libraries/places/internal/zzw;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzc;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzc;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzc;->zzb:Lcom/google/android/libraries/places/internal/zzc;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/libraries/places/internal/zzc;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaE(Ljava/lang/Class;Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzatu;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic zza()Lcom/google/android/libraries/places/internal/zzc;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzc;->zzb:Lcom/google/android/libraries/places/internal/zzc;

    return-object v0
.end method


# virtual methods
.method public final zzb(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 13

    .line 1
    add-int/lit8 p1, p1, -0x1

    .line 2
    .line 3
    if-eqz p1, :cond_7

    .line 4
    .line 5
    const/4 p0, 0x2

    .line 6
    if-eq p1, p0, :cond_6

    .line 7
    .line 8
    const/4 p0, 0x3

    .line 9
    if-eq p1, p0, :cond_5

    .line 10
    .line 11
    const/4 p0, 0x4

    .line 12
    const/4 v0, 0x0

    .line 13
    if-eq p1, p0, :cond_4

    .line 14
    .line 15
    const/4 p0, 0x5

    .line 16
    if-eq p1, p0, :cond_3

    .line 17
    .line 18
    const/4 p0, 0x6

    .line 19
    if-eq p1, p0, :cond_0

    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_0
    sget-object p0, Lcom/google/android/libraries/places/internal/zzc;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 23
    .line 24
    if-nez p0, :cond_2

    .line 25
    .line 26
    const-class p1, Lcom/google/android/libraries/places/internal/zzc;

    .line 27
    .line 28
    monitor-enter p1

    .line 29
    :try_start_0
    sget-object p0, Lcom/google/android/libraries/places/internal/zzc;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 30
    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    new-instance p0, Lcom/google/android/libraries/places/internal/zzatp;

    .line 34
    .line 35
    sget-object v0, Lcom/google/android/libraries/places/internal/zzc;->zzb:Lcom/google/android/libraries/places/internal/zzc;

    .line 36
    .line 37
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzatp;-><init>(Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 38
    .line 39
    .line 40
    sput-object p0, Lcom/google/android/libraries/places/internal/zzc;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception v0

    .line 44
    move-object p0, v0

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    :goto_0
    monitor-exit p1

    .line 47
    return-object p0

    .line 48
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    throw p0

    .line 50
    :cond_2
    return-object p0

    .line 51
    :cond_3
    sget-object p0, Lcom/google/android/libraries/places/internal/zzc;->zzb:Lcom/google/android/libraries/places/internal/zzc;

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_4
    new-instance p0, Lcom/google/android/libraries/places/internal/zzb;

    .line 55
    .line 56
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzb;-><init>(Lcom/google/android/libraries/places/internal/zza;)V

    .line 57
    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_5
    new-instance p0, Lcom/google/android/libraries/places/internal/zzc;

    .line 61
    .line 62
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzc;-><init>()V

    .line 63
    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_6
    const-string v0, "zzf"

    .line 67
    .line 68
    const-string v1, "zzh"

    .line 69
    .line 70
    const-string v2, "zzi"

    .line 71
    .line 72
    const-string v3, "zzj"

    .line 73
    .line 74
    const-string v4, "zzk"

    .line 75
    .line 76
    const-string v5, "zzl"

    .line 77
    .line 78
    const-string v6, "zzm"

    .line 79
    .line 80
    const-string v7, "zzn"

    .line 81
    .line 82
    const-string v8, "zzo"

    .line 83
    .line 84
    const-string v9, "zzp"

    .line 85
    .line 86
    const-string v10, "zzg"

    .line 87
    .line 88
    const-string v11, "zzq"

    .line 89
    .line 90
    const-string v12, "zzr"

    .line 91
    .line 92
    filled-new-array/range {v0 .. v12}, [Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    sget-object p1, Lcom/google/android/libraries/places/internal/zzc;->zzb:Lcom/google/android/libraries/places/internal/zzc;

    .line 97
    .line 98
    const-string v0, "\u0001\u000c\u0000\u0001\u0001\u000c\u000c\u0000\u0000\u0000\u0001\u1009\u0001\u0002\u1009\u0002\u0003\u1009\u0003\u0004\u1009\u0004\u0005\u1009\u0005\u0006\u1009\u0006\u0007\u1009\u0007\u0008\u1009\u0008\t\u1009\t\n\u1009\u0000\u000b\u1009\n\u000c\u1009\u000b"

    .line 99
    .line 100
    invoke-static {p1, v0, p0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaB(Lcom/google/android/libraries/places/internal/zzavf;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    return-object p0

    .line 105
    :cond_7
    const/4 p0, 0x1

    .line 106
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    return-object p0
.end method
