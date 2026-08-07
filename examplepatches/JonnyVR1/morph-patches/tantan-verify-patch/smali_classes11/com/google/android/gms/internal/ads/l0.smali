.class public final Lcom/google/android/gms/internal/ads/l0;
.super Lcom/google/android/gms/internal/ads/p5;
.source "SourceFile"

# interfaces
.implements Ll/gkx0;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/ads/l0;


# instance fields
.field private zzd:I

.field private zze:Lcom/google/android/gms/internal/ads/j0;

.field private zzf:Ll/fjx0;

.field private zzg:I

.field private zzh:Lcom/google/android/gms/internal/ads/u0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/l0;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/l0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/ads/l0;->zzb:Lcom/google/android/gms/internal/ads/l0;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/gms/internal/ads/l0;

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
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/l0;->zzf:Ll/fjx0;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic L()Lcom/google/android/gms/internal/ads/l0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/l0;->zzb:Lcom/google/android/gms/internal/ads/l0;

    return-object v0
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
    sget-object p0, Lcom/google/android/gms/internal/ads/l0;->zzb:Lcom/google/android/gms/internal/ads/l0;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    new-instance p0, Ll/bes0;

    .line 23
    .line 24
    invoke-direct {p0, p2}, Ll/bes0;-><init>(Ll/mcs0;)V

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    new-instance p0, Lcom/google/android/gms/internal/ads/l0;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/google/android/gms/internal/ads/l0;-><init>()V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_3
    sget-object v5, Ll/wds0;->a:Ll/zhx0;

    .line 35
    .line 36
    const-string v6, "zzh"

    .line 37
    .line 38
    const-string v0, "zzd"

    .line 39
    .line 40
    const-string v1, "zze"

    .line 41
    .line 42
    const-string v2, "zzf"

    .line 43
    .line 44
    const-class v3, Lcom/google/android/gms/internal/ads/t0;

    .line 45
    .line 46
    const-string v4, "zzg"

    .line 47
    .line 48
    filled-new-array/range {v0 .. v6}, [Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    sget-object p1, Lcom/google/android/gms/internal/ads/l0;->zzb:Lcom/google/android/gms/internal/ads/l0;

    .line 53
    .line 54
    const-string p2, "\u0001\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0001\u0000\u0001\u1009\u0000\u0002\u001b\u0003\u180c\u0001\u0004\u1009\u0002"

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
