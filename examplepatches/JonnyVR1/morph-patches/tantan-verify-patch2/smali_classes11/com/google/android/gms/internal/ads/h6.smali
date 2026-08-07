.class public final Lcom/google/android/gms/internal/ads/h6;
.super Lcom/google/android/gms/internal/ads/p5;
.source "SourceFile"

# interfaces
.implements Ll/gkx0;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/ads/h6;


# instance fields
.field private zzd:I

.field private zze:Lcom/google/android/gms/internal/ads/zzgyl;

.field private zzf:Lcom/google/android/gms/internal/ads/zzgyl;

.field private zzg:B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/h6;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/h6;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/ads/h6;->zzb:Lcom/google/android/gms/internal/ads/h6;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/gms/internal/ads/h6;

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
    iput-byte v0, p0, Lcom/google/android/gms/internal/ads/h6;->zzg:B

    .line 6
    .line 7
    sget-object v0, Lcom/google/android/gms/internal/ads/zzgyl;->zzb:Lcom/google/android/gms/internal/ads/zzgyl;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/h6;->zze:Lcom/google/android/gms/internal/ads/zzgyl;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/h6;->zzf:Lcom/google/android/gms/internal/ads/zzgyl;

    .line 12
    .line 13
    return-void
.end method

.method public static L()Ll/inx0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/h6;->zzb:Lcom/google/android/gms/internal/ads/h6;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/p5;->j()Ll/shx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/inx0;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic M()Lcom/google/android/gms/internal/ads/h6;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/h6;->zzb:Lcom/google/android/gms/internal/ads/h6;

    return-object v0
.end method

.method public static synthetic N(Lcom/google/android/gms/internal/ads/h6;Lcom/google/android/gms/internal/ads/zzgyl;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/ads/h6;->zzd:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/ads/h6;->zzd:I

    iput-object p1, p0, Lcom/google/android/gms/internal/ads/h6;->zze:Lcom/google/android/gms/internal/ads/zzgyl;

    return-void
.end method

.method public static synthetic O(Lcom/google/android/gms/internal/ads/h6;Lcom/google/android/gms/internal/ads/zzgyl;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/ads/h6;->zzd:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/google/android/gms/internal/ads/h6;->zzd:I

    iput-object p1, p0, Lcom/google/android/gms/internal/ads/h6;->zzf:Lcom/google/android/gms/internal/ads/zzgyl;

    return-void
.end method


# virtual methods
.method public final H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

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
    iput-byte p1, p0, Lcom/google/android/gms/internal/ads/h6;->zzg:B

    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_1
    sget-object p0, Lcom/google/android/gms/internal/ads/h6;->zzb:Lcom/google/android/gms/internal/ads/h6;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_2
    new-instance p0, Ll/inx0;

    .line 30
    .line 31
    invoke-direct {p0, v0}, Ll/inx0;-><init>(Ll/mmx0;)V

    .line 32
    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_3
    new-instance p0, Lcom/google/android/gms/internal/ads/h6;

    .line 36
    .line 37
    invoke-direct {p0}, Lcom/google/android/gms/internal/ads/h6;-><init>()V

    .line 38
    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_4
    const-string p0, "zze"

    .line 42
    .line 43
    const-string p1, "zzf"

    .line 44
    .line 45
    const-string p2, "zzd"

    .line 46
    .line 47
    filled-new-array {p2, p0, p1}, [Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    sget-object p1, Lcom/google/android/gms/internal/ads/h6;->zzb:Lcom/google/android/gms/internal/ads/h6;

    .line 52
    .line 53
    const-string p2, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0001\u0001\u150a\u0000\u0002\u100a\u0001"

    .line 54
    .line 55
    invoke-static {p1, p2, p0}, Lcom/google/android/gms/internal/ads/p5;->z(Ll/fkx0;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_5
    iget-byte p0, p0, Lcom/google/android/gms/internal/ads/h6;->zzg:B

    .line 61
    .line 62
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method
