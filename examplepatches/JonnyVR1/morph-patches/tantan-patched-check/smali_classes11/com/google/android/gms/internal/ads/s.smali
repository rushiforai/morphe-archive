.class public final Lcom/google/android/gms/internal/ads/s;
.super Lcom/google/android/gms/internal/ads/p5;
.source "SourceFile"

# interfaces
.implements Ll/gkx0;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/ads/s;


# instance fields
.field private zzd:I

.field private zze:Ll/fjx0;

.field private zzf:Lcom/google/android/gms/internal/ads/zzgyl;

.field private zzg:I

.field private zzh:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/s;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/s;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/ads/s;->zzb:Lcom/google/android/gms/internal/ads/s;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/gms/internal/ads/s;

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
    invoke-static {}, Lcom/google/android/gms/internal/ads/p5;->w()Ll/fjx0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/s;->zze:Ll/fjx0;

    .line 9
    .line 10
    sget-object v0, Lcom/google/android/gms/internal/ads/zzgyl;->zzb:Lcom/google/android/gms/internal/ads/zzgyl;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/s;->zzf:Lcom/google/android/gms/internal/ads/zzgyl;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput v0, p0, Lcom/google/android/gms/internal/ads/s;->zzg:I

    .line 16
    .line 17
    iput v0, p0, Lcom/google/android/gms/internal/ads/s;->zzh:I

    .line 18
    .line 19
    return-void
.end method

.method public static L()Ll/l0s0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/s;->zzb:Lcom/google/android/gms/internal/ads/s;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/p5;->j()Ll/shx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/l0s0;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic M()Lcom/google/android/gms/internal/ads/s;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/s;->zzb:Lcom/google/android/gms/internal/ads/s;

    return-object v0
.end method

.method public static synthetic N(Lcom/google/android/gms/internal/ads/s;Lcom/google/android/gms/internal/ads/zzgyl;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/ads/s;->zze:Ll/fjx0;

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
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/p5;->x(Ll/fjx0;)Ll/fjx0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/s;->zze:Ll/fjx0;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/s;->zze:Ll/fjx0;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic O(Lcom/google/android/gms/internal/ads/s;Lcom/google/android/gms/internal/ads/zzgyl;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/ads/s;->zzd:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/ads/s;->zzd:I

    iput-object p1, p0, Lcom/google/android/gms/internal/ads/s;->zzf:Lcom/google/android/gms/internal/ads/zzgyl;

    return-void
.end method

.method public static synthetic P(Lcom/google/android/gms/internal/ads/s;I)V
    .locals 1

    .line 1
    const/4 p1, 0x4

    iput p1, p0, Lcom/google/android/gms/internal/ads/s;->zzh:I

    iget v0, p0, Lcom/google/android/gms/internal/ads/s;->zzd:I

    or-int/2addr p1, v0

    iput p1, p0, Lcom/google/android/gms/internal/ads/s;->zzd:I

    return-void
.end method


# virtual methods
.method public final H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    add-int/lit8 p1, p1, -0x1

    .line 2
    .line 3
    if-eqz p1, :cond_4

    .line 4
    .line 5
    const/4 p0, 0x2

    .line 6
    if-eq p1, p0, :cond_3

    .line 7
    .line 8
    const/4 p0, 0x3

    .line 9
    if-eq p1, p0, :cond_2

    .line 10
    .line 11
    const/4 p0, 0x4

    .line 12
    const/4 p2, 0x0

    .line 13
    if-eq p1, p0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x5

    .line 16
    if-eq p1, p0, :cond_0

    .line 17
    .line 18
    return-object p2

    .line 19
    :cond_0
    sget-object p0, Lcom/google/android/gms/internal/ads/s;->zzb:Lcom/google/android/gms/internal/ads/s;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    new-instance p0, Ll/l0s0;

    .line 23
    .line 24
    invoke-direct {p0, p2}, Ll/l0s0;-><init>(Ll/ezr0;)V

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    new-instance p0, Lcom/google/android/gms/internal/ads/s;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/google/android/gms/internal/ads/s;-><init>()V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_3
    sget-object v4, Ll/i0s0;->a:Ll/zhx0;

    .line 35
    .line 36
    const-string v5, "zzh"

    .line 37
    .line 38
    sget-object v6, Ll/g0s0;->a:Ll/zhx0;

    .line 39
    .line 40
    const-string v0, "zzd"

    .line 41
    .line 42
    const-string v1, "zze"

    .line 43
    .line 44
    const-string v2, "zzf"

    .line 45
    .line 46
    const-string v3, "zzg"

    .line 47
    .line 48
    filled-new-array/range {v0 .. v6}, [Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    sget-object p1, Lcom/google/android/gms/internal/ads/s;->zzb:Lcom/google/android/gms/internal/ads/s;

    .line 53
    .line 54
    const-string p2, "\u0001\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0001\u0000\u0001\u001c\u0002\u100a\u0000\u0003\u180c\u0001\u0004\u180c\u0002"

    .line 55
    .line 56
    invoke-static {p1, p2, p0}, Lcom/google/android/gms/internal/ads/p5;->z(Ll/fkx0;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :cond_4
    const/4 p0, 0x1

    .line 62
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method
