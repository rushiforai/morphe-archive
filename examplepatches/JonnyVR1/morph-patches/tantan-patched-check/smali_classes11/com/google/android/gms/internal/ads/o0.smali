.class public final Lcom/google/android/gms/internal/ads/o0;
.super Lcom/google/android/gms/internal/ads/p5;
.source "SourceFile"

# interfaces
.implements Ll/gkx0;


# static fields
.field private static final zzb:Ll/cjx0;

.field private static final zzd:Lcom/google/android/gms/internal/ads/o0;


# instance fields
.field private zze:I

.field private zzf:J

.field private zzg:I

.field private zzh:J

.field private zzi:J

.field private zzj:Ll/aix0;

.field private zzk:Lcom/google/android/gms/internal/ads/m0;

.field private zzl:I

.field private zzm:I

.field private zzn:I

.field private zzo:I

.field private zzp:I

.field private zzq:I

.field private zzr:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/kes0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/kes0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/ads/o0;->zzb:Ll/cjx0;

    .line 7
    .line 8
    new-instance v0, Lcom/google/android/gms/internal/ads/o0;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/o0;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/google/android/gms/internal/ads/o0;->zzd:Lcom/google/android/gms/internal/ads/o0;

    .line 14
    .line 15
    const-class v1, Lcom/google/android/gms/internal/ads/o0;

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/ads/p5;->C(Ljava/lang/Class;Lcom/google/android/gms/internal/ads/p5;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/ads/p5;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/google/android/gms/internal/ads/p5;->s()Ll/aix0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/o0;->zzj:Ll/aix0;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic L(Lcom/google/android/gms/internal/ads/o0;I)V
    .locals 0

    .line 1
    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/gms/internal/ads/o0;->zzm:I

    iget p1, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    or-int/lit8 p1, p1, 0x40

    iput p1, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    return-void
.end method

.method public static synthetic M(Lcom/google/android/gms/internal/ads/o0;I)V
    .locals 0

    .line 1
    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/gms/internal/ads/o0;->zzn:I

    iget p1, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    or-int/lit16 p1, p1, 0x80

    iput p1, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    return-void
.end method

.method public static synthetic N(Lcom/google/android/gms/internal/ads/o0;I)V
    .locals 0

    .line 1
    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/gms/internal/ads/o0;->zzp:I

    iget p1, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    or-int/lit16 p1, p1, 0x200

    iput p1, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    return-void
.end method

.method public static T()Ll/les0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/o0;->zzd:Lcom/google/android/gms/internal/ads/o0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/p5;->j()Ll/shx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/les0;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic U()Lcom/google/android/gms/internal/ads/o0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/o0;->zzd:Lcom/google/android/gms/internal/ads/o0;

    return-object v0
.end method

.method public static V([B)Lcom/google/android/gms/internal/ads/o0;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhag;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/o0;->zzd:Lcom/google/android/gms/internal/ads/o0;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/android/gms/internal/ads/p5;->o(Lcom/google/android/gms/internal/ads/p5;[B)Lcom/google/android/gms/internal/ads/p5;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/google/android/gms/internal/ads/o0;

    .line 8
    .line 9
    return-object p0
.end method

.method public static synthetic Y(Lcom/google/android/gms/internal/ads/o0;J)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    iput-wide p1, p0, Lcom/google/android/gms/internal/ads/o0;->zzf:J

    return-void
.end method

.method public static synthetic Z(Lcom/google/android/gms/internal/ads/o0;J)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    iput-wide p1, p0, Lcom/google/android/gms/internal/ads/o0;->zzh:J

    return-void
.end method

.method public static synthetic a0(Lcom/google/android/gms/internal/ads/o0;J)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    iput-wide p1, p0, Lcom/google/android/gms/internal/ads/o0;->zzi:J

    return-void
.end method

.method public static synthetic b0(Lcom/google/android/gms/internal/ads/o0;Ljava/lang/Iterable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/ads/o0;->zzj:Ll/aix0;

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
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/p5;->t(Ll/aix0;)Ll/aix0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/o0;->zzj:Ll/aix0;

    .line 14
    .line 15
    :cond_0
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/google/android/gms/internal/ads/zzbcn;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/google/android/gms/internal/ads/o0;->zzj:Ll/aix0;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/zzbcn;->zza()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-interface {v1, v0}, Ll/aix0;->zzh(I)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-void
.end method

.method public static synthetic c0(Lcom/google/android/gms/internal/ads/o0;Lcom/google/android/gms/internal/ads/m0;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/o0;->zzk:Lcom/google/android/gms/internal/ads/m0;

    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x10

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic d0(Lcom/google/android/gms/internal/ads/o0;I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    or-int/lit16 v0, v0, 0x100

    iput v0, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    iput p1, p0, Lcom/google/android/gms/internal/ads/o0;->zzo:I

    return-void
.end method

.method public static synthetic e0(Lcom/google/android/gms/internal/ads/o0;Lcom/google/android/gms/internal/ads/zzbec;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/zzbec;->zza()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Lcom/google/android/gms/internal/ads/o0;->zzq:I

    .line 6
    .line 7
    iget p1, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    .line 8
    .line 9
    or-int/lit16 p1, p1, 0x400

    .line 10
    .line 11
    iput p1, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic f0(Lcom/google/android/gms/internal/ads/o0;J)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    or-int/lit16 v0, v0, 0x800

    iput v0, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    iput-wide p1, p0, Lcom/google/android/gms/internal/ads/o0;->zzr:J

    return-void
.end method

.method public static synthetic l0(Lcom/google/android/gms/internal/ads/o0;I)V
    .locals 0

    .line 1
    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/gms/internal/ads/o0;->zzg:I

    iget p1, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    or-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    return-void
.end method

.method public static synthetic m0(Lcom/google/android/gms/internal/ads/o0;I)V
    .locals 0

    .line 1
    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/gms/internal/ads/o0;->zzl:I

    iget p1, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    or-int/lit8 p1, p1, 0x20

    iput p1, p0, Lcom/google/android/gms/internal/ads/o0;->zze:I

    return-void
.end method


# virtual methods
.method public final H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 22

    .line 1
    add-int/lit8 v0, p1, -0x1

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    if-eq v0, v1, :cond_3

    .line 7
    .line 8
    const/4 v1, 0x3

    .line 9
    if-eq v0, v1, :cond_2

    .line 10
    .line 11
    const/4 v1, 0x4

    .line 12
    const/4 v2, 0x0

    .line 13
    if-eq v0, v1, :cond_1

    .line 14
    .line 15
    const/4 v1, 0x5

    .line 16
    if-eq v0, v1, :cond_0

    .line 17
    .line 18
    return-object v2

    .line 19
    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/ads/o0;->zzd:Lcom/google/android/gms/internal/ads/o0;

    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_1
    new-instance v0, Ll/les0;

    .line 23
    .line 24
    invoke-direct {v0, v2}, Ll/les0;-><init>(Ll/mcs0;)V

    .line 25
    .line 26
    .line 27
    return-object v0

    .line 28
    :cond_2
    new-instance v0, Lcom/google/android/gms/internal/ads/o0;

    .line 29
    .line 30
    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/o0;-><init>()V

    .line 31
    .line 32
    .line 33
    return-object v0

    .line 34
    :cond_3
    sget-object v4, Ll/wds0;->a:Ll/zhx0;

    .line 35
    .line 36
    sget-object v8, Ll/fds0;->a:Ll/zhx0;

    .line 37
    .line 38
    sget-object v20, Ll/ves0;->a:Ll/zhx0;

    .line 39
    .line 40
    const-string v21, "zzr"

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
    const-string v5, "zzh"

    .line 49
    .line 50
    const-string v6, "zzi"

    .line 51
    .line 52
    const-string v7, "zzj"

    .line 53
    .line 54
    const-string v9, "zzk"

    .line 55
    .line 56
    const-string v10, "zzl"

    .line 57
    .line 58
    const-string v12, "zzm"

    .line 59
    .line 60
    const-string v14, "zzn"

    .line 61
    .line 62
    const-string v16, "zzo"

    .line 63
    .line 64
    const-string v17, "zzp"

    .line 65
    .line 66
    const-string v19, "zzq"

    .line 67
    .line 68
    move-object v11, v4

    .line 69
    move-object v13, v4

    .line 70
    move-object v15, v4

    .line 71
    move-object/from16 v18, v4

    .line 72
    .line 73
    filled-new-array/range {v1 .. v21}, [Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    sget-object v1, Lcom/google/android/gms/internal/ads/o0;->zzd:Lcom/google/android/gms/internal/ads/o0;

    .line 78
    .line 79
    const-string v2, "\u0001\r\u0000\u0001\u0001\r\r\u0000\u0001\u0000\u0001\u1002\u0000\u0002\u180c\u0001\u0003\u1002\u0002\u0004\u1002\u0003\u0005\u081e\u0006\u1009\u0004\u0007\u180c\u0005\u0008\u180c\u0006\t\u180c\u0007\n\u1004\u0008\u000b\u180c\t\u000c\u180c\n\r\u1002\u000b"

    .line 80
    .line 81
    invoke-static {v1, v2, v0}, Lcom/google/android/gms/internal/ads/p5;->z(Ll/fkx0;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    return-object v0

    .line 86
    :cond_4
    const/4 v0, 0x1

    .line 87
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    return-object v0
.end method

.method public final O()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/ads/o0;->zzo:I

    return p0
.end method

.method public final P()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/google/android/gms/internal/ads/o0;->zzi:J

    return-wide v0
.end method

.method public final Q()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/google/android/gms/internal/ads/o0;->zzh:J

    return-wide v0
.end method

.method public final R()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/google/android/gms/internal/ads/o0;->zzf:J

    return-wide v0
.end method

.method public final S()Lcom/google/android/gms/internal/ads/m0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/o0;->zzk:Lcom/google/android/gms/internal/ads/m0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/ads/m0;->N()Lcom/google/android/gms/internal/ads/m0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public final W()Lcom/google/android/gms/internal/ads/zzbec;
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/ads/o0;->zzq:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/zzbec;->zzb(I)Lcom/google/android/gms/internal/ads/zzbec;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/google/android/gms/internal/ads/zzbec;->zza:Lcom/google/android/gms/internal/ads/zzbec;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public final X()Ljava/util/List;
    .locals 2

    .line 1
    new-instance v0, Ll/djx0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/o0;->zzj:Ll/aix0;

    .line 4
    .line 5
    sget-object v1, Lcom/google/android/gms/internal/ads/o0;->zzb:Ll/cjx0;

    .line 6
    .line 7
    invoke-direct {v0, p0, v1}, Ll/djx0;-><init>(Ljava/util/List;Ll/cjx0;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public final g0()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/ads/o0;->zzm:I

    invoke-static {p0}, Ll/xds0;->a(I)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    :cond_0
    return p0
.end method

.method public final h0()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/ads/o0;->zzn:I

    invoke-static {p0}, Ll/xds0;->a(I)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    :cond_0
    return p0
.end method

.method public final i0()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/ads/o0;->zzp:I

    invoke-static {p0}, Ll/xds0;->a(I)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    :cond_0
    return p0
.end method

.method public final j0()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/ads/o0;->zzg:I

    invoke-static {p0}, Ll/xds0;->a(I)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    :cond_0
    return p0
.end method

.method public final k0()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/ads/o0;->zzl:I

    invoke-static {p0}, Ll/xds0;->a(I)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    :cond_0
    return p0
.end method
