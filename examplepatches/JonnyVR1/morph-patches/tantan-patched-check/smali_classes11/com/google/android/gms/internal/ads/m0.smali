.class public final Lcom/google/android/gms/internal/ads/m0;
.super Lcom/google/android/gms/internal/ads/p5;
.source "SourceFile"

# interfaces
.implements Ll/gkx0;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/ads/m0;


# instance fields
.field private zzd:I

.field private zze:I

.field private zzf:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/m0;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/m0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/ads/m0;->zzb:Lcom/google/android/gms/internal/ads/m0;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/gms/internal/ads/m0;

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

.method public static L()Ll/ces0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/m0;->zzb:Lcom/google/android/gms/internal/ads/m0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/p5;->j()Ll/shx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/ces0;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic M()Lcom/google/android/gms/internal/ads/m0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/m0;->zzb:Lcom/google/android/gms/internal/ads/m0;

    return-object v0
.end method

.method public static N()Lcom/google/android/gms/internal/ads/m0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/m0;->zzb:Lcom/google/android/gms/internal/ads/m0;

    return-object v0
.end method

.method public static synthetic S(Lcom/google/android/gms/internal/ads/m0;I)V
    .locals 0

    .line 1
    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/gms/internal/ads/m0;->zze:I

    iget p1, p0, Lcom/google/android/gms/internal/ads/m0;->zzd:I

    or-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/google/android/gms/internal/ads/m0;->zzd:I

    return-void
.end method

.method public static synthetic T(Lcom/google/android/gms/internal/ads/m0;I)V
    .locals 0

    .line 1
    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/gms/internal/ads/m0;->zzf:I

    iget p1, p0, Lcom/google/android/gms/internal/ads/m0;->zzd:I

    or-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/google/android/gms/internal/ads/m0;->zzd:I

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
    sget-object p0, Lcom/google/android/gms/internal/ads/m0;->zzb:Lcom/google/android/gms/internal/ads/m0;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    new-instance p0, Ll/ces0;

    .line 23
    .line 24
    invoke-direct {p0, p2}, Ll/ces0;-><init>(Ll/mcs0;)V

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    new-instance p0, Lcom/google/android/gms/internal/ads/m0;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/google/android/gms/internal/ads/m0;-><init>()V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_3
    sget-object p0, Ll/hes0;->a:Ll/zhx0;

    .line 35
    .line 36
    const-string p1, "zzf"

    .line 37
    .line 38
    sget-object p2, Ll/ees0;->a:Ll/zhx0;

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
    sget-object p1, Lcom/google/android/gms/internal/ads/m0;->zzb:Lcom/google/android/gms/internal/ads/m0;

    .line 49
    .line 50
    const-string p2, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u180c\u0000\u0002\u180c\u0001"

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

.method public final O()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/ads/m0;->zzd:I

    and-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final P()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/ads/m0;->zzd:I

    const/4 v0, 0x1

    and-int/2addr p0, v0

    if-eqz p0, :cond_0

    return v0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final Q()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/ads/m0;->zzf:I

    invoke-static {p0}, Ll/fes0;->a(I)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    :cond_0
    return p0
.end method

.method public final R()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/ads/m0;->zze:I

    invoke-static {p0}, Ll/ies0;->a(I)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    :cond_0
    return p0
.end method
