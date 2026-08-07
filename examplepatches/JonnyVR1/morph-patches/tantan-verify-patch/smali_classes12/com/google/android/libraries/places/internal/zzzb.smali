.class public final Lcom/google/android/libraries/places/internal/zzzb;
.super Lcom/google/android/libraries/places/internal/zzatu;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavg;


# static fields
.field private static final zzb:Lcom/google/android/libraries/places/internal/zzzb;

.field private static volatile zze:Lcom/google/android/libraries/places/internal/zzavn;


# instance fields
.field private zzA:I

.field private zzB:F

.field private zzC:Z

.field private zzf:I

.field private zzg:I

.field private zzh:Z

.field private zzi:Z

.field private zzj:F

.field private zzk:F

.field private zzl:Z

.field private zzm:Z

.field private zzn:Z

.field private zzo:Z

.field private zzp:I

.field private zzq:I

.field private zzr:Z

.field private zzs:I

.field private zzt:F

.field private zzu:I

.field private zzv:I

.field private zzw:I

.field private zzx:I

.field private zzy:I

.field private zzz:Lcom/google/android/libraries/places/internal/zzauc;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzzb;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzzb;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzzb;->zzb:Lcom/google/android/libraries/places/internal/zzzb;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/libraries/places/internal/zzzb;

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
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzzb;->zzz:Lcom/google/android/libraries/places/internal/zzauc;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic zza()Lcom/google/android/libraries/places/internal/zzzb;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzzb;->zzb:Lcom/google/android/libraries/places/internal/zzzb;

    return-object v0
.end method


# virtual methods
.method public final zzb(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 33

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
    sget-object v0, Lcom/google/android/libraries/places/internal/zzzb;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    const-class v1, Lcom/google/android/libraries/places/internal/zzzb;

    .line 27
    .line 28
    monitor-enter v1

    .line 29
    :try_start_0
    sget-object v0, Lcom/google/android/libraries/places/internal/zzzb;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    new-instance v0, Lcom/google/android/libraries/places/internal/zzatp;

    .line 34
    .line 35
    sget-object v2, Lcom/google/android/libraries/places/internal/zzzb;->zzb:Lcom/google/android/libraries/places/internal/zzzb;

    .line 36
    .line 37
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzatp;-><init>(Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/google/android/libraries/places/internal/zzzb;->zze:Lcom/google/android/libraries/places/internal/zzavn;

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
    sget-object v0, Lcom/google/android/libraries/places/internal/zzzb;->zzb:Lcom/google/android/libraries/places/internal/zzzb;

    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_4
    new-instance v0, Lcom/google/android/libraries/places/internal/zzyz;

    .line 54
    .line 55
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzyz;-><init>(Lcom/google/android/libraries/places/internal/zzwv;)V

    .line 56
    .line 57
    .line 58
    return-object v0

    .line 59
    :cond_5
    new-instance v0, Lcom/google/android/libraries/places/internal/zzzb;

    .line 60
    .line 61
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzzb;-><init>()V

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
    const-string v5, "zzi"

    .line 72
    .line 73
    const-string v6, "zzj"

    .line 74
    .line 75
    const-string v7, "zzk"

    .line 76
    .line 77
    const-string v8, "zzl"

    .line 78
    .line 79
    const-string v9, "zzm"

    .line 80
    .line 81
    const-string v10, "zzn"

    .line 82
    .line 83
    const-string v11, "zzo"

    .line 84
    .line 85
    const-string v12, "zzp"

    .line 86
    .line 87
    const-string v13, "zzq"

    .line 88
    .line 89
    const-string v14, "zzr"

    .line 90
    .line 91
    const-string v15, "zzs"

    .line 92
    .line 93
    sget-object v16, Lcom/google/android/libraries/places/internal/zzza;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 94
    .line 95
    const-string v17, "zzt"

    .line 96
    .line 97
    const-string v18, "zzu"

    .line 98
    .line 99
    sget-object v19, Lcom/google/android/libraries/places/internal/zzun;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 100
    .line 101
    const-string v20, "zzv"

    .line 102
    .line 103
    const-string v22, "zzw"

    .line 104
    .line 105
    const-string v24, "zzx"

    .line 106
    .line 107
    const-string v26, "zzy"

    .line 108
    .line 109
    sget-object v27, Lcom/google/android/libraries/places/internal/zzuo;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 110
    .line 111
    const-string v28, "zzz"

    .line 112
    .line 113
    const-class v29, Lcom/google/android/libraries/places/internal/zzyu;

    .line 114
    .line 115
    const-string v30, "zzA"

    .line 116
    .line 117
    const-string v31, "zzB"

    .line 118
    .line 119
    const-string v32, "zzC"

    .line 120
    .line 121
    move-object/from16 v21, v19

    .line 122
    .line 123
    move-object/from16 v23, v19

    .line 124
    .line 125
    move-object/from16 v25, v19

    .line 126
    .line 127
    filled-new-array/range {v2 .. v32}, [Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    sget-object v1, Lcom/google/android/libraries/places/internal/zzzb;->zzb:Lcom/google/android/libraries/places/internal/zzzb;

    .line 132
    .line 133
    const-string v2, "\u0001\u0017\u0000\u0001\u0001\u0017\u0017\u0000\u0001\u0000\u0001\u1004\u0000\u0002\u1007\u0001\u0003\u1007\u0002\u0004\u1001\u0003\u0005\u1001\u0004\u0006\u1007\u0005\u0007\u1007\u0006\u0008\u1007\u0007\t\u1007\u0008\n\u1004\t\u000b\u1004\n\u000c\u1007\u000b\r\u180c\u000c\u000e\u1001\r\u000f\u180c\u000e\u0010\u180c\u000f\u0011\u180c\u0010\u0012\u180c\u0011\u0013\u180c\u0012\u0014\u001b\u0015\u1004\u0013\u0016\u1001\u0014\u0017\u1007\u0015"

    .line 134
    .line 135
    invoke-static {v1, v2, v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaB(Lcom/google/android/libraries/places/internal/zzavf;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    return-object v0

    .line 140
    :cond_7
    const/4 v0, 0x1

    .line 141
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    return-object v0
.end method
