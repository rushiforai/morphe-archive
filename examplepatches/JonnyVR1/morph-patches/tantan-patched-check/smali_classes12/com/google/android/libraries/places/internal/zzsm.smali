.class public final Lcom/google/android/libraries/places/internal/zzsm;
.super Lcom/google/android/libraries/places/internal/zzatu;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavg;


# static fields
.field private static final zzb:Lcom/google/android/libraries/places/internal/zzsm;

.field private static volatile zze:Lcom/google/android/libraries/places/internal/zzavn;


# instance fields
.field private zzA:Lcom/google/android/libraries/places/internal/zzbf;

.field private zzB:Lcom/google/android/libraries/places/internal/zzae;

.field private zzC:Lcom/google/android/libraries/places/internal/zzcg;

.field private zzD:Lcom/google/android/libraries/places/internal/zzbl;

.field private zzE:B

.field private zzf:I

.field private zzg:I

.field private zzh:Lcom/google/android/libraries/places/internal/zzagi;

.field private zzi:Lcom/google/android/libraries/places/internal/zzus;

.field private zzj:Lcom/google/android/libraries/places/internal/zzajj;

.field private zzk:Lcom/google/android/libraries/places/internal/zzadd;

.field private zzl:Lcom/google/android/libraries/places/internal/zzyk;

.field private zzm:Lcom/google/android/libraries/places/internal/zzbw;

.field private zzn:Lcom/google/android/libraries/places/internal/zzum;

.field private zzo:Lcom/google/android/libraries/places/internal/zzts;

.field private zzp:Lcom/google/android/libraries/places/internal/zzvr;

.field private zzq:Lcom/google/android/libraries/places/internal/zzaaj;

.field private zzr:Lcom/google/android/libraries/places/internal/zzabb;

.field private zzs:Lcom/google/android/libraries/places/internal/zzabe;

.field private zzt:Lcom/google/android/libraries/places/internal/zzta;

.field private zzu:Lcom/google/android/libraries/places/internal/zzwl;

.field private zzv:Lcom/google/android/libraries/places/internal/zzc;

.field private zzw:Lcom/google/android/libraries/places/internal/zzan;

.field private zzx:Lcom/google/android/libraries/places/internal/zzav;

.field private zzy:Lcom/google/android/libraries/places/internal/zzcy;

.field private zzz:Lcom/google/android/libraries/places/internal/zzay;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzsm;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzsm;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzsm;->zzb:Lcom/google/android/libraries/places/internal/zzsm;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/libraries/places/internal/zzsm;

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
    iput-byte v0, p0, Lcom/google/android/libraries/places/internal/zzsm;->zzE:B

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzsm;->zzg:I

    .line 9
    .line 10
    return-void
.end method

.method public static zza()Lcom/google/android/libraries/places/internal/zzsk;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzsm;->zzb:Lcom/google/android/libraries/places/internal/zzsm;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzar()Lcom/google/android/libraries/places/internal/zzato;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/android/libraries/places/internal/zzsk;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic zzc()Lcom/google/android/libraries/places/internal/zzsm;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzsm;->zzb:Lcom/google/android/libraries/places/internal/zzsm;

    return-object v0
.end method

.method public static synthetic zzd(Lcom/google/android/libraries/places/internal/zzsm;Lcom/google/android/libraries/places/internal/zzagi;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzsm;->zzh:Lcom/google/android/libraries/places/internal/zzagi;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzsm;->zzf:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x2

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzsm;->zzf:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic zze(Lcom/google/android/libraries/places/internal/zzsm;I)V
    .locals 1

    const/4 p1, 0x1

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzsm;->zzg:I

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzsm;->zzf:I

    or-int/2addr p1, v0

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzsm;->zzf:I

    return-void
.end method


# virtual methods
.method public final zzb(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 28

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
    iput-byte v1, v0, Lcom/google/android/libraries/places/internal/zzsm;->zzE:B

    .line 29
    .line 30
    return-object v3

    .line 31
    :cond_1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzsm;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    const-class v1, Lcom/google/android/libraries/places/internal/zzsm;

    .line 36
    .line 37
    monitor-enter v1

    .line 38
    :try_start_0
    sget-object v0, Lcom/google/android/libraries/places/internal/zzsm;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 39
    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    new-instance v0, Lcom/google/android/libraries/places/internal/zzatp;

    .line 43
    .line 44
    sget-object v2, Lcom/google/android/libraries/places/internal/zzsm;->zzb:Lcom/google/android/libraries/places/internal/zzsm;

    .line 45
    .line 46
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzatp;-><init>(Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/google/android/libraries/places/internal/zzsm;->zze:Lcom/google/android/libraries/places/internal/zzavn;

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
    sget-object v0, Lcom/google/android/libraries/places/internal/zzsm;->zzb:Lcom/google/android/libraries/places/internal/zzsm;

    .line 60
    .line 61
    return-object v0

    .line 62
    :cond_5
    new-instance v0, Lcom/google/android/libraries/places/internal/zzsk;

    .line 63
    .line 64
    invoke-direct {v0, v3}, Lcom/google/android/libraries/places/internal/zzsk;-><init>(Lcom/google/android/libraries/places/internal/zzsj;)V

    .line 65
    .line 66
    .line 67
    return-object v0

    .line 68
    :cond_6
    new-instance v0, Lcom/google/android/libraries/places/internal/zzsm;

    .line 69
    .line 70
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzsm;-><init>()V

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
    sget-object v4, Lcom/google/android/libraries/places/internal/zzsl;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 79
    .line 80
    const-string v5, "zzh"

    .line 81
    .line 82
    const-string v6, "zzi"

    .line 83
    .line 84
    const-string v7, "zzj"

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
    const-string v19, "zzv"

    .line 109
    .line 110
    const-string v20, "zzw"

    .line 111
    .line 112
    const-string v21, "zzx"

    .line 113
    .line 114
    const-string v22, "zzy"

    .line 115
    .line 116
    const-string v23, "zzz"

    .line 117
    .line 118
    const-string v24, "zzA"

    .line 119
    .line 120
    const-string v25, "zzB"

    .line 121
    .line 122
    const-string v26, "zzC"

    .line 123
    .line 124
    const-string v27, "zzD"

    .line 125
    .line 126
    filled-new-array/range {v2 .. v27}, [Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    sget-object v1, Lcom/google/android/libraries/places/internal/zzsm;->zzb:Lcom/google/android/libraries/places/internal/zzsm;

    .line 131
    .line 132
    const-string v2, "\u0001\u0018\u0000\u0001\u0001\u0019\u0018\u0000\u0000\u0002\u0001\u180c\u0000\u0002\u1409\u0001\u0003\u1409\u0002\u0004\u1009\u0003\u0005\u1009\u0004\u0006\u1009\u0005\u0007\u1009\u0006\u0008\u1009\u0007\t\u1009\u0008\n\u1009\t\u000b\u1009\n\u000c\u1009\u000b\r\u1009\u000c\u000f\u1009\r\u0010\u1009\u000e\u0011\u1009\u000f\u0012\u1009\u0010\u0013\u1009\u0011\u0014\u1009\u0012\u0015\u1009\u0013\u0016\u1009\u0014\u0017\u1009\u0015\u0018\u1009\u0016\u0019\u1009\u0017"

    .line 133
    .line 134
    invoke-static {v1, v2, v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaB(Lcom/google/android/libraries/places/internal/zzavf;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    return-object v0

    .line 139
    :cond_8
    iget-byte v0, v0, Lcom/google/android/libraries/places/internal/zzsm;->zzE:B

    .line 140
    .line 141
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    return-object v0
.end method
