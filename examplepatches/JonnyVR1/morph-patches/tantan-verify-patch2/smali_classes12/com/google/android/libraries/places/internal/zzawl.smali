.class public final Lcom/google/android/libraries/places/internal/zzawl;
.super Lcom/google/android/libraries/places/internal/zzatu;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavg;


# static fields
.field private static final zzb:Lcom/google/android/libraries/places/internal/zzawl;

.field private static volatile zze:Lcom/google/android/libraries/places/internal/zzavn;


# instance fields
.field private zzf:J

.field private zzg:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzawl;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzawl;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzawl;->zzb:Lcom/google/android/libraries/places/internal/zzawl;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/libraries/places/internal/zzawl;

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

.method public static zzf()Lcom/google/android/libraries/places/internal/zzawk;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzawl;->zzb:Lcom/google/android/libraries/places/internal/zzawl;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzar()Lcom/google/android/libraries/places/internal/zzato;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/android/libraries/places/internal/zzawk;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic zzg()Lcom/google/android/libraries/places/internal/zzawl;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzawl;->zzb:Lcom/google/android/libraries/places/internal/zzawl;

    return-object v0
.end method

.method public static zzh()Lcom/google/android/libraries/places/internal/zzawl;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzawl;->zzb:Lcom/google/android/libraries/places/internal/zzawl;

    return-object v0
.end method

.method public static synthetic zzi(Lcom/google/android/libraries/places/internal/zzawl;J)V
    .locals 0

    iput-wide p1, p0, Lcom/google/android/libraries/places/internal/zzawl;->zzf:J

    return-void
.end method

.method public static synthetic zzj(Lcom/google/android/libraries/places/internal/zzawl;I)V
    .locals 0

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzawl;->zzg:I

    return-void
.end method


# virtual methods
.method public final zzb(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

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
    sget-object p0, Lcom/google/android/libraries/places/internal/zzawl;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 23
    .line 24
    if-nez p0, :cond_2

    .line 25
    .line 26
    const-class p1, Lcom/google/android/libraries/places/internal/zzawl;

    .line 27
    .line 28
    monitor-enter p1

    .line 29
    :try_start_0
    sget-object p0, Lcom/google/android/libraries/places/internal/zzawl;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 30
    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    new-instance p0, Lcom/google/android/libraries/places/internal/zzatp;

    .line 34
    .line 35
    sget-object p2, Lcom/google/android/libraries/places/internal/zzawl;->zzb:Lcom/google/android/libraries/places/internal/zzawl;

    .line 36
    .line 37
    invoke-direct {p0, p2}, Lcom/google/android/libraries/places/internal/zzatp;-><init>(Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 38
    .line 39
    .line 40
    sput-object p0, Lcom/google/android/libraries/places/internal/zzawl;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    :goto_0
    monitor-exit p1

    .line 46
    return-object p0

    .line 47
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    throw p0

    .line 49
    :cond_2
    return-object p0

    .line 50
    :cond_3
    sget-object p0, Lcom/google/android/libraries/places/internal/zzawl;->zzb:Lcom/google/android/libraries/places/internal/zzawl;

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_4
    new-instance p0, Lcom/google/android/libraries/places/internal/zzawk;

    .line 54
    .line 55
    invoke-direct {p0, p2}, Lcom/google/android/libraries/places/internal/zzawk;-><init>(Lcom/google/android/libraries/places/internal/zzawj;)V

    .line 56
    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_5
    new-instance p0, Lcom/google/android/libraries/places/internal/zzawl;

    .line 60
    .line 61
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzawl;-><init>()V

    .line 62
    .line 63
    .line 64
    return-object p0

    .line 65
    :cond_6
    const-string p0, "zzf"

    .line 66
    .line 67
    const-string p1, "zzg"

    .line 68
    .line 69
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    sget-object p1, Lcom/google/android/libraries/places/internal/zzawl;->zzb:Lcom/google/android/libraries/places/internal/zzawl;

    .line 74
    .line 75
    new-instance p2, Lcom/google/android/libraries/places/internal/zzavr;

    .line 76
    .line 77
    const-string p3, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u0002\u0002\u0004"

    .line 78
    .line 79
    invoke-direct {p2, p1, p3, p0}, Lcom/google/android/libraries/places/internal/zzavr;-><init>(Lcom/google/android/libraries/places/internal/zzavf;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    return-object p2

    .line 83
    :cond_7
    const/4 p0, 0x1

    .line 84
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0
.end method

.method public final zzc()I
    .locals 0

    iget p0, p0, Lcom/google/android/libraries/places/internal/zzawl;->zzg:I

    return p0
.end method

.method public final zze()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzawl;->zzf:J

    return-wide v0
.end method
