.class public final Lcom/google/android/libraries/places/internal/zzwl;
.super Lcom/google/android/libraries/places/internal/zzatu;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavg;


# static fields
.field private static final zzb:Lcom/google/android/libraries/places/internal/zzwl;

.field private static volatile zze:Lcom/google/android/libraries/places/internal/zzavn;


# instance fields
.field private zzA:I

.field private zzf:I

.field private zzg:I

.field private zzh:I

.field private zzi:I

.field private zzj:I

.field private zzk:I

.field private zzl:I

.field private zzm:I

.field private zzn:I

.field private zzo:I

.field private zzp:I

.field private zzq:I

.field private zzr:I

.field private zzs:I

.field private zzt:I

.field private zzu:I

.field private zzv:Lcom/google/android/libraries/places/internal/zzws;

.field private zzw:Lcom/google/android/libraries/places/internal/zzwu;

.field private zzx:Lcom/google/android/libraries/places/internal/zzwi;

.field private zzy:Lcom/google/android/libraries/places/internal/zzwn;

.field private zzz:Lcom/google/android/libraries/places/internal/zzwp;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzwl;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzwl;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzwl;->zzb:Lcom/google/android/libraries/places/internal/zzwl;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/libraries/places/internal/zzwl;

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

.method public static synthetic zza()Lcom/google/android/libraries/places/internal/zzwl;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzwl;->zzb:Lcom/google/android/libraries/places/internal/zzwl;

    return-object v0
.end method


# virtual methods
.method public final zzb(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 25

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
    sget-object v0, Lcom/google/android/libraries/places/internal/zzwl;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    const-class v1, Lcom/google/android/libraries/places/internal/zzwl;

    .line 27
    .line 28
    monitor-enter v1

    .line 29
    :try_start_0
    sget-object v0, Lcom/google/android/libraries/places/internal/zzwl;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    new-instance v0, Lcom/google/android/libraries/places/internal/zzatp;

    .line 34
    .line 35
    sget-object v2, Lcom/google/android/libraries/places/internal/zzwl;->zzb:Lcom/google/android/libraries/places/internal/zzwl;

    .line 36
    .line 37
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzatp;-><init>(Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/google/android/libraries/places/internal/zzwl;->zze:Lcom/google/android/libraries/places/internal/zzavn;

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
    sget-object v0, Lcom/google/android/libraries/places/internal/zzwl;->zzb:Lcom/google/android/libraries/places/internal/zzwl;

    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_4
    new-instance v0, Lcom/google/android/libraries/places/internal/zzwj;

    .line 54
    .line 55
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzwj;-><init>(Lcom/google/android/libraries/places/internal/zzwg;)V

    .line 56
    .line 57
    .line 58
    return-object v0

    .line 59
    :cond_5
    new-instance v0, Lcom/google/android/libraries/places/internal/zzwl;

    .line 60
    .line 61
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzwl;-><init>()V

    .line 62
    .line 63
    .line 64
    return-object v0

    .line 65
    :cond_6
    const-string v2, "zzf"

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
    const-string v11, "zzp"

    .line 84
    .line 85
    const-string v12, "zzq"

    .line 86
    .line 87
    const-string v13, "zzr"

    .line 88
    .line 89
    const-string v14, "zzs"

    .line 90
    .line 91
    const-string v15, "zzt"

    .line 92
    .line 93
    const-string v16, "zzu"

    .line 94
    .line 95
    const-string v17, "zzv"

    .line 96
    .line 97
    const-string v18, "zzg"

    .line 98
    .line 99
    const-string v19, "zzw"

    .line 100
    .line 101
    const-string v20, "zzx"

    .line 102
    .line 103
    const-string v21, "zzy"

    .line 104
    .line 105
    const-string v22, "zzz"

    .line 106
    .line 107
    const-string v23, "zzA"

    .line 108
    .line 109
    sget-object v24, Lcom/google/android/libraries/places/internal/zzwk;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 110
    .line 111
    filled-new-array/range {v2 .. v24}, [Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    sget-object v1, Lcom/google/android/libraries/places/internal/zzwl;->zzb:Lcom/google/android/libraries/places/internal/zzwl;

    .line 116
    .line 117
    const-string v2, "\u0001\u0015\u0000\u0001\u0001\u0015\u0015\u0000\u0000\u0000\u0001\u100b\u0001\u0002\u100b\u0002\u0003\u100b\u0003\u0004\u100b\u0004\u0005\u100b\u0005\u0006\u100b\u0006\u0007\u100b\u0007\u0008\u100b\u0008\t\u100b\t\n\u100b\n\u000b\u100b\u000b\u000c\u100b\u000c\r\u100b\r\u000e\u100b\u000e\u000f\u1009\u000f\u0010\u100b\u0000\u0011\u1009\u0010\u0012\u1009\u0011\u0013\u1009\u0012\u0014\u1009\u0013\u0015\u180c\u0014"

    .line 118
    .line 119
    invoke-static {v1, v2, v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaB(Lcom/google/android/libraries/places/internal/zzavf;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    return-object v0

    .line 124
    :cond_7
    const/4 v0, 0x1

    .line 125
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    return-object v0
.end method
