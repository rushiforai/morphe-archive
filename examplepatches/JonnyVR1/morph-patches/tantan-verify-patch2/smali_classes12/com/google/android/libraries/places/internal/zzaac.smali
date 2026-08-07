.class public final Lcom/google/android/libraries/places/internal/zzaac;
.super Lcom/google/android/libraries/places/internal/zzatu;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavg;


# static fields
.field private static final zzb:Lcom/google/android/libraries/places/internal/zzaua;

.field private static final zze:Lcom/google/android/libraries/places/internal/zzaua;

.field private static final zzf:Lcom/google/android/libraries/places/internal/zzaac;

.field private static volatile zzg:Lcom/google/android/libraries/places/internal/zzavn;


# instance fields
.field private zzh:I

.field private zzi:Lcom/google/android/libraries/places/internal/zzauc;

.field private zzj:J

.field private zzk:Lcom/google/android/libraries/places/internal/zzatz;

.field private zzl:Lcom/google/android/libraries/places/internal/zzatz;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzzx;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzzx;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzaac;->zzb:Lcom/google/android/libraries/places/internal/zzaua;

    .line 7
    .line 8
    new-instance v0, Lcom/google/android/libraries/places/internal/zzzy;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzzy;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/google/android/libraries/places/internal/zzaac;->zze:Lcom/google/android/libraries/places/internal/zzaua;

    .line 14
    .line 15
    new-instance v0, Lcom/google/android/libraries/places/internal/zzaac;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzaac;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/google/android/libraries/places/internal/zzaac;->zzf:Lcom/google/android/libraries/places/internal/zzaac;

    .line 21
    .line 22
    const-class v1, Lcom/google/android/libraries/places/internal/zzaac;

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaE(Ljava/lang/Class;Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzatu;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzatu;->zzax()Lcom/google/android/libraries/places/internal/zzauc;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaac;->zzi:Lcom/google/android/libraries/places/internal/zzauc;

    .line 9
    .line 10
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzatu;->zzau()Lcom/google/android/libraries/places/internal/zzatz;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaac;->zzk:Lcom/google/android/libraries/places/internal/zzatz;

    .line 15
    .line 16
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzatu;->zzau()Lcom/google/android/libraries/places/internal/zzatz;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaac;->zzl:Lcom/google/android/libraries/places/internal/zzatz;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic zza()Lcom/google/android/libraries/places/internal/zzaac;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzaac;->zzf:Lcom/google/android/libraries/places/internal/zzaac;

    return-object v0
.end method


# virtual methods
.method public final zzb(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

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
    const/4 p2, 0x0

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
    return-object p2

    .line 22
    :cond_0
    sget-object p0, Lcom/google/android/libraries/places/internal/zzaac;->zzg:Lcom/google/android/libraries/places/internal/zzavn;

    .line 23
    .line 24
    if-nez p0, :cond_2

    .line 25
    .line 26
    const-class p1, Lcom/google/android/libraries/places/internal/zzaac;

    .line 27
    .line 28
    monitor-enter p1

    .line 29
    :try_start_0
    sget-object p0, Lcom/google/android/libraries/places/internal/zzaac;->zzg:Lcom/google/android/libraries/places/internal/zzavn;

    .line 30
    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    new-instance p0, Lcom/google/android/libraries/places/internal/zzatp;

    .line 34
    .line 35
    sget-object p2, Lcom/google/android/libraries/places/internal/zzaac;->zzf:Lcom/google/android/libraries/places/internal/zzaac;

    .line 36
    .line 37
    invoke-direct {p0, p2}, Lcom/google/android/libraries/places/internal/zzatp;-><init>(Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 38
    .line 39
    .line 40
    sput-object p0, Lcom/google/android/libraries/places/internal/zzaac;->zzg:Lcom/google/android/libraries/places/internal/zzavn;

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
    sget-object p0, Lcom/google/android/libraries/places/internal/zzaac;->zzf:Lcom/google/android/libraries/places/internal/zzaac;

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_4
    new-instance p0, Lcom/google/android/libraries/places/internal/zzzz;

    .line 55
    .line 56
    invoke-direct {p0, p2}, Lcom/google/android/libraries/places/internal/zzzz;-><init>(Lcom/google/android/libraries/places/internal/zzzg;)V

    .line 57
    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_5
    new-instance p0, Lcom/google/android/libraries/places/internal/zzaac;

    .line 61
    .line 62
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzaac;-><init>()V

    .line 63
    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_6
    const-string v0, "zzh"

    .line 67
    .line 68
    const-string v1, "zzi"

    .line 69
    .line 70
    const-class v2, Lcom/google/android/libraries/places/internal/zzaab;

    .line 71
    .line 72
    const-string v3, "zzj"

    .line 73
    .line 74
    const-string v4, "zzk"

    .line 75
    .line 76
    sget-object v5, Lcom/google/android/libraries/places/internal/zzuo;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 77
    .line 78
    const-string v6, "zzl"

    .line 79
    .line 80
    move-object v7, v5

    .line 81
    filled-new-array/range {v0 .. v7}, [Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    sget-object p1, Lcom/google/android/libraries/places/internal/zzaac;->zzf:Lcom/google/android/libraries/places/internal/zzaac;

    .line 86
    .line 87
    const-string p2, "\u0001\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0003\u0000\u0001\u001b\u0002\u1002\u0000\u0003\u082c\u0004\u082c"

    .line 88
    .line 89
    invoke-static {p1, p2, p0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaB(Lcom/google/android/libraries/places/internal/zzavf;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    return-object p0

    .line 94
    :cond_7
    const/4 p0, 0x1

    .line 95
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0
.end method
