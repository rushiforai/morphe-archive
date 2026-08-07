.class public final Lcom/google/android/gms/internal/ads/z3;
.super Lcom/google/android/gms/internal/ads/p5;
.source "SourceFile"

# interfaces
.implements Ll/gkx0;


# static fields
.field private static final zzb:Lcom/google/android/gms/internal/ads/z3;

.field private static volatile zzd:Ll/lkx0;


# instance fields
.field private zze:I

.field private zzf:I

.field private zzg:Lcom/google/android/gms/internal/ads/zzgyl;

.field private zzh:Lcom/google/android/gms/internal/ads/b4;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/z3;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/z3;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/ads/z3;->zzb:Lcom/google/android/gms/internal/ads/z3;

    .line 7
    .line 8
    const-class v1, Lcom/google/android/gms/internal/ads/z3;

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
    sget-object v0, Lcom/google/android/gms/internal/ads/zzgyl;->zzb:Lcom/google/android/gms/internal/ads/zzgyl;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/z3;->zzg:Lcom/google/android/gms/internal/ads/zzgyl;

    .line 7
    .line 8
    return-void
.end method

.method public static M()Ll/bbx0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/z3;->zzb:Lcom/google/android/gms/internal/ads/z3;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/p5;->j()Ll/shx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/bbx0;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic N()Lcom/google/android/gms/internal/ads/z3;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/z3;->zzb:Lcom/google/android/gms/internal/ads/z3;

    return-object v0
.end method

.method public static O(Lcom/google/android/gms/internal/ads/zzgyl;Ll/jhx0;)Lcom/google/android/gms/internal/ads/z3;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhag;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/z3;->zzb:Lcom/google/android/gms/internal/ads/z3;

    .line 2
    .line 3
    invoke-static {v0, p0, p1}, Lcom/google/android/gms/internal/ads/p5;->p(Lcom/google/android/gms/internal/ads/p5;Lcom/google/android/gms/internal/ads/zzgyl;Ll/jhx0;)Lcom/google/android/gms/internal/ads/p5;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/google/android/gms/internal/ads/z3;

    .line 8
    .line 9
    return-object p0
.end method

.method public static R()Ll/lkx0;
    .locals 3

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/z3;->zzb:Lcom/google/android/gms/internal/ads/z3;

    .line 2
    .line 3
    const/4 v1, 0x7

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-virtual {v0, v1, v2, v2}, Lcom/google/android/gms/internal/ads/p5;->H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/lkx0;

    .line 10
    .line 11
    return-object v0
.end method

.method public static synthetic S(Lcom/google/android/gms/internal/ads/z3;Lcom/google/android/gms/internal/ads/zzgyl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/z3;->zzg:Lcom/google/android/gms/internal/ads/zzgyl;

    return-void
.end method

.method public static synthetic T(Lcom/google/android/gms/internal/ads/z3;Lcom/google/android/gms/internal/ads/b4;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/z3;->zzh:Lcom/google/android/gms/internal/ads/b4;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/gms/internal/ads/z3;->zze:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/gms/internal/ads/z3;->zze:I

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
    if-eqz p1, :cond_7

    .line 4
    .line 5
    const/4 p0, 0x2

    .line 6
    if-eq p1, p0, :cond_6

    .line 7
    .line 8
    const/4 p0, 0x3

    .line 9
    if-eq p1, p0, :cond_5

    .line 10
    .line 11
    const/4 p0, 0x4

    .line 12
    const/4 p2, 0x0

    .line 13
    if-eq p1, p0, :cond_4

    .line 14
    .line 15
    const/4 p0, 0x5

    .line 16
    if-eq p1, p0, :cond_3

    .line 17
    .line 18
    const/4 p0, 0x6

    .line 19
    if-eq p1, p0, :cond_0

    .line 20
    .line 21
    return-object p2

    .line 22
    :cond_0
    sget-object p0, Lcom/google/android/gms/internal/ads/z3;->zzd:Ll/lkx0;

    .line 23
    .line 24
    if-nez p0, :cond_2

    .line 25
    .line 26
    const-class p1, Lcom/google/android/gms/internal/ads/z3;

    .line 27
    .line 28
    monitor-enter p1

    .line 29
    :try_start_0
    sget-object p0, Lcom/google/android/gms/internal/ads/z3;->zzd:Ll/lkx0;

    .line 30
    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    new-instance p0, Ll/thx0;

    .line 34
    .line 35
    sget-object p2, Lcom/google/android/gms/internal/ads/z3;->zzb:Lcom/google/android/gms/internal/ads/z3;

    .line 36
    .line 37
    invoke-direct {p0, p2}, Ll/thx0;-><init>(Lcom/google/android/gms/internal/ads/p5;)V

    .line 38
    .line 39
    .line 40
    sput-object p0, Lcom/google/android/gms/internal/ads/z3;->zzd:Ll/lkx0;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    :goto_0
    monitor-exit p1

    .line 46
    return-object p0

    .line 47
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    throw p0

    .line 49
    :cond_2
    return-object p0

    .line 50
    :cond_3
    sget-object p0, Lcom/google/android/gms/internal/ads/z3;->zzb:Lcom/google/android/gms/internal/ads/z3;

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_4
    new-instance p0, Ll/bbx0;

    .line 54
    .line 55
    invoke-direct {p0, p2}, Ll/bbx0;-><init>(Ll/abx0;)V

    .line 56
    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_5
    new-instance p0, Lcom/google/android/gms/internal/ads/z3;

    .line 60
    .line 61
    invoke-direct {p0}, Lcom/google/android/gms/internal/ads/z3;-><init>()V

    .line 62
    .line 63
    .line 64
    return-object p0

    .line 65
    :cond_6
    const-string p0, "zze"

    .line 66
    .line 67
    const-string p1, "zzf"

    .line 68
    .line 69
    const-string p2, "zzg"

    .line 70
    .line 71
    const-string p3, "zzh"

    .line 72
    .line 73
    filled-new-array {p0, p1, p2, p3}, [Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    sget-object p1, Lcom/google/android/gms/internal/ads/z3;->zzb:Lcom/google/android/gms/internal/ads/z3;

    .line 78
    .line 79
    const-string p2, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u000b\u0002\n\u0003\u1009\u0000"

    .line 80
    .line 81
    invoke-static {p1, p2, p0}, Lcom/google/android/gms/internal/ads/p5;->z(Ll/fkx0;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0

    .line 86
    :cond_7
    const/4 p0, 0x1

    .line 87
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0
.end method

.method public final L()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/ads/z3;->zzf:I

    return p0
.end method

.method public final P()Lcom/google/android/gms/internal/ads/b4;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/z3;->zzh:Lcom/google/android/gms/internal/ads/b4;

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

.method public final Q()Lcom/google/android/gms/internal/ads/zzgyl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/z3;->zzg:Lcom/google/android/gms/internal/ads/zzgyl;

    return-object p0
.end method
