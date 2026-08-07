.class public final Lcom/google/android/gms/internal/ads/y;
.super Lcom/google/android/gms/internal/ads/p5;
.source "SourceFile"

# interfaces
.implements Ll/gkx0;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/ads/y;


# instance fields
.field private zzd:I

.field private zze:I

.field private zzf:Lcom/google/android/gms/internal/ads/z;

.field private zzg:Lcom/google/android/gms/internal/ads/a0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/y;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/y;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/ads/y;->zzb:Lcom/google/android/gms/internal/ads/y;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/gms/internal/ads/y;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/ads/p5;->C(Ljava/lang/Class;Lcom/google/android/gms/internal/ads/p5;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/ads/p5;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static L()Ll/zcs0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/y;->zzb:Lcom/google/android/gms/internal/ads/y;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/p5;->j()Ll/shx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/zcs0;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic M()Lcom/google/android/gms/internal/ads/y;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/y;->zzb:Lcom/google/android/gms/internal/ads/y;

    return-object v0
.end method

.method public static synthetic N(Lcom/google/android/gms/internal/ads/y;Lcom/google/android/gms/internal/ads/z;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/y;->zzf:Lcom/google/android/gms/internal/ads/z;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/gms/internal/ads/y;->zzd:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x2

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/gms/internal/ads/y;->zzd:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic O(Lcom/google/android/gms/internal/ads/y;Lcom/google/android/gms/internal/ads/a0;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/y;->zzg:Lcom/google/android/gms/internal/ads/a0;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/gms/internal/ads/y;->zzd:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x4

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/gms/internal/ads/y;->zzd:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic P(Lcom/google/android/gms/internal/ads/y;I)V
    .locals 1

    .line 1
    const/4 p1, 0x1

    iput p1, p0, Lcom/google/android/gms/internal/ads/y;->zze:I

    iget v0, p0, Lcom/google/android/gms/internal/ads/y;->zzd:I

    or-int/2addr p1, v0

    iput p1, p0, Lcom/google/android/gms/internal/ads/y;->zzd:I

    return-void
.end method


# virtual methods
.method public final H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

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
    sget-object p0, Lcom/google/android/gms/internal/ads/y;->zzb:Lcom/google/android/gms/internal/ads/y;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    new-instance p0, Ll/zcs0;

    .line 23
    .line 24
    invoke-direct {p0, p2}, Ll/zcs0;-><init>(Ll/mcs0;)V

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    new-instance p0, Lcom/google/android/gms/internal/ads/y;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/google/android/gms/internal/ads/y;-><init>()V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_3
    sget-object p0, Ll/bds0;->a:Ll/zhx0;

    .line 35
    .line 36
    const-string p1, "zzf"

    .line 37
    .line 38
    const-string p2, "zzg"

    .line 39
    .line 40
    const-string p3, "zzd"

    .line 41
    .line 42
    const-string v0, "zze"

    .line 43
    .line 44
    filled-new-array {p3, v0, p0, p1, p2}, [Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    sget-object p1, Lcom/google/android/gms/internal/ads/y;->zzb:Lcom/google/android/gms/internal/ads/y;

    .line 49
    .line 50
    const-string p2, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u180c\u0000\u0002\u1009\u0001\u0003\u1009\u0002"

    .line 51
    .line 52
    invoke-static {p1, p2, p0}, Lcom/google/android/gms/internal/ads/p5;->z(Ll/fkx0;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0

    .line 57
    :cond_4
    const/4 p0, 0x1

    .line 58
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
