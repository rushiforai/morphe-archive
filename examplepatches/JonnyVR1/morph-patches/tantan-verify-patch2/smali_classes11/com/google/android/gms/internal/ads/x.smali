.class public final Lcom/google/android/gms/internal/ads/x;
.super Lcom/google/android/gms/internal/ads/p5;
.source "SourceFile"

# interfaces
.implements Ll/gkx0;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/ads/x;


# instance fields
.field private zzd:I

.field private zze:I

.field private zzf:I

.field private zzg:Lcom/google/android/gms/internal/ads/d0;

.field private zzh:Lcom/google/android/gms/internal/ads/e0;

.field private zzi:Ll/fjx0;

.field private zzj:Lcom/google/android/gms/internal/ads/f0;

.field private zzk:Lcom/google/android/gms/internal/ads/q0;

.field private zzl:Lcom/google/android/gms/internal/ads/n0;

.field private zzm:Lcom/google/android/gms/internal/ads/k0;

.field private zzn:Lcom/google/android/gms/internal/ads/l0;

.field private zzo:Ll/fjx0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/x;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/x;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/ads/x;->zzb:Lcom/google/android/gms/internal/ads/x;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/gms/internal/ads/x;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/ads/p5;->C(Ljava/lang/Class;Lcom/google/android/gms/internal/ads/p5;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/ads/p5;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x3e8

    .line 5
    .line 6
    iput v0, p0, Lcom/google/android/gms/internal/ads/x;->zzf:I

    .line 7
    .line 8
    invoke-static {}, Lcom/google/android/gms/internal/ads/p5;->w()Ll/fjx0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/x;->zzi:Ll/fjx0;

    .line 13
    .line 14
    invoke-static {}, Lcom/google/android/gms/internal/ads/p5;->w()Ll/fjx0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/x;->zzo:Ll/fjx0;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic L()Lcom/google/android/gms/internal/ads/x;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/x;->zzb:Lcom/google/android/gms/internal/ads/x;

    return-object v0
.end method

.method public static M()Lcom/google/android/gms/internal/ads/x;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/x;->zzb:Lcom/google/android/gms/internal/ads/x;

    return-object v0
.end method

.method public static synthetic O(Lcom/google/android/gms/internal/ads/x;Lcom/google/android/gms/internal/ads/zzbbz;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/zzbbz;->zza()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Lcom/google/android/gms/internal/ads/x;->zze:I

    .line 6
    .line 7
    iget p1, p0, Lcom/google/android/gms/internal/ads/x;->zzd:I

    .line 8
    .line 9
    or-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    iput p1, p0, Lcom/google/android/gms/internal/ads/x;->zzd:I

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic P(Lcom/google/android/gms/internal/ads/x;Lcom/google/android/gms/internal/ads/e0;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/x;->zzh:Lcom/google/android/gms/internal/ads/e0;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/gms/internal/ads/x;->zzd:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x8

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/gms/internal/ads/x;->zzd:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 17

    .line 1
    add-int/lit8 v0, p1, -0x1

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    if-eq v0, v1, :cond_3

    .line 7
    .line 8
    const/4 v1, 0x3

    .line 9
    if-eq v0, v1, :cond_2

    .line 10
    .line 11
    const/4 v1, 0x4

    .line 12
    const/4 v2, 0x0

    .line 13
    if-eq v0, v1, :cond_1

    .line 14
    .line 15
    const/4 v1, 0x5

    .line 16
    if-eq v0, v1, :cond_0

    .line 17
    .line 18
    return-object v2

    .line 19
    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/ads/x;->zzb:Lcom/google/android/gms/internal/ads/x;

    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_1
    new-instance v0, Ll/ycs0;

    .line 23
    .line 24
    invoke-direct {v0, v2}, Ll/ycs0;-><init>(Ll/mcs0;)V

    .line 25
    .line 26
    .line 27
    return-object v0

    .line 28
    :cond_2
    new-instance v0, Lcom/google/android/gms/internal/ads/x;

    .line 29
    .line 30
    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/x;-><init>()V

    .line 31
    .line 32
    .line 33
    return-object v0

    .line 34
    :cond_3
    sget-object v3, Ll/ocs0;->a:Ll/zhx0;

    .line 35
    .line 36
    sget-object v5, Ll/wds0;->a:Ll/zhx0;

    .line 37
    .line 38
    const-string v15, "zzo"

    .line 39
    .line 40
    const-class v16, Lcom/google/android/gms/internal/ads/w0;

    .line 41
    .line 42
    const-string v1, "zzd"

    .line 43
    .line 44
    const-string v2, "zze"

    .line 45
    .line 46
    const-string v4, "zzf"

    .line 47
    .line 48
    const-string v6, "zzg"

    .line 49
    .line 50
    const-string v7, "zzh"

    .line 51
    .line 52
    const-string v8, "zzi"

    .line 53
    .line 54
    const-class v9, Lcom/google/android/gms/internal/ads/c0;

    .line 55
    .line 56
    const-string v10, "zzj"

    .line 57
    .line 58
    const-string v11, "zzk"

    .line 59
    .line 60
    const-string v12, "zzl"

    .line 61
    .line 62
    const-string v13, "zzm"

    .line 63
    .line 64
    const-string v14, "zzn"

    .line 65
    .line 66
    filled-new-array/range {v1 .. v16}, [Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    sget-object v1, Lcom/google/android/gms/internal/ads/x;->zzb:Lcom/google/android/gms/internal/ads/x;

    .line 71
    .line 72
    const-string v2, "\u0001\u000b\u0000\u0001\u0007\u0011\u000b\u0000\u0002\u0000\u0007\u180c\u0000\u0008\u180c\u0001\t\u1009\u0002\n\u1009\u0003\u000b\u001b\u000c\u1009\u0004\r\u1009\u0005\u000e\u1009\u0006\u000f\u1009\u0007\u0010\u1009\u0008\u0011\u001b"

    .line 73
    .line 74
    invoke-static {v1, v2, v0}, Lcom/google/android/gms/internal/ads/p5;->z(Ll/fkx0;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    return-object v0

    .line 79
    :cond_4
    const/4 v0, 0x1

    .line 80
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    return-object v0
.end method

.method public final N()Lcom/google/android/gms/internal/ads/e0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/x;->zzh:Lcom/google/android/gms/internal/ads/e0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/ads/e0;->M()Lcom/google/android/gms/internal/ads/e0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method
