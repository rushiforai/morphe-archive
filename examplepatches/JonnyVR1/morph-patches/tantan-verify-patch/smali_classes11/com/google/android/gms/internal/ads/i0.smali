.class public final Lcom/google/android/gms/internal/ads/i0;
.super Lcom/google/android/gms/internal/ads/p5;
.source "SourceFile"

# interfaces
.implements Ll/gkx0;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/ads/i0;


# instance fields
.field private zzd:I

.field private zze:I

.field private zzf:Ljava/lang/String;

.field private zzg:I

.field private zzh:I

.field private zzi:Lcom/google/android/gms/internal/ads/v0;

.field private zzj:Ll/ejx0;

.field private zzk:Lcom/google/android/gms/internal/ads/g0;

.field private zzl:Lcom/google/android/gms/internal/ads/h0;

.field private zzm:Lcom/google/android/gms/internal/ads/m0;

.field private zzn:Lcom/google/android/gms/internal/ads/x;

.field private zzo:Lcom/google/android/gms/internal/ads/p0;

.field private zzp:Lcom/google/android/gms/internal/ads/f1;

.field private zzq:Lcom/google/android/gms/internal/ads/b0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/i0;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/i0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/ads/i0;->zzb:Lcom/google/android/gms/internal/ads/i0;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/gms/internal/ads/i0;

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
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/i0;->zzf:Ljava/lang/String;

    .line 7
    .line 8
    const/16 v0, 0x3e8

    .line 9
    .line 10
    iput v0, p0, Lcom/google/android/gms/internal/ads/i0;->zzh:I

    .line 11
    .line 12
    invoke-static {}, Lcom/google/android/gms/internal/ads/p5;->u()Ll/ejx0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/i0;->zzj:Ll/ejx0;

    .line 17
    .line 18
    return-void
.end method

.method public static N()Ll/yds0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/i0;->zzb:Lcom/google/android/gms/internal/ads/i0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/p5;->j()Ll/shx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/yds0;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic O()Lcom/google/android/gms/internal/ads/i0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/i0;->zzb:Lcom/google/android/gms/internal/ads/i0;

    return-object v0
.end method

.method public static synthetic Q(Lcom/google/android/gms/internal/ads/i0;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/google/android/gms/internal/ads/i0;->zzd:I

    .line 5
    .line 6
    or-int/lit8 v0, v0, 0x2

    .line 7
    .line 8
    iput v0, p0, Lcom/google/android/gms/internal/ads/i0;->zzd:I

    .line 9
    .line 10
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/i0;->zzf:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic R(Lcom/google/android/gms/internal/ads/i0;Ljava/lang/Iterable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/ads/i0;->zzj:Ll/ejx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/fjx0;->zzc()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/p5;->v(Ll/ejx0;)Ll/ejx0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/i0;->zzj:Ll/ejx0;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/i0;->zzj:Ll/ejx0;

    .line 16
    .line 17
    invoke-static {p1, p0}, Lcom/google/android/gms/internal/ads/h5;->f(Ljava/lang/Iterable;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic S(Lcom/google/android/gms/internal/ads/i0;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/ads/p5;->u()Ll/ejx0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/i0;->zzj:Ll/ejx0;

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic T(Lcom/google/android/gms/internal/ads/i0;Lcom/google/android/gms/internal/ads/g0;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/i0;->zzk:Lcom/google/android/gms/internal/ads/g0;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/gms/internal/ads/i0;->zzd:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x20

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/gms/internal/ads/i0;->zzd:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic U(Lcom/google/android/gms/internal/ads/i0;Lcom/google/android/gms/internal/ads/x;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/i0;->zzn:Lcom/google/android/gms/internal/ads/x;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/gms/internal/ads/i0;->zzd:I

    .line 7
    .line 8
    or-int/lit16 p1, p1, 0x100

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/gms/internal/ads/i0;->zzd:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic V(Lcom/google/android/gms/internal/ads/i0;Lcom/google/android/gms/internal/ads/p0;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/i0;->zzo:Lcom/google/android/gms/internal/ads/p0;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/gms/internal/ads/i0;->zzd:I

    .line 7
    .line 8
    or-int/lit16 p1, p1, 0x200

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/gms/internal/ads/i0;->zzd:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic W(Lcom/google/android/gms/internal/ads/i0;Lcom/google/android/gms/internal/ads/f1;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/i0;->zzp:Lcom/google/android/gms/internal/ads/f1;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/gms/internal/ads/i0;->zzd:I

    .line 7
    .line 8
    or-int/lit16 p1, p1, 0x400

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/gms/internal/ads/i0;->zzd:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic X(Lcom/google/android/gms/internal/ads/i0;Lcom/google/android/gms/internal/ads/b0;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/i0;->zzq:Lcom/google/android/gms/internal/ads/b0;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/gms/internal/ads/i0;->zzd:I

    .line 7
    .line 8
    or-int/lit16 p1, p1, 0x800

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/gms/internal/ads/i0;->zzd:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 16

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
    sget-object v0, Lcom/google/android/gms/internal/ads/i0;->zzb:Lcom/google/android/gms/internal/ads/i0;

    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_1
    new-instance v0, Ll/yds0;

    .line 23
    .line 24
    invoke-direct {v0, v2}, Ll/yds0;-><init>(Ll/mcs0;)V

    .line 25
    .line 26
    .line 27
    return-object v0

    .line 28
    :cond_2
    new-instance v0, Lcom/google/android/gms/internal/ads/i0;

    .line 29
    .line 30
    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/i0;-><init>()V

    .line 31
    .line 32
    .line 33
    return-object v0

    .line 34
    :cond_3
    sget-object v6, Ll/wds0;->a:Ll/zhx0;

    .line 35
    .line 36
    const-string v14, "zzp"

    .line 37
    .line 38
    const-string v15, "zzq"

    .line 39
    .line 40
    const-string v1, "zzd"

    .line 41
    .line 42
    const-string v2, "zze"

    .line 43
    .line 44
    const-string v3, "zzf"

    .line 45
    .line 46
    const-string v4, "zzg"

    .line 47
    .line 48
    const-string v5, "zzh"

    .line 49
    .line 50
    const-string v7, "zzi"

    .line 51
    .line 52
    const-string v8, "zzj"

    .line 53
    .line 54
    const-string v9, "zzk"

    .line 55
    .line 56
    const-string v10, "zzl"

    .line 57
    .line 58
    const-string v11, "zzm"

    .line 59
    .line 60
    const-string v12, "zzn"

    .line 61
    .line 62
    const-string v13, "zzo"

    .line 63
    .line 64
    filled-new-array/range {v1 .. v15}, [Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    sget-object v1, Lcom/google/android/gms/internal/ads/i0;->zzb:Lcom/google/android/gms/internal/ads/i0;

    .line 69
    .line 70
    const-string v2, "\u0001\r\u0000\u0001\t\u0015\r\u0000\u0001\u0000\t\u1004\u0000\n\u1008\u0001\u000b\u100b\u0002\u000c\u180c\u0003\r\u1009\u0004\u000e\u0015\u000f\u1009\u0005\u0010\u1009\u0006\u0011\u1009\u0007\u0012\u1009\u0008\u0013\u1009\t\u0014\u1009\n\u0015\u1009\u000b"

    .line 71
    .line 72
    invoke-static {v1, v2, v0}, Lcom/google/android/gms/internal/ads/p5;->z(Ll/fkx0;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    return-object v0

    .line 77
    :cond_4
    const/4 v0, 0x1

    .line 78
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    return-object v0
.end method

.method public final L()Lcom/google/android/gms/internal/ads/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/i0;->zzn:Lcom/google/android/gms/internal/ads/x;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/ads/x;->M()Lcom/google/android/gms/internal/ads/x;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public final M()Lcom/google/android/gms/internal/ads/g0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/i0;->zzk:Lcom/google/android/gms/internal/ads/g0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/ads/g0;->M()Lcom/google/android/gms/internal/ads/g0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public final P()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/i0;->zzf:Ljava/lang/String;

    return-object p0
.end method
