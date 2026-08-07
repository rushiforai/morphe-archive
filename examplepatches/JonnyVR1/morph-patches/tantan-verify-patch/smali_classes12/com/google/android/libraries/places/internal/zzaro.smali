.class public final Lcom/google/android/libraries/places/internal/zzaro;
.super Lcom/google/android/libraries/places/internal/zzatu;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavg;


# static fields
.field private static final zzb:Lcom/google/android/libraries/places/internal/zzaua;

.field private static final zze:Lcom/google/android/libraries/places/internal/zzaro;

.field private static volatile zzf:Lcom/google/android/libraries/places/internal/zzavn;


# instance fields
.field private zzg:I

.field private zzh:Ljava/lang/String;

.field private zzi:Ljava/lang/String;

.field private zzj:Ljava/lang/String;

.field private zzk:I

.field private zzl:Ljava/lang/String;

.field private zzm:Z

.field private zzn:D

.field private zzo:I

.field private zzp:I

.field private zzq:Ljava/lang/String;

.field private zzr:Lcom/google/android/libraries/places/internal/zzatz;

.field private zzs:Z

.field private zzt:Lcom/google/android/libraries/places/internal/zzarj;

.field private zzu:Lcom/google/android/libraries/places/internal/zzarl;

.field private zzv:Lcom/google/android/libraries/places/internal/zzarh;

.field private zzw:Lcom/google/android/libraries/places/internal/zzaqn;

.field private zzx:Lcom/google/android/libraries/places/internal/zzarn;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzard;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzard;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzaro;->zzb:Lcom/google/android/libraries/places/internal/zzaua;

    .line 7
    .line 8
    new-instance v0, Lcom/google/android/libraries/places/internal/zzaro;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzaro;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/google/android/libraries/places/internal/zzaro;->zze:Lcom/google/android/libraries/places/internal/zzaro;

    .line 14
    .line 15
    const-class v1, Lcom/google/android/libraries/places/internal/zzaro;

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
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzh:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzi:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzj:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzl:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzq:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzatu;->zzau()Lcom/google/android/libraries/places/internal/zzatz;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzr:Lcom/google/android/libraries/places/internal/zzatz;

    .line 21
    .line 22
    return-void
.end method

.method public static zza()Lcom/google/android/libraries/places/internal/zzare;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaro;->zze:Lcom/google/android/libraries/places/internal/zzaro;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzar()Lcom/google/android/libraries/places/internal/zzato;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/android/libraries/places/internal/zzare;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic zzc()Lcom/google/android/libraries/places/internal/zzaro;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzaro;->zze:Lcom/google/android/libraries/places/internal/zzaro;

    return-object v0
.end method

.method public static zzd()Lcom/google/android/libraries/places/internal/zzaro;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzaro;->zze:Lcom/google/android/libraries/places/internal/zzaro;

    return-object v0
.end method

.method public static synthetic zze(Lcom/google/android/libraries/places/internal/zzaro;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzh:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic zzf(Lcom/google/android/libraries/places/internal/zzaro;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzi:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic zzg(Lcom/google/android/libraries/places/internal/zzaro;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzj:Ljava/lang/String;

    return-void
.end method

.method public static synthetic zzh(Lcom/google/android/libraries/places/internal/zzaro;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzl:Ljava/lang/String;

    return-void
.end method

.method public static synthetic zzi(Lcom/google/android/libraries/places/internal/zzaro;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzm:Z

    return-void
.end method

.method public static synthetic zzj(Lcom/google/android/libraries/places/internal/zzaro;D)V
    .locals 0

    iput-wide p1, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzn:D

    return-void
.end method

.method public static synthetic zzk(Lcom/google/android/libraries/places/internal/zzaro;I)V
    .locals 0

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzo:I

    return-void
.end method

.method public static synthetic zzl(Lcom/google/android/libraries/places/internal/zzaro;Ljava/lang/Iterable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzr:Lcom/google/android/libraries/places/internal/zzatz;

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
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzr:Lcom/google/android/libraries/places/internal/zzatz;

    .line 14
    .line 15
    :cond_0
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/google/android/libraries/places/internal/zzaqb;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzr:Lcom/google/android/libraries/places/internal/zzatz;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzaqb;->zza()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-interface {v1, v0}, Lcom/google/android/libraries/places/internal/zzatz;->zzh(I)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-void
.end method

.method public static synthetic zzm(Lcom/google/android/libraries/places/internal/zzaro;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzs:Z

    return-void
.end method

.method public static synthetic zzn(Lcom/google/android/libraries/places/internal/zzaro;Lcom/google/android/libraries/places/internal/zzarj;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzt:Lcom/google/android/libraries/places/internal/zzarj;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzg:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzg:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic zzo(Lcom/google/android/libraries/places/internal/zzaro;Lcom/google/android/libraries/places/internal/zzarl;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzu:Lcom/google/android/libraries/places/internal/zzarl;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzg:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x2

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzg:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic zzp(Lcom/google/android/libraries/places/internal/zzaro;I)V
    .locals 0

    add-int/lit8 p1, p1, -0x2

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaro;->zzk:I

    return-void
.end method


# virtual methods
.method public final zzb(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 20

    .line 1
    add-int/lit8 v0, p1, -0x1

    .line 2
    .line 3
    if-eqz v0, :cond_7

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    if-eq v0, v1, :cond_6

    .line 7
    .line 8
    const/4 v1, 0x3

    .line 9
    if-eq v0, v1, :cond_5

    .line 10
    .line 11
    const/4 v1, 0x4

    .line 12
    const/4 v2, 0x0

    .line 13
    if-eq v0, v1, :cond_4

    .line 14
    .line 15
    const/4 v1, 0x5

    .line 16
    if-eq v0, v1, :cond_3

    .line 17
    .line 18
    const/4 v1, 0x6

    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    return-object v2

    .line 22
    :cond_0
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaro;->zzf:Lcom/google/android/libraries/places/internal/zzavn;

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    const-class v1, Lcom/google/android/libraries/places/internal/zzaro;

    .line 27
    .line 28
    monitor-enter v1

    .line 29
    :try_start_0
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaro;->zzf:Lcom/google/android/libraries/places/internal/zzavn;

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    new-instance v0, Lcom/google/android/libraries/places/internal/zzatp;

    .line 34
    .line 35
    sget-object v2, Lcom/google/android/libraries/places/internal/zzaro;->zze:Lcom/google/android/libraries/places/internal/zzaro;

    .line 36
    .line 37
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzatp;-><init>(Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/google/android/libraries/places/internal/zzaro;->zzf:Lcom/google/android/libraries/places/internal/zzavn;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception v0

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    :goto_0
    monitor-exit v1

    .line 46
    return-object v0

    .line 47
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    throw v0

    .line 49
    :cond_2
    return-object v0

    .line 50
    :cond_3
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaro;->zze:Lcom/google/android/libraries/places/internal/zzaro;

    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_4
    new-instance v0, Lcom/google/android/libraries/places/internal/zzare;

    .line 54
    .line 55
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzare;-><init>(Lcom/google/android/libraries/places/internal/zzard;)V

    .line 56
    .line 57
    .line 58
    return-object v0

    .line 59
    :cond_5
    new-instance v0, Lcom/google/android/libraries/places/internal/zzaro;

    .line 60
    .line 61
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzaro;-><init>()V

    .line 62
    .line 63
    .line 64
    return-object v0

    .line 65
    :cond_6
    const-string v2, "zzg"

    .line 66
    .line 67
    const-string v3, "zzh"

    .line 68
    .line 69
    const-string v4, "zzi"

    .line 70
    .line 71
    const-string v5, "zzj"

    .line 72
    .line 73
    const-string v6, "zzk"

    .line 74
    .line 75
    const-string v7, "zzl"

    .line 76
    .line 77
    const-string v8, "zzm"

    .line 78
    .line 79
    const-string v9, "zzn"

    .line 80
    .line 81
    const-string v10, "zzo"

    .line 82
    .line 83
    const-string v11, "zzr"

    .line 84
    .line 85
    const-string v12, "zzs"

    .line 86
    .line 87
    const-string v13, "zzt"

    .line 88
    .line 89
    const-string v14, "zzu"

    .line 90
    .line 91
    const-string v15, "zzv"

    .line 92
    .line 93
    const-string v16, "zzw"

    .line 94
    .line 95
    const-string v17, "zzx"

    .line 96
    .line 97
    const-string v18, "zzp"

    .line 98
    .line 99
    const-string v19, "zzq"

    .line 100
    .line 101
    filled-new-array/range {v2 .. v19}, [Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    sget-object v1, Lcom/google/android/libraries/places/internal/zzaro;->zze:Lcom/google/android/libraries/places/internal/zzaro;

    .line 106
    .line 107
    const-string v2, "\u0000\u0011\u0000\u0001\u0001\u0013\u0011\u0000\u0001\u0000\u0001\u0208\u0002\u0208\u0003\u0208\u0004\u000c\u0006\u0208\u0007\u0007\t\u0000\n\u0004\u000b,\u000c\u0007\r\u1009\u0000\u000e\u1009\u0001\u000f\u1009\u0002\u0010\u1009\u0003\u0011\u1009\u0004\u0012\u0004\u0013\u0208"

    .line 108
    .line 109
    invoke-static {v1, v2, v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaB(Lcom/google/android/libraries/places/internal/zzavf;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    return-object v0

    .line 114
    :cond_7
    const/4 v0, 0x1

    .line 115
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    return-object v0
.end method
