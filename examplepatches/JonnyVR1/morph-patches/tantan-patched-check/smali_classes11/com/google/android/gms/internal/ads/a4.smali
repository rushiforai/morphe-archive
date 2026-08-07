.class public final Lcom/google/android/gms/internal/ads/a4;
.super Lcom/google/android/gms/internal/ads/p5;
.source "SourceFile"

# interfaces
.implements Ll/gkx0;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/ads/a4;


# instance fields
.field private zzd:I

.field private zze:I

.field private zzf:Lcom/google/android/gms/internal/ads/b4;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/a4;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/a4;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/ads/a4;->zzb:Lcom/google/android/gms/internal/ads/a4;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/gms/internal/ads/a4;

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

.method public static M()Ll/dbx0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/a4;->zzb:Lcom/google/android/gms/internal/ads/a4;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/p5;->j()Ll/shx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/dbx0;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic N()Lcom/google/android/gms/internal/ads/a4;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/a4;->zzb:Lcom/google/android/gms/internal/ads/a4;

    return-object v0
.end method

.method public static O(Lcom/google/android/gms/internal/ads/zzgyl;Ll/jhx0;)Lcom/google/android/gms/internal/ads/a4;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhag;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/a4;->zzb:Lcom/google/android/gms/internal/ads/a4;

    .line 2
    .line 3
    invoke-static {v0, p0, p1}, Lcom/google/android/gms/internal/ads/p5;->p(Lcom/google/android/gms/internal/ads/p5;Lcom/google/android/gms/internal/ads/zzgyl;Ll/jhx0;)Lcom/google/android/gms/internal/ads/p5;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/google/android/gms/internal/ads/a4;

    .line 8
    .line 9
    return-object p0
.end method

.method public static synthetic Q(Lcom/google/android/gms/internal/ads/a4;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/gms/internal/ads/a4;->zze:I

    return-void
.end method

.method public static synthetic R(Lcom/google/android/gms/internal/ads/a4;Lcom/google/android/gms/internal/ads/b4;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/a4;->zzf:Lcom/google/android/gms/internal/ads/b4;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/gms/internal/ads/a4;->zzd:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/gms/internal/ads/a4;->zzd:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

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
    sget-object p0, Lcom/google/android/gms/internal/ads/a4;->zzb:Lcom/google/android/gms/internal/ads/a4;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    new-instance p0, Ll/dbx0;

    .line 23
    .line 24
    invoke-direct {p0, p2}, Ll/dbx0;-><init>(Ll/cbx0;)V

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    new-instance p0, Lcom/google/android/gms/internal/ads/a4;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/google/android/gms/internal/ads/a4;-><init>()V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_3
    const-string p0, "zze"

    .line 35
    .line 36
    const-string p1, "zzf"

    .line 37
    .line 38
    const-string p2, "zzd"

    .line 39
    .line 40
    filled-new-array {p2, p0, p1}, [Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    sget-object p1, Lcom/google/android/gms/internal/ads/a4;->zzb:Lcom/google/android/gms/internal/ads/a4;

    .line 45
    .line 46
    const-string p2, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u000b\u0002\u1009\u0000"

    .line 47
    .line 48
    invoke-static {p1, p2, p0}, Lcom/google/android/gms/internal/ads/p5;->z(Ll/fkx0;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0

    .line 53
    :cond_4
    const/4 p0, 0x1

    .line 54
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method

.method public final L()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/ads/a4;->zze:I

    return p0
.end method

.method public final P()Lcom/google/android/gms/internal/ads/b4;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/a4;->zzf:Lcom/google/android/gms/internal/ads/b4;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/ads/b4;->O()Lcom/google/android/gms/internal/ads/b4;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method
