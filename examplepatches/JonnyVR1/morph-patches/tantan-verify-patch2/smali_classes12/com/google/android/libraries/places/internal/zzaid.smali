.class public final Lcom/google/android/libraries/places/internal/zzaid;
.super Lcom/google/android/libraries/places/internal/zzatu;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavg;


# static fields
.field private static final zzb:Lcom/google/android/libraries/places/internal/zzaid;

.field private static volatile zze:Lcom/google/android/libraries/places/internal/zzavn;


# instance fields
.field private zzf:I

.field private zzg:I

.field private zzh:Ljava/lang/String;

.field private zzi:Z

.field private zzj:D

.field private zzk:I

.field private zzl:Lcom/google/android/libraries/places/internal/zzatz;

.field private zzm:Z

.field private zzn:Lcom/google/android/libraries/places/internal/zzaho;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzaid;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzaid;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzaid;->zzb:Lcom/google/android/libraries/places/internal/zzaid;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/libraries/places/internal/zzaid;

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
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzh:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzatu;->zzau()Lcom/google/android/libraries/places/internal/zzatz;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzl:Lcom/google/android/libraries/places/internal/zzatz;

    .line 13
    .line 14
    return-void
.end method

.method public static zza()Lcom/google/android/libraries/places/internal/zzaib;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaid;->zzb:Lcom/google/android/libraries/places/internal/zzaid;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzar()Lcom/google/android/libraries/places/internal/zzato;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/android/libraries/places/internal/zzaib;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic zzc()Lcom/google/android/libraries/places/internal/zzaid;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzaid;->zzb:Lcom/google/android/libraries/places/internal/zzaid;

    return-object v0
.end method

.method public static synthetic zzd(Lcom/google/android/libraries/places/internal/zzaid;Ljava/lang/String;)V
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzf:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzf:I

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzh:Ljava/lang/String;

    return-void
.end method

.method public static synthetic zze(Lcom/google/android/libraries/places/internal/zzaid;Z)V
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzf:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzf:I

    iput-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzi:Z

    return-void
.end method

.method public static synthetic zzf(Lcom/google/android/libraries/places/internal/zzaid;D)V
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzf:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzf:I

    iput-wide p1, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzj:D

    return-void
.end method

.method public static synthetic zzg(Lcom/google/android/libraries/places/internal/zzaid;I)V
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzf:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzf:I

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzk:I

    return-void
.end method

.method public static synthetic zzh(Lcom/google/android/libraries/places/internal/zzaid;Ljava/lang/Iterable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzl:Lcom/google/android/libraries/places/internal/zzatz;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzauc;->zzc()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzav(Lcom/google/android/libraries/places/internal/zzatz;)Lcom/google/android/libraries/places/internal/zzatz;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzl:Lcom/google/android/libraries/places/internal/zzatz;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzl:Lcom/google/android/libraries/places/internal/zzatz;

    .line 16
    .line 17
    invoke-static {p1, p0}, Lcom/google/android/libraries/places/internal/zzart;->zzam(Ljava/lang/Iterable;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic zzi(Lcom/google/android/libraries/places/internal/zzaid;Z)V
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzf:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzf:I

    iput-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzm:Z

    return-void
.end method

.method public static synthetic zzj(Lcom/google/android/libraries/places/internal/zzaid;Lcom/google/android/libraries/places/internal/zzaho;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzn:Lcom/google/android/libraries/places/internal/zzaho;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzf:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x40

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzf:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic zzk(Lcom/google/android/libraries/places/internal/zzaid;I)V
    .locals 0

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzg:I

    iget p1, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzf:I

    or-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaid;->zzf:I

    return-void
.end method


# virtual methods
.method public final zzb(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

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
    sget-object p0, Lcom/google/android/libraries/places/internal/zzaid;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 23
    .line 24
    if-nez p0, :cond_2

    .line 25
    .line 26
    const-class p1, Lcom/google/android/libraries/places/internal/zzaid;

    .line 27
    .line 28
    monitor-enter p1

    .line 29
    :try_start_0
    sget-object p0, Lcom/google/android/libraries/places/internal/zzaid;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 30
    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    new-instance p0, Lcom/google/android/libraries/places/internal/zzatp;

    .line 34
    .line 35
    sget-object p2, Lcom/google/android/libraries/places/internal/zzaid;->zzb:Lcom/google/android/libraries/places/internal/zzaid;

    .line 36
    .line 37
    invoke-direct {p0, p2}, Lcom/google/android/libraries/places/internal/zzatp;-><init>(Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 38
    .line 39
    .line 40
    sput-object p0, Lcom/google/android/libraries/places/internal/zzaid;->zze:Lcom/google/android/libraries/places/internal/zzavn;

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
    sget-object p0, Lcom/google/android/libraries/places/internal/zzaid;->zzb:Lcom/google/android/libraries/places/internal/zzaid;

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_4
    new-instance p0, Lcom/google/android/libraries/places/internal/zzaib;

    .line 55
    .line 56
    invoke-direct {p0, p2}, Lcom/google/android/libraries/places/internal/zzaib;-><init>(Lcom/google/android/libraries/places/internal/zzadu;)V

    .line 57
    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_5
    new-instance p0, Lcom/google/android/libraries/places/internal/zzaid;

    .line 61
    .line 62
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzaid;-><init>()V

    .line 63
    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_6
    const-string v0, "zzf"

    .line 67
    .line 68
    const-string v1, "zzg"

    .line 69
    .line 70
    sget-object v2, Lcom/google/android/libraries/places/internal/zzaic;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 71
    .line 72
    const-string v3, "zzh"

    .line 73
    .line 74
    const-string v4, "zzi"

    .line 75
    .line 76
    const-string v5, "zzj"

    .line 77
    .line 78
    const-string v6, "zzk"

    .line 79
    .line 80
    const-string v7, "zzl"

    .line 81
    .line 82
    const-string v8, "zzm"

    .line 83
    .line 84
    const-string v9, "zzn"

    .line 85
    .line 86
    filled-new-array/range {v0 .. v9}, [Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    sget-object p1, Lcom/google/android/libraries/places/internal/zzaid;->zzb:Lcom/google/android/libraries/places/internal/zzaid;

    .line 91
    .line 92
    const-string p2, "\u0001\u0008\u0000\u0001\u0001\u0008\u0008\u0000\u0001\u0000\u0001\u180c\u0000\u0002\u1008\u0001\u0003\u1007\u0002\u0004\u1000\u0003\u0005\u1004\u0004\u0006\'\u0007\u1007\u0005\u0008\u1009\u0006"

    .line 93
    .line 94
    invoke-static {p1, p2, p0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaB(Lcom/google/android/libraries/places/internal/zzavf;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0

    .line 99
    :cond_7
    const/4 p0, 0x1

    .line 100
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    return-object p0
.end method
