.class public final Lcom/google/android/libraries/places/internal/zzal;
.super Lcom/google/android/libraries/places/internal/zzatu;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavg;


# static fields
.field private static final zzb:Lcom/google/android/libraries/places/internal/zzal;

.field private static volatile zze:Lcom/google/android/libraries/places/internal/zzavn;


# instance fields
.field private zzf:I

.field private zzg:I

.field private zzh:J

.field private zzi:J

.field private zzj:J

.field private zzk:F

.field private zzl:Z

.field private zzm:Lcom/google/android/libraries/places/internal/zzauc;

.field private zzn:Lcom/google/android/libraries/places/internal/zzauc;

.field private zzo:Lcom/google/android/libraries/places/internal/zzauc;

.field private zzp:I

.field private zzq:I

.field private zzr:I

.field private zzs:I

.field private zzt:I

.field private zzu:I

.field private zzv:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzal;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzal;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzal;->zzb:Lcom/google/android/libraries/places/internal/zzal;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/libraries/places/internal/zzal;

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
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzatu;->zzax()Lcom/google/android/libraries/places/internal/zzauc;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzal;->zzm:Lcom/google/android/libraries/places/internal/zzauc;

    .line 9
    .line 10
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzatu;->zzax()Lcom/google/android/libraries/places/internal/zzauc;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzal;->zzn:Lcom/google/android/libraries/places/internal/zzauc;

    .line 15
    .line 16
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzatu;->zzax()Lcom/google/android/libraries/places/internal/zzauc;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzal;->zzo:Lcom/google/android/libraries/places/internal/zzauc;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic zza()Lcom/google/android/libraries/places/internal/zzal;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzal;->zzb:Lcom/google/android/libraries/places/internal/zzal;

    return-object v0
.end method


# virtual methods
.method public final zzb(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 22

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
    sget-object v0, Lcom/google/android/libraries/places/internal/zzal;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    const-class v1, Lcom/google/android/libraries/places/internal/zzal;

    .line 27
    .line 28
    monitor-enter v1

    .line 29
    :try_start_0
    sget-object v0, Lcom/google/android/libraries/places/internal/zzal;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    new-instance v0, Lcom/google/android/libraries/places/internal/zzatp;

    .line 34
    .line 35
    sget-object v2, Lcom/google/android/libraries/places/internal/zzal;->zzb:Lcom/google/android/libraries/places/internal/zzal;

    .line 36
    .line 37
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzatp;-><init>(Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/google/android/libraries/places/internal/zzal;->zze:Lcom/google/android/libraries/places/internal/zzavn;

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
    sget-object v0, Lcom/google/android/libraries/places/internal/zzal;->zzb:Lcom/google/android/libraries/places/internal/zzal;

    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_4
    new-instance v0, Lcom/google/android/libraries/places/internal/zzak;

    .line 54
    .line 55
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzak;-><init>(Lcom/google/android/libraries/places/internal/zzaj;)V

    .line 56
    .line 57
    .line 58
    return-object v0

    .line 59
    :cond_5
    new-instance v0, Lcom/google/android/libraries/places/internal/zzal;

    .line 60
    .line 61
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzal;-><init>()V

    .line 62
    .line 63
    .line 64
    return-object v0

    .line 65
    :cond_6
    const-string v2, "zzf"

    .line 66
    .line 67
    const-string v3, "zzg"

    .line 68
    .line 69
    sget-object v4, Lcom/google/android/libraries/places/internal/zzas;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 70
    .line 71
    const-string v5, "zzh"

    .line 72
    .line 73
    const-string v6, "zzi"

    .line 74
    .line 75
    const-string v7, "zzj"

    .line 76
    .line 77
    const-string v8, "zzk"

    .line 78
    .line 79
    const-string v9, "zzl"

    .line 80
    .line 81
    const-string v10, "zzm"

    .line 82
    .line 83
    const-string v11, "zzn"

    .line 84
    .line 85
    const-class v12, Lcom/google/android/libraries/places/internal/zzar;

    .line 86
    .line 87
    const-string v13, "zzo"

    .line 88
    .line 89
    const-class v14, Lcom/google/android/libraries/places/internal/zzar;

    .line 90
    .line 91
    const-string v15, "zzp"

    .line 92
    .line 93
    const-string v16, "zzv"

    .line 94
    .line 95
    const-string v17, "zzu"

    .line 96
    .line 97
    const-string v18, "zzq"

    .line 98
    .line 99
    const-string v19, "zzr"

    .line 100
    .line 101
    const-string v20, "zzs"

    .line 102
    .line 103
    const-string v21, "zzt"

    .line 104
    .line 105
    filled-new-array/range {v2 .. v21}, [Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    sget-object v1, Lcom/google/android/libraries/places/internal/zzal;->zzb:Lcom/google/android/libraries/places/internal/zzal;

    .line 110
    .line 111
    const-string v2, "\u0001\u0010\u0000\u0001\u0001\u0010\u0010\u0000\u0003\u0000\u0001\u180c\u0000\u0002\u1002\u0001\u0003\u1002\u0002\u0004\u1002\u0003\u0005\u1001\u0004\u0006\u1007\u0005\u0007\u001a\u0008\u001b\t\u001b\n\u1004\u0006\u000b\u1002\u000c\u000c\u1004\u000b\r\u1004\u0007\u000e\u1004\u0008\u000f\u1004\t\u0010\u1004\n"

    .line 112
    .line 113
    invoke-static {v1, v2, v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaB(Lcom/google/android/libraries/places/internal/zzavf;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    return-object v0

    .line 118
    :cond_7
    const/4 v0, 0x1

    .line 119
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    return-object v0
.end method
