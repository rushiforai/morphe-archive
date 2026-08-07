.class public final Lcom/google/android/libraries/places/internal/zzafj;
.super Lcom/google/android/libraries/places/internal/zzatu;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavg;


# static fields
.field private static final zzb:Lcom/google/android/libraries/places/internal/zzafj;

.field private static volatile zze:Lcom/google/android/libraries/places/internal/zzavn;


# instance fields
.field private zzf:I

.field private zzg:Ljava/lang/String;

.field private zzh:Ljava/lang/String;

.field private zzi:Lcom/google/android/libraries/places/internal/zzafe;

.field private zzj:Lcom/google/android/libraries/places/internal/zzwf;

.field private zzk:I

.field private zzl:Ljava/lang/String;

.field private zzm:I

.field private zzn:I

.field private zzo:Ljava/lang/String;

.field private zzp:I

.field private zzq:B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzafj;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzafj;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzafj;->zzb:Lcom/google/android/libraries/places/internal/zzafj;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/libraries/places/internal/zzafj;

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
    const/4 v0, 0x2

    .line 5
    iput-byte v0, p0, Lcom/google/android/libraries/places/internal/zzafj;->zzq:B

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzafj;->zzg:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzafj;->zzh:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    iput v1, p0, Lcom/google/android/libraries/places/internal/zzafj;->zzk:I

    .line 15
    .line 16
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzafj;->zzl:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzafj;->zzo:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic zza()Lcom/google/android/libraries/places/internal/zzafj;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzafj;->zzb:Lcom/google/android/libraries/places/internal/zzafj;

    return-object v0
.end method


# virtual methods
.method public final zzb(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14

    .line 1
    add-int/lit8 v0, p1, -0x1

    .line 2
    .line 3
    if-eqz v0, :cond_8

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    if-eq v0, v1, :cond_7

    .line 7
    .line 8
    const/4 v1, 0x3

    .line 9
    if-eq v0, v1, :cond_6

    .line 10
    .line 11
    const/4 v1, 0x4

    .line 12
    const/4 v2, 0x0

    .line 13
    if-eq v0, v1, :cond_5

    .line 14
    .line 15
    const/4 v1, 0x5

    .line 16
    if-eq v0, v1, :cond_4

    .line 17
    .line 18
    const/4 v1, 0x6

    .line 19
    if-eq v0, v1, :cond_1

    .line 20
    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v0, 0x1

    .line 26
    :goto_0
    iput-byte v0, p0, Lcom/google/android/libraries/places/internal/zzafj;->zzq:B

    .line 27
    .line 28
    return-object v2

    .line 29
    :cond_1
    sget-object p0, Lcom/google/android/libraries/places/internal/zzafj;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 30
    .line 31
    if-nez p0, :cond_3

    .line 32
    .line 33
    const-class v1, Lcom/google/android/libraries/places/internal/zzafj;

    .line 34
    .line 35
    monitor-enter v1

    .line 36
    :try_start_0
    sget-object p0, Lcom/google/android/libraries/places/internal/zzafj;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 37
    .line 38
    if-nez p0, :cond_2

    .line 39
    .line 40
    new-instance p0, Lcom/google/android/libraries/places/internal/zzatp;

    .line 41
    .line 42
    sget-object v0, Lcom/google/android/libraries/places/internal/zzafj;->zzb:Lcom/google/android/libraries/places/internal/zzafj;

    .line 43
    .line 44
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzatp;-><init>(Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 45
    .line 46
    .line 47
    sput-object p0, Lcom/google/android/libraries/places/internal/zzafj;->zze:Lcom/google/android/libraries/places/internal/zzavn;

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
    monitor-exit v1

    .line 54
    return-object p0

    .line 55
    :goto_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    throw p0

    .line 57
    :cond_3
    return-object p0

    .line 58
    :cond_4
    sget-object p0, Lcom/google/android/libraries/places/internal/zzafj;->zzb:Lcom/google/android/libraries/places/internal/zzafj;

    .line 59
    .line 60
    return-object p0

    .line 61
    :cond_5
    new-instance p0, Lcom/google/android/libraries/places/internal/zzaff;

    .line 62
    .line 63
    invoke-direct {p0, v2}, Lcom/google/android/libraries/places/internal/zzaff;-><init>(Lcom/google/android/libraries/places/internal/zzadu;)V

    .line 64
    .line 65
    .line 66
    return-object p0

    .line 67
    :cond_6
    new-instance p0, Lcom/google/android/libraries/places/internal/zzafj;

    .line 68
    .line 69
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzafj;-><init>()V

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
    const-string v2, "zzh"

    .line 78
    .line 79
    const-string v3, "zzi"

    .line 80
    .line 81
    const-string v4, "zzj"

    .line 82
    .line 83
    const-string v5, "zzk"

    .line 84
    .line 85
    sget-object v6, Lcom/google/android/libraries/places/internal/zzafg;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 86
    .line 87
    const-string v7, "zzl"

    .line 88
    .line 89
    const-string v8, "zzm"

    .line 90
    .line 91
    sget-object v9, Lcom/google/android/libraries/places/internal/zzafi;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 92
    .line 93
    const-string v10, "zzn"

    .line 94
    .line 95
    const-string v11, "zzo"

    .line 96
    .line 97
    const-string v12, "zzp"

    .line 98
    .line 99
    sget-object v13, Lcom/google/android/libraries/places/internal/zzafh;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 100
    .line 101
    filled-new-array/range {v0 .. v13}, [Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    sget-object v0, Lcom/google/android/libraries/places/internal/zzafj;->zzb:Lcom/google/android/libraries/places/internal/zzafj;

    .line 106
    .line 107
    const-string v1, "\u0001\n\u0000\u0001\u0001\n\n\u0000\u0000\u0001\u0001\u1008\u0000\u0002\u1008\u0001\u0003\u1009\u0002\u0004\u1409\u0003\u0005\u180c\u0004\u0006\u1008\u0005\u0007\u180c\u0006\u0008\u1004\u0007\t\u1008\u0008\n\u180c\t"

    .line 108
    .line 109
    invoke-static {v0, v1, p0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaB(Lcom/google/android/libraries/places/internal/zzavf;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    return-object p0

    .line 114
    :cond_8
    iget-byte p0, p0, Lcom/google/android/libraries/places/internal/zzafj;->zzq:B

    .line 115
    .line 116
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    return-object p0
.end method
