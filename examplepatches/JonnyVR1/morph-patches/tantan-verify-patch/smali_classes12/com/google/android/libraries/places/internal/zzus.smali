.class public final Lcom/google/android/libraries/places/internal/zzus;
.super Lcom/google/android/libraries/places/internal/zzatu;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavg;


# static fields
.field private static final zzb:Lcom/google/android/libraries/places/internal/zzus;

.field private static volatile zze:Lcom/google/android/libraries/places/internal/zzavn;


# instance fields
.field private zzf:I

.field private zzg:I

.field private zzh:Lcom/google/android/libraries/places/internal/zzuu;

.field private zzi:Lcom/google/android/libraries/places/internal/zzuw;

.field private zzj:Lcom/google/android/libraries/places/internal/zzali;

.field private zzk:Lcom/google/android/libraries/places/internal/zzvc;

.field private zzl:Lcom/google/android/libraries/places/internal/zzvi;

.field private zzm:Lcom/google/android/libraries/places/internal/zzve;

.field private zzn:Lcom/google/android/libraries/places/internal/zzuy;

.field private zzo:B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzus;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzus;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzus;->zzb:Lcom/google/android/libraries/places/internal/zzus;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/libraries/places/internal/zzus;

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
    iput-byte v0, p0, Lcom/google/android/libraries/places/internal/zzus;->zzo:B

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzus;->zzg:I

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic zza()Lcom/google/android/libraries/places/internal/zzus;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzus;->zzb:Lcom/google/android/libraries/places/internal/zzus;

    return-object v0
.end method


# virtual methods
.method public final zzb(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

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
    iput-byte p1, p0, Lcom/google/android/libraries/places/internal/zzus;->zzo:B

    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_1
    sget-object p0, Lcom/google/android/libraries/places/internal/zzus;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 30
    .line 31
    if-nez p0, :cond_3

    .line 32
    .line 33
    const-class p1, Lcom/google/android/libraries/places/internal/zzus;

    .line 34
    .line 35
    monitor-enter p1

    .line 36
    :try_start_0
    sget-object p0, Lcom/google/android/libraries/places/internal/zzus;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 37
    .line 38
    if-nez p0, :cond_2

    .line 39
    .line 40
    new-instance p0, Lcom/google/android/libraries/places/internal/zzatp;

    .line 41
    .line 42
    sget-object p2, Lcom/google/android/libraries/places/internal/zzus;->zzb:Lcom/google/android/libraries/places/internal/zzus;

    .line 43
    .line 44
    invoke-direct {p0, p2}, Lcom/google/android/libraries/places/internal/zzatp;-><init>(Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 45
    .line 46
    .line 47
    sput-object p0, Lcom/google/android/libraries/places/internal/zzus;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :catchall_0
    move-exception v0

    .line 51
    move-object p0, v0

    .line 52
    goto :goto_2

    .line 53
    :cond_2
    :goto_1
    monitor-exit p1

    .line 54
    return-object p0

    .line 55
    :goto_2
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    throw p0

    .line 57
    :cond_3
    return-object p0

    .line 58
    :cond_4
    sget-object p0, Lcom/google/android/libraries/places/internal/zzus;->zzb:Lcom/google/android/libraries/places/internal/zzus;

    .line 59
    .line 60
    return-object p0

    .line 61
    :cond_5
    new-instance p0, Lcom/google/android/libraries/places/internal/zzuq;

    .line 62
    .line 63
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzuq;-><init>(Lcom/google/android/libraries/places/internal/zzup;)V

    .line 64
    .line 65
    .line 66
    return-object p0

    .line 67
    :cond_6
    new-instance p0, Lcom/google/android/libraries/places/internal/zzus;

    .line 68
    .line 69
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzus;-><init>()V

    .line 70
    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_7
    const-string v0, "zzf"

    .line 74
    .line 75
    const-string v1, "zzg"

    .line 76
    .line 77
    sget-object v2, Lcom/google/android/libraries/places/internal/zzur;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 78
    .line 79
    const-string v3, "zzh"

    .line 80
    .line 81
    const-string v4, "zzi"

    .line 82
    .line 83
    const-string v5, "zzj"

    .line 84
    .line 85
    const-string v6, "zzk"

    .line 86
    .line 87
    const-string v7, "zzl"

    .line 88
    .line 89
    const-string v8, "zzm"

    .line 90
    .line 91
    const-string v9, "zzn"

    .line 92
    .line 93
    filled-new-array/range {v0 .. v9}, [Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    sget-object p1, Lcom/google/android/libraries/places/internal/zzus;->zzb:Lcom/google/android/libraries/places/internal/zzus;

    .line 98
    .line 99
    const-string p2, "\u0001\u0008\u0000\u0001\u0001\u0008\u0008\u0000\u0000\u0001\u0001\u180c\u0000\u0002\u1009\u0001\u0003\u1009\u0002\u0004\u1409\u0003\u0005\u1009\u0004\u0006\u1009\u0005\u0007\u1009\u0006\u0008\u1009\u0007"

    .line 100
    .line 101
    invoke-static {p1, p2, p0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaB(Lcom/google/android/libraries/places/internal/zzavf;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    return-object p0

    .line 106
    :cond_8
    iget-byte p0, p0, Lcom/google/android/libraries/places/internal/zzus;->zzo:B

    .line 107
    .line 108
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0
.end method
