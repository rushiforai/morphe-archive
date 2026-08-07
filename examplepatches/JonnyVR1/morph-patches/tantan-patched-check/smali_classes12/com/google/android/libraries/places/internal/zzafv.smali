.class public final Lcom/google/android/libraries/places/internal/zzafv;
.super Lcom/google/android/libraries/places/internal/zzatu;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavg;


# static fields
.field private static final zzb:Lcom/google/android/libraries/places/internal/zzafv;

.field private static volatile zze:Lcom/google/android/libraries/places/internal/zzavn;


# instance fields
.field private zzf:I

.field private zzg:I

.field private zzh:I

.field private zzi:Z

.field private zzj:Z

.field private zzk:Z

.field private zzl:I

.field private zzm:I

.field private zzn:I

.field private zzo:I

.field private zzp:I

.field private zzq:I

.field private zzr:I

.field private zzs:Z

.field private zzt:I

.field private zzu:I

.field private zzv:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzafv;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzafv;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzafv;->zzb:Lcom/google/android/libraries/places/internal/zzafv;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/libraries/places/internal/zzafv;

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
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzh:I

    .line 6
    .line 7
    return-void
.end method

.method public static zza()Lcom/google/android/libraries/places/internal/zzafs;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzafv;->zzb:Lcom/google/android/libraries/places/internal/zzafv;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzar()Lcom/google/android/libraries/places/internal/zzato;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/android/libraries/places/internal/zzafs;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic zzc()Lcom/google/android/libraries/places/internal/zzafv;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzafv;->zzb:Lcom/google/android/libraries/places/internal/zzafv;

    return-object v0
.end method

.method public static synthetic zzd(Lcom/google/android/libraries/places/internal/zzafv;Z)V
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    iput-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzi:Z

    return-void
.end method

.method public static synthetic zze(Lcom/google/android/libraries/places/internal/zzafv;Z)V
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    iput-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzj:Z

    return-void
.end method

.method public static synthetic zzf(Lcom/google/android/libraries/places/internal/zzafv;Z)V
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    iput-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzk:Z

    return-void
.end method

.method public static synthetic zzg(Lcom/google/android/libraries/places/internal/zzafv;I)V
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzl:I

    return-void
.end method

.method public static synthetic zzh(Lcom/google/android/libraries/places/internal/zzafv;I)V
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    or-int/lit8 v0, v0, 0x40

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzm:I

    return-void
.end method

.method public static synthetic zzi(Lcom/google/android/libraries/places/internal/zzafv;I)V
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    or-int/lit16 v0, v0, 0x80

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzn:I

    return-void
.end method

.method public static synthetic zzj(Lcom/google/android/libraries/places/internal/zzafv;I)V
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    or-int/lit16 v0, v0, 0x100

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzo:I

    return-void
.end method

.method public static synthetic zzk(Lcom/google/android/libraries/places/internal/zzafv;I)V
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    or-int/lit16 v0, v0, 0x200

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzp:I

    return-void
.end method

.method public static synthetic zzl(Lcom/google/android/libraries/places/internal/zzafv;I)V
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    or-int/lit16 v0, v0, 0x400

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzq:I

    return-void
.end method

.method public static synthetic zzm(Lcom/google/android/libraries/places/internal/zzafv;I)V
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    or-int/lit16 v0, v0, 0x800

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzr:I

    return-void
.end method

.method public static synthetic zzn(Lcom/google/android/libraries/places/internal/zzafv;Z)V
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    or-int/lit16 v0, v0, 0x1000

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    iput-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzs:Z

    return-void
.end method

.method public static synthetic zzo(Lcom/google/android/libraries/places/internal/zzafv;I)V
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    or-int/lit16 v0, v0, 0x2000

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzt:I

    return-void
.end method

.method public static synthetic zzp(Lcom/google/android/libraries/places/internal/zzafv;I)V
    .locals 0

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzg:I

    iget p1, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    or-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    return-void
.end method

.method public static synthetic zzq(Lcom/google/android/libraries/places/internal/zzafv;I)V
    .locals 0

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzh:I

    iget p1, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    or-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzafv;->zzf:I

    return-void
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
    sget-object v0, Lcom/google/android/libraries/places/internal/zzafv;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    const-class v1, Lcom/google/android/libraries/places/internal/zzafv;

    .line 27
    .line 28
    monitor-enter v1

    .line 29
    :try_start_0
    sget-object v0, Lcom/google/android/libraries/places/internal/zzafv;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    new-instance v0, Lcom/google/android/libraries/places/internal/zzatp;

    .line 34
    .line 35
    sget-object v2, Lcom/google/android/libraries/places/internal/zzafv;->zzb:Lcom/google/android/libraries/places/internal/zzafv;

    .line 36
    .line 37
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzatp;-><init>(Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/google/android/libraries/places/internal/zzafv;->zze:Lcom/google/android/libraries/places/internal/zzavn;

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
    sget-object v0, Lcom/google/android/libraries/places/internal/zzafv;->zzb:Lcom/google/android/libraries/places/internal/zzafv;

    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_4
    new-instance v0, Lcom/google/android/libraries/places/internal/zzafs;

    .line 54
    .line 55
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzafs;-><init>(Lcom/google/android/libraries/places/internal/zzadu;)V

    .line 56
    .line 57
    .line 58
    return-object v0

    .line 59
    :cond_5
    new-instance v0, Lcom/google/android/libraries/places/internal/zzafv;

    .line 60
    .line 61
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzafv;-><init>()V

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
    sget-object v4, Lcom/google/android/libraries/places/internal/zzafu;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 70
    .line 71
    const-string v5, "zzh"

    .line 72
    .line 73
    sget-object v6, Lcom/google/android/libraries/places/internal/zzafr;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 74
    .line 75
    const-string v7, "zzi"

    .line 76
    .line 77
    const-string v8, "zzj"

    .line 78
    .line 79
    const-string v9, "zzk"

    .line 80
    .line 81
    const-string v10, "zzl"

    .line 82
    .line 83
    const-string v11, "zzm"

    .line 84
    .line 85
    const-string v12, "zzn"

    .line 86
    .line 87
    const-string v13, "zzp"

    .line 88
    .line 89
    const-string v14, "zzq"

    .line 90
    .line 91
    const-string v15, "zzr"

    .line 92
    .line 93
    const-string v16, "zzs"

    .line 94
    .line 95
    const-string v17, "zzt"

    .line 96
    .line 97
    const-string v18, "zzo"

    .line 98
    .line 99
    const-string v19, "zzu"

    .line 100
    .line 101
    const-string v20, "zzv"

    .line 102
    .line 103
    sget-object v21, Lcom/google/android/libraries/places/internal/zzaft;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 104
    .line 105
    filled-new-array/range {v2 .. v21}, [Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    sget-object v1, Lcom/google/android/libraries/places/internal/zzafv;->zzb:Lcom/google/android/libraries/places/internal/zzafv;

    .line 110
    .line 111
    const-string v2, "\u0001\u0010\u0000\u0001\u0001\u0011\u0010\u0000\u0000\u0000\u0001\u180c\u0000\u0002\u180c\u0001\u0003\u1007\u0002\u0004\u1007\u0003\u0005\u1007\u0004\u0006\u100b\u0005\u0007\u100b\u0006\u0008\u100b\u0007\n\u100b\t\u000b\u100b\n\u000c\u100b\u000b\r\u1007\u000c\u000e\u100b\r\u000f\u100b\u0008\u0010\u100b\u000e\u0011\u180c\u000f"

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
