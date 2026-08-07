.class public final Lcom/google/android/libraries/places/internal/zzali;
.super Lcom/google/android/libraries/places/internal/zzatu;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavg;


# static fields
.field private static final zzb:Lcom/google/android/libraries/places/internal/zzali;

.field private static volatile zze:Lcom/google/android/libraries/places/internal/zzavn;


# instance fields
.field private zzf:I

.field private zzg:I

.field private zzh:Lcom/google/android/libraries/places/internal/zzakm;

.field private zzi:Lcom/google/android/libraries/places/internal/zzakm;

.field private zzj:Lcom/google/android/libraries/places/internal/zzauc;

.field private zzk:I

.field private zzl:I

.field private zzm:I

.field private zzn:I

.field private zzo:I

.field private zzp:Lcom/google/android/libraries/places/internal/zzakm;

.field private zzq:Lcom/google/android/libraries/places/internal/zzakp;

.field private zzr:Lcom/google/android/libraries/places/internal/zzakv;

.field private zzs:I

.field private zzt:I

.field private zzu:Lcom/google/android/libraries/places/internal/zzaks;

.field private zzv:B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzali;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzali;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzali;->zzb:Lcom/google/android/libraries/places/internal/zzali;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/libraries/places/internal/zzali;

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
    iput-byte v0, p0, Lcom/google/android/libraries/places/internal/zzali;->zzv:B

    .line 6
    .line 7
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzatu;->zzax()Lcom/google/android/libraries/places/internal/zzauc;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzali;->zzj:Lcom/google/android/libraries/places/internal/zzauc;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic zza()Lcom/google/android/libraries/places/internal/zzali;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzali;->zzb:Lcom/google/android/libraries/places/internal/zzali;

    return-object v0
.end method


# virtual methods
.method public final zzb(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    add-int/lit8 v1, p1, -0x1

    .line 4
    .line 5
    if-eqz v1, :cond_8

    .line 6
    .line 7
    const/4 v2, 0x2

    .line 8
    if-eq v1, v2, :cond_7

    .line 9
    .line 10
    const/4 v2, 0x3

    .line 11
    if-eq v1, v2, :cond_6

    .line 12
    .line 13
    const/4 v2, 0x4

    .line 14
    const/4 v3, 0x0

    .line 15
    if-eq v1, v2, :cond_5

    .line 16
    .line 17
    const/4 v2, 0x5

    .line 18
    if-eq v1, v2, :cond_4

    .line 19
    .line 20
    const/4 v2, 0x6

    .line 21
    if-eq v1, v2, :cond_1

    .line 22
    .line 23
    if-nez p2, :cond_0

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v1, 0x1

    .line 28
    :goto_0
    iput-byte v1, v0, Lcom/google/android/libraries/places/internal/zzali;->zzv:B

    .line 29
    .line 30
    return-object v3

    .line 31
    :cond_1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzali;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    const-class v1, Lcom/google/android/libraries/places/internal/zzali;

    .line 36
    .line 37
    monitor-enter v1

    .line 38
    :try_start_0
    sget-object v0, Lcom/google/android/libraries/places/internal/zzali;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 39
    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    new-instance v0, Lcom/google/android/libraries/places/internal/zzatp;

    .line 43
    .line 44
    sget-object v2, Lcom/google/android/libraries/places/internal/zzali;->zzb:Lcom/google/android/libraries/places/internal/zzali;

    .line 45
    .line 46
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzatp;-><init>(Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/google/android/libraries/places/internal/zzali;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :catchall_0
    move-exception v0

    .line 53
    goto :goto_2

    .line 54
    :cond_2
    :goto_1
    monitor-exit v1

    .line 55
    return-object v0

    .line 56
    :goto_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    throw v0

    .line 58
    :cond_3
    return-object v0

    .line 59
    :cond_4
    sget-object v0, Lcom/google/android/libraries/places/internal/zzali;->zzb:Lcom/google/android/libraries/places/internal/zzali;

    .line 60
    .line 61
    return-object v0

    .line 62
    :cond_5
    new-instance v0, Lcom/google/android/libraries/places/internal/zzalh;

    .line 63
    .line 64
    invoke-direct {v0, v3}, Lcom/google/android/libraries/places/internal/zzalh;-><init>(Lcom/google/android/libraries/places/internal/zzalg;)V

    .line 65
    .line 66
    .line 67
    return-object v0

    .line 68
    :cond_6
    new-instance v0, Lcom/google/android/libraries/places/internal/zzali;

    .line 69
    .line 70
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzali;-><init>()V

    .line 71
    .line 72
    .line 73
    return-object v0

    .line 74
    :cond_7
    const-string v2, "zzf"

    .line 75
    .line 76
    const-string v3, "zzg"

    .line 77
    .line 78
    const-string v4, "zzh"

    .line 79
    .line 80
    const-string v5, "zzi"

    .line 81
    .line 82
    const-string v6, "zzj"

    .line 83
    .line 84
    const-class v7, Lcom/google/android/libraries/places/internal/zzalf;

    .line 85
    .line 86
    const-string v8, "zzk"

    .line 87
    .line 88
    const-string v9, "zzl"

    .line 89
    .line 90
    const-string v10, "zzm"

    .line 91
    .line 92
    const-string v11, "zzn"

    .line 93
    .line 94
    const-string v12, "zzo"

    .line 95
    .line 96
    const-string v13, "zzp"

    .line 97
    .line 98
    const-string v14, "zzq"

    .line 99
    .line 100
    const-string v15, "zzr"

    .line 101
    .line 102
    const-string v16, "zzs"

    .line 103
    .line 104
    const-string v17, "zzt"

    .line 105
    .line 106
    const-string v18, "zzu"

    .line 107
    .line 108
    filled-new-array/range {v2 .. v18}, [Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    sget-object v1, Lcom/google/android/libraries/places/internal/zzali;->zzb:Lcom/google/android/libraries/places/internal/zzali;

    .line 113
    .line 114
    const-string v2, "\u0001\u000f\u0000\u0001\u0002\u0010\u000f\u0000\u0001\u0001\u0002\u1504\u0000\u0003\u1009\u0001\u0004\u1009\u0002\u0005\u001b\u0006\u1004\u0003\u0007\u1004\u0004\u0008\u1004\u0005\t\u1004\u0006\n\u1004\u0007\u000b\u1009\u0008\u000c\u1009\t\r\u1009\n\u000e\u1004\u000b\u000f\u1004\u000c\u0010\u1009\r"

    .line 115
    .line 116
    invoke-static {v1, v2, v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaB(Lcom/google/android/libraries/places/internal/zzavf;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    return-object v0

    .line 121
    :cond_8
    iget-byte v0, v0, Lcom/google/android/libraries/places/internal/zzali;->zzv:B

    .line 122
    .line 123
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    return-object v0
.end method
