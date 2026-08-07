.class public final Lcom/google/android/libraries/places/internal/zzaqz;
.super Lcom/google/android/libraries/places/internal/zzatu;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavg;


# static fields
.field private static final zzb:Lcom/google/android/libraries/places/internal/zzaua;

.field private static final zze:Lcom/google/android/libraries/places/internal/zzaqz;

.field private static volatile zzf:Lcom/google/android/libraries/places/internal/zzavn;


# instance fields
.field private zzg:I

.field private zzh:Ljava/lang/String;

.field private zzi:Ljava/lang/String;

.field private zzj:Lcom/google/android/libraries/places/internal/zzauc;

.field private zzk:Lcom/google/android/libraries/places/internal/zzauc;

.field private zzl:Lcom/google/android/libraries/places/internal/zzauc;

.field private zzm:Lcom/google/android/libraries/places/internal/zzauc;

.field private zzn:I

.field private zzo:Lcom/google/android/libraries/places/internal/zzaqy;

.field private zzp:I

.field private zzq:Lcom/google/android/libraries/places/internal/zzaqn;

.field private zzr:Z

.field private zzs:D

.field private zzt:Lcom/google/android/libraries/places/internal/zzatz;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzaqt;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzaqt;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzaqz;->zzb:Lcom/google/android/libraries/places/internal/zzaua;

    .line 7
    .line 8
    new-instance v0, Lcom/google/android/libraries/places/internal/zzaqz;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzaqz;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/google/android/libraries/places/internal/zzaqz;->zze:Lcom/google/android/libraries/places/internal/zzaqz;

    .line 14
    .line 15
    const-class v1, Lcom/google/android/libraries/places/internal/zzaqz;

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaE(Ljava/lang/Class;Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 18
    .line 19
    .line 20
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
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzh:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzi:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzatu;->zzax()Lcom/google/android/libraries/places/internal/zzauc;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzj:Lcom/google/android/libraries/places/internal/zzauc;

    .line 15
    .line 16
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzatu;->zzax()Lcom/google/android/libraries/places/internal/zzauc;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzk:Lcom/google/android/libraries/places/internal/zzauc;

    .line 21
    .line 22
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzatu;->zzax()Lcom/google/android/libraries/places/internal/zzauc;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzl:Lcom/google/android/libraries/places/internal/zzauc;

    .line 27
    .line 28
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzatu;->zzax()Lcom/google/android/libraries/places/internal/zzauc;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzm:Lcom/google/android/libraries/places/internal/zzauc;

    .line 33
    .line 34
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzatu;->zzau()Lcom/google/android/libraries/places/internal/zzatz;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzt:Lcom/google/android/libraries/places/internal/zzatz;

    .line 39
    .line 40
    return-void
.end method

.method public static zza()Lcom/google/android/libraries/places/internal/zzaqu;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaqz;->zze:Lcom/google/android/libraries/places/internal/zzaqz;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzar()Lcom/google/android/libraries/places/internal/zzato;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/android/libraries/places/internal/zzaqu;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic zzc()Lcom/google/android/libraries/places/internal/zzaqz;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzaqz;->zze:Lcom/google/android/libraries/places/internal/zzaqz;

    return-object v0
.end method

.method public static zzd()Lcom/google/android/libraries/places/internal/zzaqz;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzaqz;->zze:Lcom/google/android/libraries/places/internal/zzaqz;

    return-object v0
.end method

.method public static synthetic zze(Lcom/google/android/libraries/places/internal/zzaqz;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzh:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic zzf(Lcom/google/android/libraries/places/internal/zzaqz;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzi:Ljava/lang/String;

    return-void
.end method

.method public static synthetic zzg(Lcom/google/android/libraries/places/internal/zzaqz;Ljava/lang/Iterable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzj:Lcom/google/android/libraries/places/internal/zzauc;

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
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzay(Lcom/google/android/libraries/places/internal/zzauc;)Lcom/google/android/libraries/places/internal/zzauc;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzj:Lcom/google/android/libraries/places/internal/zzauc;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzj:Lcom/google/android/libraries/places/internal/zzauc;

    .line 16
    .line 17
    invoke-static {p1, p0}, Lcom/google/android/libraries/places/internal/zzart;->zzam(Ljava/lang/Iterable;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic zzh(Lcom/google/android/libraries/places/internal/zzaqz;Ljava/lang/Iterable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzk:Lcom/google/android/libraries/places/internal/zzauc;

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
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzay(Lcom/google/android/libraries/places/internal/zzauc;)Lcom/google/android/libraries/places/internal/zzauc;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzk:Lcom/google/android/libraries/places/internal/zzauc;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzk:Lcom/google/android/libraries/places/internal/zzauc;

    .line 16
    .line 17
    invoke-static {p1, p0}, Lcom/google/android/libraries/places/internal/zzart;->zzam(Ljava/lang/Iterable;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic zzi(Lcom/google/android/libraries/places/internal/zzaqz;Ljava/lang/Iterable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzl:Lcom/google/android/libraries/places/internal/zzauc;

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
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzay(Lcom/google/android/libraries/places/internal/zzauc;)Lcom/google/android/libraries/places/internal/zzauc;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzl:Lcom/google/android/libraries/places/internal/zzauc;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzl:Lcom/google/android/libraries/places/internal/zzauc;

    .line 16
    .line 17
    invoke-static {p1, p0}, Lcom/google/android/libraries/places/internal/zzart;->zzam(Ljava/lang/Iterable;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic zzj(Lcom/google/android/libraries/places/internal/zzaqz;Ljava/lang/Iterable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzm:Lcom/google/android/libraries/places/internal/zzauc;

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
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzay(Lcom/google/android/libraries/places/internal/zzauc;)Lcom/google/android/libraries/places/internal/zzauc;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzm:Lcom/google/android/libraries/places/internal/zzauc;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzm:Lcom/google/android/libraries/places/internal/zzauc;

    .line 16
    .line 17
    invoke-static {p1, p0}, Lcom/google/android/libraries/places/internal/zzart;->zzam(Ljava/lang/Iterable;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic zzk(Lcom/google/android/libraries/places/internal/zzaqz;I)V
    .locals 0

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzn:I

    return-void
.end method

.method public static synthetic zzl(Lcom/google/android/libraries/places/internal/zzaqz;Lcom/google/android/libraries/places/internal/zzaqy;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzo:Lcom/google/android/libraries/places/internal/zzaqy;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzg:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzg:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic zzm(Lcom/google/android/libraries/places/internal/zzaqz;I)V
    .locals 0

    add-int/lit8 p1, p1, -0x2

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzp:I

    return-void
.end method


# virtual methods
.method public final zzb(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14

    .line 1
    add-int/lit8 p0, p1, -0x1

    .line 2
    .line 3
    if-eqz p0, :cond_7

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    if-eq p0, v0, :cond_6

    .line 7
    .line 8
    const/4 v0, 0x3

    .line 9
    if-eq p0, v0, :cond_5

    .line 10
    .line 11
    const/4 v0, 0x4

    .line 12
    const/4 v1, 0x0

    .line 13
    if-eq p0, v0, :cond_4

    .line 14
    .line 15
    const/4 v0, 0x5

    .line 16
    if-eq p0, v0, :cond_3

    .line 17
    .line 18
    const/4 v0, 0x6

    .line 19
    if-eq p0, v0, :cond_0

    .line 20
    .line 21
    return-object v1

    .line 22
    :cond_0
    sget-object p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzf:Lcom/google/android/libraries/places/internal/zzavn;

    .line 23
    .line 24
    if-nez p0, :cond_2

    .line 25
    .line 26
    const-class v1, Lcom/google/android/libraries/places/internal/zzaqz;

    .line 27
    .line 28
    monitor-enter v1

    .line 29
    :try_start_0
    sget-object p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzf:Lcom/google/android/libraries/places/internal/zzavn;

    .line 30
    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    new-instance p0, Lcom/google/android/libraries/places/internal/zzatp;

    .line 34
    .line 35
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaqz;->zze:Lcom/google/android/libraries/places/internal/zzaqz;

    .line 36
    .line 37
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzatp;-><init>(Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 38
    .line 39
    .line 40
    sput-object p0, Lcom/google/android/libraries/places/internal/zzaqz;->zzf:Lcom/google/android/libraries/places/internal/zzavn;

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
    monitor-exit v1

    .line 47
    return-object p0

    .line 48
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    throw p0

    .line 50
    :cond_2
    return-object p0

    .line 51
    :cond_3
    sget-object p0, Lcom/google/android/libraries/places/internal/zzaqz;->zze:Lcom/google/android/libraries/places/internal/zzaqz;

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_4
    new-instance p0, Lcom/google/android/libraries/places/internal/zzaqu;

    .line 55
    .line 56
    invoke-direct {p0, v1}, Lcom/google/android/libraries/places/internal/zzaqu;-><init>(Lcom/google/android/libraries/places/internal/zzaqt;)V

    .line 57
    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_5
    new-instance p0, Lcom/google/android/libraries/places/internal/zzaqz;

    .line 61
    .line 62
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzaqz;-><init>()V

    .line 63
    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_6
    const-string v0, "zzg"

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
    const-string v10, "zzq"

    .line 87
    .line 88
    const-string v11, "zzr"

    .line 89
    .line 90
    const-string v12, "zzs"

    .line 91
    .line 92
    const-string v13, "zzt"

    .line 93
    .line 94
    filled-new-array/range {v0 .. v13}, [Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaqz;->zze:Lcom/google/android/libraries/places/internal/zzaqz;

    .line 99
    .line 100
    const-string v1, "\u0000\r\u0000\u0001\u0001\r\r\u0000\u0005\u0000\u0001\u0208\u0002\u0208\u0003\u021a\u0004\u021a\u0005\u021a\u0006\u021a\u0007\u0004\u0008\u1009\u0000\t\u000c\n\u1009\u0001\u000b\u0007\u000c\u0000\r,"

    .line 101
    .line 102
    invoke-static {v0, v1, p0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaB(Lcom/google/android/libraries/places/internal/zzavf;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    return-object p0

    .line 107
    :cond_7
    const/4 p0, 0x1

    .line 108
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0
.end method
