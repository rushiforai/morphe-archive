.class public final Lcom/google/android/libraries/places/internal/zzaly;
.super Lcom/google/android/libraries/places/internal/zzatu;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavg;


# static fields
.field private static final zzb:Lcom/google/android/libraries/places/internal/zzaly;

.field private static volatile zze:Lcom/google/android/libraries/places/internal/zzavn;


# instance fields
.field private zzf:I

.field private zzg:Ljava/lang/String;

.field private zzh:Lcom/google/android/libraries/places/internal/zzalv;

.field private zzi:Lcom/google/android/libraries/places/internal/zzalx;

.field private zzj:Lcom/google/android/libraries/places/internal/zzauc;

.field private zzk:Lcom/google/android/libraries/places/internal/zzauc;

.field private zzl:Ljava/lang/String;

.field private zzm:Ljava/lang/String;

.field private zzn:Lcom/google/android/libraries/places/internal/zzaxp;

.field private zzo:I

.field private zzp:Z

.field private zzq:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzaly;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzaly;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzaly;->zzb:Lcom/google/android/libraries/places/internal/zzaly;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/libraries/places/internal/zzaly;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaE(Ljava/lang/Class;Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzatu;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzg:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzatu;->zzax()Lcom/google/android/libraries/places/internal/zzauc;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzj:Lcom/google/android/libraries/places/internal/zzauc;

    .line 13
    .line 14
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzatu;->zzax()Lcom/google/android/libraries/places/internal/zzauc;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzk:Lcom/google/android/libraries/places/internal/zzauc;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzl:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzm:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzq:Ljava/lang/String;

    .line 25
    .line 26
    return-void
.end method

.method public static zza()Lcom/google/android/libraries/places/internal/zzalt;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaly;->zzb:Lcom/google/android/libraries/places/internal/zzaly;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzar()Lcom/google/android/libraries/places/internal/zzato;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/android/libraries/places/internal/zzalt;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic zzc()Lcom/google/android/libraries/places/internal/zzaly;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzaly;->zzb:Lcom/google/android/libraries/places/internal/zzaly;

    return-object v0
.end method

.method public static zzd()Lcom/google/android/libraries/places/internal/zzaly;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzaly;->zzb:Lcom/google/android/libraries/places/internal/zzaly;

    return-object v0
.end method

.method public static synthetic zze(Lcom/google/android/libraries/places/internal/zzaly;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzg:Ljava/lang/String;

    return-void
.end method

.method public static synthetic zzf(Lcom/google/android/libraries/places/internal/zzaly;Lcom/google/android/libraries/places/internal/zzalv;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzh:Lcom/google/android/libraries/places/internal/zzalv;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzf:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzf:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic zzg(Lcom/google/android/libraries/places/internal/zzaly;Lcom/google/android/libraries/places/internal/zzalx;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzi:Lcom/google/android/libraries/places/internal/zzalx;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzf:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x2

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzf:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic zzh(Lcom/google/android/libraries/places/internal/zzaly;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzj:Lcom/google/android/libraries/places/internal/zzauc;

    .line 5
    .line 6
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzauc;->zzc()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzay(Lcom/google/android/libraries/places/internal/zzauc;)Lcom/google/android/libraries/places/internal/zzauc;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzj:Lcom/google/android/libraries/places/internal/zzauc;

    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzj:Lcom/google/android/libraries/places/internal/zzauc;

    .line 19
    .line 20
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic zzi(Lcom/google/android/libraries/places/internal/zzaly;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzk:Lcom/google/android/libraries/places/internal/zzauc;

    .line 5
    .line 6
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzauc;->zzc()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzay(Lcom/google/android/libraries/places/internal/zzauc;)Lcom/google/android/libraries/places/internal/zzauc;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzk:Lcom/google/android/libraries/places/internal/zzauc;

    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzk:Lcom/google/android/libraries/places/internal/zzauc;

    .line 19
    .line 20
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic zzj(Lcom/google/android/libraries/places/internal/zzaly;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzm:Ljava/lang/String;

    return-void
.end method

.method public static synthetic zzk(Lcom/google/android/libraries/places/internal/zzaly;Lcom/google/android/libraries/places/internal/zzaxp;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzn:Lcom/google/android/libraries/places/internal/zzaxp;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzf:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x4

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzf:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic zzl(Lcom/google/android/libraries/places/internal/zzaly;I)V
    .locals 0

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzo:I

    return-void
.end method

.method public static synthetic zzm(Lcom/google/android/libraries/places/internal/zzaly;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaly;->zzq:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zzb(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12

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
    sget-object p0, Lcom/google/android/libraries/places/internal/zzaly;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 23
    .line 24
    if-nez p0, :cond_2

    .line 25
    .line 26
    const-class p1, Lcom/google/android/libraries/places/internal/zzaly;

    .line 27
    .line 28
    monitor-enter p1

    .line 29
    :try_start_0
    sget-object p0, Lcom/google/android/libraries/places/internal/zzaly;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 30
    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    new-instance p0, Lcom/google/android/libraries/places/internal/zzatp;

    .line 34
    .line 35
    sget-object p2, Lcom/google/android/libraries/places/internal/zzaly;->zzb:Lcom/google/android/libraries/places/internal/zzaly;

    .line 36
    .line 37
    invoke-direct {p0, p2}, Lcom/google/android/libraries/places/internal/zzatp;-><init>(Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 38
    .line 39
    .line 40
    sput-object p0, Lcom/google/android/libraries/places/internal/zzaly;->zze:Lcom/google/android/libraries/places/internal/zzavn;

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
    sget-object p0, Lcom/google/android/libraries/places/internal/zzaly;->zzb:Lcom/google/android/libraries/places/internal/zzaly;

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_4
    new-instance p0, Lcom/google/android/libraries/places/internal/zzalt;

    .line 55
    .line 56
    invoke-direct {p0, p2}, Lcom/google/android/libraries/places/internal/zzalt;-><init>(Lcom/google/android/libraries/places/internal/zzals;)V

    .line 57
    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_5
    new-instance p0, Lcom/google/android/libraries/places/internal/zzaly;

    .line 61
    .line 62
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzaly;-><init>()V

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
    const-string v2, "zzh"

    .line 71
    .line 72
    const-string v3, "zzi"

    .line 73
    .line 74
    const-string v4, "zzj"

    .line 75
    .line 76
    const-string v5, "zzk"

    .line 77
    .line 78
    const-string v6, "zzl"

    .line 79
    .line 80
    const-string v7, "zzm"

    .line 81
    .line 82
    const-string v8, "zzn"

    .line 83
    .line 84
    const-string v9, "zzo"

    .line 85
    .line 86
    const-string v10, "zzp"

    .line 87
    .line 88
    const-string v11, "zzq"

    .line 89
    .line 90
    filled-new-array/range {v0 .. v11}, [Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    sget-object p1, Lcom/google/android/libraries/places/internal/zzaly;->zzb:Lcom/google/android/libraries/places/internal/zzaly;

    .line 95
    .line 96
    const-string p2, "\u0000\u000b\u0000\u0001\u0001\u000b\u000b\u0000\u0002\u0000\u0001\u0208\u0002\u1009\u0000\u0003\u1009\u0001\u0004\u021a\u0005\u021a\u0006\u0208\u0007\u0208\u0008\u1009\u0002\t\u0004\n\u0007\u000b\u0208"

    .line 97
    .line 98
    invoke-static {p1, p2, p0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaB(Lcom/google/android/libraries/places/internal/zzavf;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    return-object p0

    .line 103
    :cond_7
    const/4 p0, 0x1

    .line 104
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    return-object p0
.end method
