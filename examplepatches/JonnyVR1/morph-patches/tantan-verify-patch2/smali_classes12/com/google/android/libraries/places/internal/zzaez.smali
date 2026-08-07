.class public final Lcom/google/android/libraries/places/internal/zzaez;
.super Lcom/google/android/libraries/places/internal/zzatu;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavg;


# static fields
.field private static final zzb:Lcom/google/android/libraries/places/internal/zzaez;

.field private static volatile zze:Lcom/google/android/libraries/places/internal/zzavn;


# instance fields
.field private zzf:I

.field private zzg:I

.field private zzh:I

.field private zzi:I

.field private zzj:I

.field private zzk:I

.field private zzl:Lcom/google/android/libraries/places/internal/zzaen;

.field private zzm:Lcom/google/android/libraries/places/internal/zzaeg;

.field private zzn:Lcom/google/android/libraries/places/internal/zzaeb;

.field private zzo:Lcom/google/android/libraries/places/internal/zzaip;

.field private zzp:Lcom/google/android/libraries/places/internal/zzaei;

.field private zzq:Lcom/google/android/libraries/places/internal/zzael;

.field private zzr:Lcom/google/android/libraries/places/internal/zzair;

.field private zzs:Lcom/google/android/libraries/places/internal/zzaiz;

.field private zzt:Lcom/google/android/libraries/places/internal/zzaiv;

.field private zzu:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzaez;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzaez;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzaez;->zzb:Lcom/google/android/libraries/places/internal/zzaez;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/libraries/places/internal/zzaez;

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

.method public static zza()Lcom/google/android/libraries/places/internal/zzaeu;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaez;->zzb:Lcom/google/android/libraries/places/internal/zzaez;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzar()Lcom/google/android/libraries/places/internal/zzato;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/android/libraries/places/internal/zzaeu;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic zzc()Lcom/google/android/libraries/places/internal/zzaez;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzaez;->zzb:Lcom/google/android/libraries/places/internal/zzaez;

    return-object v0
.end method

.method public static synthetic zzd(Lcom/google/android/libraries/places/internal/zzaez;I)V
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzf:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzf:I

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzi:I

    return-void
.end method

.method public static synthetic zze(Lcom/google/android/libraries/places/internal/zzaez;Lcom/google/android/libraries/places/internal/zzaen;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzl:Lcom/google/android/libraries/places/internal/zzaen;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzf:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x20

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzf:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic zzf(Lcom/google/android/libraries/places/internal/zzaez;Lcom/google/android/libraries/places/internal/zzaeb;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzn:Lcom/google/android/libraries/places/internal/zzaeb;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzf:I

    .line 7
    .line 8
    or-int/lit16 p1, p1, 0x80

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzf:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic zzg(Lcom/google/android/libraries/places/internal/zzaez;Lcom/google/android/libraries/places/internal/zzaei;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzp:Lcom/google/android/libraries/places/internal/zzaei;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzf:I

    .line 7
    .line 8
    or-int/lit16 p1, p1, 0x200

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzf:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic zzh(Lcom/google/android/libraries/places/internal/zzaez;Lcom/google/android/libraries/places/internal/zzaiz;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzs:Lcom/google/android/libraries/places/internal/zzaiz;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzf:I

    .line 7
    .line 8
    or-int/lit16 p1, p1, 0x1000

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzf:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic zzi(Lcom/google/android/libraries/places/internal/zzaez;I)V
    .locals 0

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzg:I

    iget p1, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzf:I

    or-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzf:I

    return-void
.end method

.method public static synthetic zzj(Lcom/google/android/libraries/places/internal/zzaez;I)V
    .locals 0

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzh:I

    iget p1, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzf:I

    or-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzaez;->zzf:I

    return-void
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
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaez;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    const-class v1, Lcom/google/android/libraries/places/internal/zzaez;

    .line 27
    .line 28
    monitor-enter v1

    .line 29
    :try_start_0
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaez;->zze:Lcom/google/android/libraries/places/internal/zzavn;

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    new-instance v0, Lcom/google/android/libraries/places/internal/zzatp;

    .line 34
    .line 35
    sget-object v2, Lcom/google/android/libraries/places/internal/zzaez;->zzb:Lcom/google/android/libraries/places/internal/zzaez;

    .line 36
    .line 37
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzatp;-><init>(Lcom/google/android/libraries/places/internal/zzatu;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/google/android/libraries/places/internal/zzaez;->zze:Lcom/google/android/libraries/places/internal/zzavn;

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
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaez;->zzb:Lcom/google/android/libraries/places/internal/zzaez;

    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_4
    new-instance v0, Lcom/google/android/libraries/places/internal/zzaeu;

    .line 54
    .line 55
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzaeu;-><init>(Lcom/google/android/libraries/places/internal/zzadu;)V

    .line 56
    .line 57
    .line 58
    return-object v0

    .line 59
    :cond_5
    new-instance v0, Lcom/google/android/libraries/places/internal/zzaez;

    .line 60
    .line 61
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzaez;-><init>()V

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
    sget-object v4, Lcom/google/android/libraries/places/internal/zzaew;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 70
    .line 71
    const-string v5, "zzh"

    .line 72
    .line 73
    sget-object v6, Lcom/google/android/libraries/places/internal/zzaey;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 74
    .line 75
    const-string v7, "zzi"

    .line 76
    .line 77
    const-string v8, "zzj"

    .line 78
    .line 79
    sget-object v9, Lcom/google/android/libraries/places/internal/zzaev;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 80
    .line 81
    const-string v10, "zzk"

    .line 82
    .line 83
    sget-object v11, Lcom/google/android/libraries/places/internal/zzaet;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 84
    .line 85
    const-string v12, "zzl"

    .line 86
    .line 87
    const-string v13, "zzm"

    .line 88
    .line 89
    const-string v14, "zzn"

    .line 90
    .line 91
    const-string v15, "zzo"

    .line 92
    .line 93
    const-string v16, "zzp"

    .line 94
    .line 95
    const-string v17, "zzq"

    .line 96
    .line 97
    const-string v18, "zzr"

    .line 98
    .line 99
    const-string v19, "zzs"

    .line 100
    .line 101
    const-string v20, "zzt"

    .line 102
    .line 103
    const-string v21, "zzu"

    .line 104
    .line 105
    sget-object v22, Lcom/google/android/libraries/places/internal/zzaex;->zza:Lcom/google/android/libraries/places/internal/zzaty;

    .line 106
    .line 107
    filled-new-array/range {v2 .. v22}, [Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    sget-object v1, Lcom/google/android/libraries/places/internal/zzaez;->zzb:Lcom/google/android/libraries/places/internal/zzaez;

    .line 112
    .line 113
    const-string v2, "\u0001\u000f\u0000\u0001\u0001\u000f\u000f\u0000\u0000\u0000\u0001\u180c\u0000\u0002\u180c\u0001\u0003\u1004\u0002\u0004\u180c\u0003\u0005\u180c\u0004\u0006\u1009\u0005\u0007\u1009\u0006\u0008\u1009\u0007\t\u1009\u0008\n\u1009\t\u000b\u1009\n\u000c\u1009\u000b\r\u1009\u000c\u000e\u1009\r\u000f\u180c\u000e"

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
