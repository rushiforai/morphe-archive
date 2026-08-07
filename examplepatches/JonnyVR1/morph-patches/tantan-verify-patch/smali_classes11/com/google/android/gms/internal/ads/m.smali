.class public final Lcom/google/android/gms/internal/ads/m;
.super Lcom/google/android/gms/internal/ads/p5;
.source "SourceFile"

# interfaces
.implements Ll/gkx0;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/ads/m;


# instance fields
.field private zzd:I

.field private zze:J

.field private zzf:J

.field private zzg:J

.field private zzh:J

.field private zzi:J

.field private zzj:J

.field private zzk:J

.field private zzl:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/m;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/m;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/ads/m;->zzb:Lcom/google/android/gms/internal/ads/m;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/gms/internal/ads/m;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/ads/p5;->C(Ljava/lang/Class;Lcom/google/android/gms/internal/ads/p5;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/ads/p5;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/google/android/gms/internal/ads/m;->zze:J

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/google/android/gms/internal/ads/m;->zzf:J

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/google/android/gms/internal/ads/m;->zzg:J

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/google/android/gms/internal/ads/m;->zzh:J

    .line 13
    .line 14
    iput-wide v0, p0, Lcom/google/android/gms/internal/ads/m;->zzi:J

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/google/android/gms/internal/ads/m;->zzj:J

    .line 17
    .line 18
    iput-wide v0, p0, Lcom/google/android/gms/internal/ads/m;->zzk:J

    .line 19
    .line 20
    iput-wide v0, p0, Lcom/google/android/gms/internal/ads/m;->zzl:J

    .line 21
    .line 22
    return-void
.end method

.method public static L()Ll/d0s0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/m;->zzb:Lcom/google/android/gms/internal/ads/m;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/p5;->j()Ll/shx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/d0s0;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic M()Lcom/google/android/gms/internal/ads/m;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/m;->zzb:Lcom/google/android/gms/internal/ads/m;

    return-object v0
.end method

.method public static synthetic N(Lcom/google/android/gms/internal/ads/m;J)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/ads/m;->zzd:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/ads/m;->zzd:I

    iput-wide p1, p0, Lcom/google/android/gms/internal/ads/m;->zze:J

    return-void
.end method

.method public static synthetic O(Lcom/google/android/gms/internal/ads/m;J)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/ads/m;->zzd:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/google/android/gms/internal/ads/m;->zzd:I

    iput-wide p1, p0, Lcom/google/android/gms/internal/ads/m;->zzg:J

    return-void
.end method

.method public static synthetic P(Lcom/google/android/gms/internal/ads/m;J)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/ads/m;->zzd:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/google/android/gms/internal/ads/m;->zzd:I

    iput-wide p1, p0, Lcom/google/android/gms/internal/ads/m;->zzh:J

    return-void
.end method

.method public static synthetic Q(Lcom/google/android/gms/internal/ads/m;J)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/ads/m;->zzd:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/google/android/gms/internal/ads/m;->zzd:I

    iput-wide p1, p0, Lcom/google/android/gms/internal/ads/m;->zzi:J

    return-void
.end method

.method public static synthetic R(Lcom/google/android/gms/internal/ads/m;J)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/ads/m;->zzd:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/google/android/gms/internal/ads/m;->zzd:I

    iput-wide p1, p0, Lcom/google/android/gms/internal/ads/m;->zzj:J

    return-void
.end method


# virtual methods
.method public final H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

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
    sget-object p0, Lcom/google/android/gms/internal/ads/m;->zzb:Lcom/google/android/gms/internal/ads/m;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    new-instance p0, Ll/d0s0;

    .line 23
    .line 24
    invoke-direct {p0, p2}, Ll/d0s0;-><init>(Ll/ezr0;)V

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    new-instance p0, Lcom/google/android/gms/internal/ads/m;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/google/android/gms/internal/ads/m;-><init>()V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_3
    const-string v7, "zzk"

    .line 35
    .line 36
    const-string v8, "zzl"

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
    const-string v3, "zzg"

    .line 45
    .line 46
    const-string v4, "zzh"

    .line 47
    .line 48
    const-string v5, "zzi"

    .line 49
    .line 50
    const-string v6, "zzj"

    .line 51
    .line 52
    filled-new-array/range {v0 .. v8}, [Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    sget-object p1, Lcom/google/android/gms/internal/ads/m;->zzb:Lcom/google/android/gms/internal/ads/m;

    .line 57
    .line 58
    const-string p2, "\u0001\u0008\u0000\u0001\u0001\u0008\u0008\u0000\u0000\u0000\u0001\u1002\u0000\u0002\u1002\u0001\u0003\u1002\u0002\u0004\u1002\u0003\u0005\u1002\u0004\u0006\u1002\u0005\u0007\u1002\u0006\u0008\u1002\u0007"

    .line 59
    .line 60
    invoke-static {p1, p2, p0}, Lcom/google/android/gms/internal/ads/p5;->z(Ll/fkx0;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :cond_4
    const/4 p0, 0x1

    .line 66
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method
