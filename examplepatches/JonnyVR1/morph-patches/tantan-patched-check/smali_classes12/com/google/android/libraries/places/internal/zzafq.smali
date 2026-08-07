.class public final Lcom/google/android/libraries/places/internal/zzafq;
.super Lcom/google/android/libraries/places/internal/zzatu;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavg;


# static fields
.field private static final zzb:Lcom/google/android/libraries/places/internal/zzafq;

.field private static volatile zze:Lcom/google/android/libraries/places/internal/zzavn;


# instance fields
.field private zzf:I

.field private zzg:Ljava/lang/String;

.field private zzh:Lcom/google/android/libraries/places/internal/zzwf;

.field private zzi:Lcom/google/android/libraries/places/internal/zzafe;

.field private zzj:B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzafq;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzafq;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzafq;->zzb:Lcom/google/android/libraries/places/internal/zzafq;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/libraries/places/internal/zzafq;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaE(Ljava/lang/Class;Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzatu;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput-byte v0, p0, Lcom/google/android/libraries/places/internal/zzafq;->zzj:B

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzafq;->zzg:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static zza()Lcom/google/android/libraries/places/internal/zzafp;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzafq;->zzb:Lcom/google/android/libraries/places/internal/zzafq;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzar()Lcom/google/android/libraries/places/internal/zzato;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/android/libraries/places/internal/zzafp;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic zzc()Lcom/google/android/libraries/places/internal/zzafq;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzafq;->zzb:Lcom/google/android/libraries/places/internal/zzafq;

    return-object v0
.end method

.method public static synthetic zzd(Lcom/google/android/libraries/places/internal/zzafq;Lcom/google/android/libraries/places/internal/zzafe;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzafq;->zzi:Lcom/google/android/libraries/places/internal/zzafe;

    iget p1, p0, Lcom/google/android/libraries/places/internal/zzafq;->zzf:I

    or-int/lit8 p1, p1, 0x4

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzafq;->zzf:I

    return-void
.end method


# virtual methods
.method public final zzb(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    add-int/lit8 p1, p1, -0x1

    .line 2
    .line 3
    if-eqz p1, :cond_8

    .line 4
    .line 5
    const/4 p3, 0x2

    .line 6
    if-eq p1, p3, :cond_7

    .line 7
    .line 8
    const/4 p3, 0x3

    .line 9
    if-eq p1, p3, :cond_6

    .line 10
    .line 11
    const/4 p3, 0x4

    .line 12
    const/4 v0, 0x0

    .line 13
    if-eq p1, p3, :cond_5

    .line 14
    .line 15
    const/4 p3, 0x5

    .line 16
    if-eq p1, p3, :cond_4

    .line 17
    .line 18
    const/4 p3, 0x6

    .line 19
    if-eq p1, p3, :cond_1

    .line 20
    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p1, 0x1

    .line 26
    :goto_0
    iput-byte p1, p0, Lcom/google/android/libraries/places/internal/zzafq;->zzj:B

    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_1
    sget-object p0, Lcom/google/android/libraries/places/internal/zzafq;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 30
    .line 31
    if-nez p0, :cond_3

    .line 32
    .line 33
    const-class p1, Lcom/google/android/libraries/places/internal/zzafq;

    .line 34
    .line 35
    monitor-enter p1

    .line 36
    :try_start_0
    sget-object p0, Lcom/google/android/libraries/places/internal/zzafq;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 37
    .line 38
    if-nez p0, :cond_2

    .line 39
    .line 40
    new-instance p0, Lcom/google/android/libraries/places/internal/zzatp;

    .line 41
    .line 42
    sget-object p2, Lcom/google/android/libraries/places/internal/zzafq;->zzb:Lcom/google/android/libraries/places/internal/zzafq;

    .line 43
    .line 44
    invoke-direct {p0, p2}, Lcom/google/android/libraries/places/internal/zzatp;-><init>(Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 45
    .line 46
    .line 47
    sput-object p0, Lcom/google/android/libraries/places/internal/zzafq;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :catchall_0
    move-exception p0

    .line 51
    goto :goto_2

    .line 52
    :cond_2
    :goto_1
    monitor-exit p1

    .line 53
    return-object p0

    .line 54
    :goto_2
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    throw p0

    .line 56
    :cond_3
    return-object p0

    .line 57
    :cond_4
    sget-object p0, Lcom/google/android/libraries/places/internal/zzafq;->zzb:Lcom/google/android/libraries/places/internal/zzafq;

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_5
    new-instance p0, Lcom/google/android/libraries/places/internal/zzafp;

    .line 61
    .line 62
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzafp;-><init>(Lcom/google/android/libraries/places/internal/zzadu;)V

    .line 63
    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_6
    new-instance p0, Lcom/google/android/libraries/places/internal/zzafq;

    .line 67
    .line 68
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzafq;-><init>()V

    .line 69
    .line 70
    .line 71
    return-object p0

    .line 72
    :cond_7
    const-string p0, "zzf"

    .line 73
    .line 74
    const-string p1, "zzg"

    .line 75
    .line 76
    const-string p2, "zzh"

    .line 77
    .line 78
    const-string p3, "zzi"

    .line 79
    .line 80
    filled-new-array {p0, p1, p2, p3}, [Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    sget-object p1, Lcom/google/android/libraries/places/internal/zzafq;->zzb:Lcom/google/android/libraries/places/internal/zzafq;

    .line 85
    .line 86
    const-string p2, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0001\u0001\u1008\u0000\u0002\u1409\u0001\u0003\u1009\u0002"

    .line 87
    .line 88
    invoke-static {p1, p2, p0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaB(Lcom/google/android/libraries/places/internal/zzavf;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0

    .line 93
    :cond_8
    iget-byte p0, p0, Lcom/google/android/libraries/places/internal/zzafq;->zzj:B

    .line 94
    .line 95
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0
.end method
