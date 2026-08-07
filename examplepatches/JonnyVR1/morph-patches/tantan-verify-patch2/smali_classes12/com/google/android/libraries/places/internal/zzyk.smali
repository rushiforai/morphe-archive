.class public final Lcom/google/android/libraries/places/internal/zzyk;
.super Lcom/google/android/libraries/places/internal/zzatu;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavg;


# static fields
.field private static final zzb:Lcom/google/android/libraries/places/internal/zzyk;

.field private static volatile zze:Lcom/google/android/libraries/places/internal/zzavn;


# instance fields
.field private zzf:I

.field private zzg:Lcom/google/android/libraries/places/internal/zzyh;

.field private zzh:Lcom/google/android/libraries/places/internal/zzauc;

.field private zzi:Lcom/google/android/libraries/places/internal/zzxt;

.field private zzj:Lcom/google/android/libraries/places/internal/zzxt;

.field private zzk:Lcom/google/android/libraries/places/internal/zzuf;

.field private zzl:I

.field private zzm:Lcom/google/android/libraries/places/internal/zzxv;

.field private zzn:Lcom/google/android/libraries/places/internal/zzxr;

.field private zzo:Lcom/google/android/libraries/places/internal/zzxo;

.field private zzp:Lcom/google/android/libraries/places/internal/zzxx;

.field private zzq:Lcom/google/android/libraries/places/internal/zzauc;

.field private zzr:Lcom/google/android/libraries/places/internal/zzxm;

.field private zzs:Lcom/google/android/libraries/places/internal/zzxz;

.field private zzt:Lcom/google/android/libraries/places/internal/zzxb;

.field private zzu:Lcom/google/android/libraries/places/internal/zzzb;

.field private zzv:Lcom/google/android/libraries/places/internal/zzzd;

.field private zzw:Lcom/google/android/libraries/places/internal/zzys;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzyk;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzyk;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzyk;->zzb:Lcom/google/android/libraries/places/internal/zzyk;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/libraries/places/internal/zzyk;

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
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzyk;->zzh:Lcom/google/android/libraries/places/internal/zzauc;

    .line 9
    .line 10
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzatu;->zzax()Lcom/google/android/libraries/places/internal/zzauc;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzyk;->zzq:Lcom/google/android/libraries/places/internal/zzauc;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic zza()Lcom/google/android/libraries/places/internal/zzyk;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzyk;->zzb:Lcom/google/android/libraries/places/internal/zzyk;

    return-object v0
.end method


# virtual methods
.method public final zzb(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 23

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
    sget-object v0, Lcom/google/android/libraries/places/internal/zzyk;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    const-class v1, Lcom/google/android/libraries/places/internal/zzyk;

    .line 27
    .line 28
    monitor-enter v1

    .line 29
    :try_start_0
    sget-object v0, Lcom/google/android/libraries/places/internal/zzyk;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    new-instance v0, Lcom/google/android/libraries/places/internal/zzatp;

    .line 34
    .line 35
    sget-object v2, Lcom/google/android/libraries/places/internal/zzyk;->zzb:Lcom/google/android/libraries/places/internal/zzyk;

    .line 36
    .line 37
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzatp;-><init>(Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/google/android/libraries/places/internal/zzyk;->zze:Lcom/google/android/libraries/places/internal/zzavn;

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
    sget-object v0, Lcom/google/android/libraries/places/internal/zzyk;->zzb:Lcom/google/android/libraries/places/internal/zzyk;

    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_4
    new-instance v0, Lcom/google/android/libraries/places/internal/zzyi;

    .line 54
    .line 55
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzyi;-><init>(Lcom/google/android/libraries/places/internal/zzwv;)V

    .line 56
    .line 57
    .line 58
    return-object v0

    .line 59
    :cond_5
    new-instance v0, Lcom/google/android/libraries/places/internal/zzyk;

    .line 60
    .line 61
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzyk;-><init>()V

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
    const-string v4, "zzh"

    .line 70
    .line 71
    const-class v5, Lcom/google/android/libraries/places/internal/zzym;

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
    sget-object v10, Lcom/google/android/libraries/places/internal/zzyj;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 82
    .line 83
    const-string v11, "zzm"

    .line 84
    .line 85
    const-string v12, "zzn"

    .line 86
    .line 87
    const-string v13, "zzo"

    .line 88
    .line 89
    const-string v14, "zzp"

    .line 90
    .line 91
    const-string v15, "zzq"

    .line 92
    .line 93
    const-class v16, Lcom/google/android/libraries/places/internal/zzyd;

    .line 94
    .line 95
    const-string v17, "zzr"

    .line 96
    .line 97
    const-string v18, "zzs"

    .line 98
    .line 99
    const-string v19, "zzt"

    .line 100
    .line 101
    const-string v20, "zzu"

    .line 102
    .line 103
    const-string v21, "zzv"

    .line 104
    .line 105
    const-string v22, "zzw"

    .line 106
    .line 107
    filled-new-array/range {v2 .. v22}, [Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    sget-object v1, Lcom/google/android/libraries/places/internal/zzyk;->zzb:Lcom/google/android/libraries/places/internal/zzyk;

    .line 112
    .line 113
    const-string v2, "\u0001\u0011\u0000\u0001\u0001\u0011\u0011\u0000\u0002\u0000\u0001\u1009\u0000\u0002\u001b\u0003\u1009\u0001\u0004\u1009\u0002\u0005\u1009\u0003\u0006\u180c\u0004\u0007\u1009\u0005\u0008\u1009\u0006\t\u1009\u0007\n\u1009\u0008\u000b\u001b\u000c\u1009\t\r\u1009\n\u000e\u1009\u000b\u000f\u1009\u000c\u0010\u1009\r\u0011\u1009\u000e"

    .line 114
    .line 115
    invoke-static {v1, v2, v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaB(Lcom/google/android/libraries/places/internal/zzavf;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    return-object v0

    .line 120
    :cond_7
    const/4 v0, 0x1

    .line 121
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    return-object v0
.end method
