.class public final Lcom/google/android/gms/internal/ads/r1;
.super Lcom/google/android/gms/internal/ads/p5;
.source "SourceFile"

# interfaces
.implements Ll/gkx0;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/ads/r1;


# instance fields
.field private zzd:Ll/fjx0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/r1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/r1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/ads/r1;->zzb:Lcom/google/android/gms/internal/ads/r1;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/gms/internal/ads/r1;

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
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/r1;->zzd:Ll/fjx0;

    .line 9
    .line 10
    return-void
.end method

.method public static M()Ll/lew0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/r1;->zzb:Lcom/google/android/gms/internal/ads/r1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/p5;->j()Ll/shx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/lew0;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic N()Lcom/google/android/gms/internal/ads/r1;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/r1;->zzb:Lcom/google/android/gms/internal/ads/r1;

    return-object v0
.end method

.method public static synthetic O(Lcom/google/android/gms/internal/ads/r1;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/ads/p5;->w()Ll/fjx0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/r1;->zzd:Ll/fjx0;

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic P(Lcom/google/android/gms/internal/ads/r1;Lcom/google/android/gms/internal/ads/q1;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/internal/ads/r1;->zzd:Ll/fjx0;

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
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/r1;->zzd:Ll/fjx0;

    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/r1;->zzd:Ll/fjx0;

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
    sget-object p0, Lcom/google/android/gms/internal/ads/r1;->zzb:Lcom/google/android/gms/internal/ads/r1;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    new-instance p0, Ll/lew0;

    .line 23
    .line 24
    invoke-direct {p0, p2}, Ll/lew0;-><init>(Ll/kew0;)V

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    new-instance p0, Lcom/google/android/gms/internal/ads/r1;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/google/android/gms/internal/ads/r1;-><init>()V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_3
    const-string p0, "zzd"

    .line 35
    .line 36
    const-class p1, Lcom/google/android/gms/internal/ads/q1;

    .line 37
    .line 38
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget-object p1, Lcom/google/android/gms/internal/ads/r1;->zzb:Lcom/google/android/gms/internal/ads/r1;

    .line 43
    .line 44
    const-string p2, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001b"

    .line 45
    .line 46
    invoke-static {p1, p2, p0}, Lcom/google/android/gms/internal/ads/p5;->z(Ll/fkx0;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_4
    const/4 p0, 0x1

    .line 52
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public final L()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/r1;->zzd:Ll/fjx0;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
