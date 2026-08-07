.class public final Lcom/google/android/gms/internal/ads/j6;
.super Lcom/google/android/gms/internal/ads/p5;
.source "SourceFile"

# interfaces
.implements Ll/gkx0;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/ads/j6;


# instance fields
.field private zzd:I

.field private zze:Lcom/google/android/gms/internal/ads/i6;

.field private zzf:Ll/fjx0;

.field private zzg:Lcom/google/android/gms/internal/ads/zzgyl;

.field private zzh:Lcom/google/android/gms/internal/ads/zzgyl;

.field private zzi:I

.field private zzj:B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/j6;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/j6;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/ads/j6;->zzb:Lcom/google/android/gms/internal/ads/j6;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/gms/internal/ads/j6;

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
    const/4 v0, 0x2

    .line 5
    iput-byte v0, p0, Lcom/google/android/gms/internal/ads/j6;->zzj:B

    .line 6
    .line 7
    invoke-static {}, Lcom/google/android/gms/internal/ads/p5;->w()Ll/fjx0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/j6;->zzf:Ll/fjx0;

    .line 12
    .line 13
    sget-object v0, Lcom/google/android/gms/internal/ads/zzgyl;->zzb:Lcom/google/android/gms/internal/ads/zzgyl;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/j6;->zzg:Lcom/google/android/gms/internal/ads/zzgyl;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/j6;->zzh:Lcom/google/android/gms/internal/ads/zzgyl;

    .line 18
    .line 19
    return-void
.end method

.method public static L()Ll/jnx0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/j6;->zzb:Lcom/google/android/gms/internal/ads/j6;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/p5;->j()Ll/shx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/jnx0;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic M()Lcom/google/android/gms/internal/ads/j6;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/j6;->zzb:Lcom/google/android/gms/internal/ads/j6;

    return-object v0
.end method

.method public static synthetic N(Lcom/google/android/gms/internal/ads/j6;Lcom/google/android/gms/internal/ads/h6;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/internal/ads/j6;->zzf:Ll/fjx0;

    .line 5
    .line 6
    invoke-interface {v0}, Ll/fjx0;->zzc()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/p5;->x(Ll/fjx0;)Ll/fjx0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/j6;->zzf:Ll/fjx0;

    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/j6;->zzf:Ll/fjx0;

    .line 19
    .line 20
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public final H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    add-int/lit8 p1, p1, -0x1

    .line 2
    .line 3
    if-eqz p1, :cond_5

    .line 4
    .line 5
    const/4 p3, 0x2

    .line 6
    if-eq p1, p3, :cond_4

    .line 7
    .line 8
    const/4 p3, 0x3

    .line 9
    if-eq p1, p3, :cond_3

    .line 10
    .line 11
    const/4 p3, 0x4

    .line 12
    const/4 v0, 0x0

    .line 13
    if-eq p1, p3, :cond_2

    .line 14
    .line 15
    const/4 p3, 0x5

    .line 16
    if-eq p1, p3, :cond_1

    .line 17
    .line 18
    if-nez p2, :cond_0

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p1, 0x1

    .line 23
    :goto_0
    iput-byte p1, p0, Lcom/google/android/gms/internal/ads/j6;->zzj:B

    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_1
    sget-object p0, Lcom/google/android/gms/internal/ads/j6;->zzb:Lcom/google/android/gms/internal/ads/j6;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_2
    new-instance p0, Ll/jnx0;

    .line 30
    .line 31
    invoke-direct {p0, v0}, Ll/jnx0;-><init>(Ll/mmx0;)V

    .line 32
    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_3
    new-instance p0, Lcom/google/android/gms/internal/ads/j6;

    .line 36
    .line 37
    invoke-direct {p0}, Lcom/google/android/gms/internal/ads/j6;-><init>()V

    .line 38
    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_4
    const-string v5, "zzh"

    .line 42
    .line 43
    const-string v6, "zzi"

    .line 44
    .line 45
    const-string v0, "zzd"

    .line 46
    .line 47
    const-string v1, "zze"

    .line 48
    .line 49
    const-string v2, "zzf"

    .line 50
    .line 51
    const-class v3, Lcom/google/android/gms/internal/ads/h6;

    .line 52
    .line 53
    const-string v4, "zzg"

    .line 54
    .line 55
    filled-new-array/range {v0 .. v6}, [Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    sget-object p1, Lcom/google/android/gms/internal/ads/j6;->zzb:Lcom/google/android/gms/internal/ads/j6;

    .line 60
    .line 61
    const-string p2, "\u0001\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0001\u0001\u0001\u1009\u0000\u0002\u041b\u0003\u100a\u0001\u0004\u100a\u0002\u0005\u1004\u0003"

    .line 62
    .line 63
    invoke-static {p1, p2, p0}, Lcom/google/android/gms/internal/ads/p5;->z(Ll/fkx0;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0

    .line 68
    :cond_5
    iget-byte p0, p0, Lcom/google/android/gms/internal/ads/j6;->zzj:B

    .line 69
    .line 70
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0
.end method
