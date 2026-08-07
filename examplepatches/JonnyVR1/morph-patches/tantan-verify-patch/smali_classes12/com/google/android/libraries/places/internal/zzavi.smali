.class final Lcom/google/android/libraries/places/internal/zzavi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavt;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/android/libraries/places/internal/zzavt<",
        "TT;>;"
    }
.end annotation


# static fields
.field private static final zza:[I

.field private static final zzb:Lsun/misc/Unsafe;


# instance fields
.field private final zzc:[I

.field private final zzd:[Ljava/lang/Object;

.field private final zze:I

.field private final zzf:I

.field private final zzg:Lcom/google/android/libraries/places/internal/zzavf;

.field private final zzh:Z

.field private final zzi:Z

.field private final zzj:[I

.field private final zzk:I

.field private final zzl:I

.field private final zzm:Lcom/google/android/libraries/places/internal/zzaut;

.field private final zzn:Lcom/google/android/libraries/places/internal/zzawn;

.field private final zzo:Lcom/google/android/libraries/places/internal/zzatg;

.field private final zzp:Lcom/google/android/libraries/places/internal/zzavl;

.field private final zzq:Lcom/google/android/libraries/places/internal/zzava;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    sput-object v0, Lcom/google/android/libraries/places/internal/zzavi;->zza:[I

    .line 5
    .line 6
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzawx;->zzg()Lsun/misc/Unsafe;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Lcom/google/android/libraries/places/internal/zzavi;->zzb:Lsun/misc/Unsafe;

    .line 11
    .line 12
    return-void
.end method

.method private constructor <init>([I[Ljava/lang/Object;IILcom/google/android/libraries/places/internal/zzavf;IZ[IIILcom/google/android/libraries/places/internal/zzavl;Lcom/google/android/libraries/places/internal/zzaut;Lcom/google/android/libraries/places/internal/zzawn;Lcom/google/android/libraries/places/internal/zzatg;Lcom/google/android/libraries/places/internal/zzava;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzd:[Ljava/lang/Object;

    iput p3, p0, Lcom/google/android/libraries/places/internal/zzavi;->zze:I

    iput p4, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzf:I

    instance-of p1, p5, Lcom/google/android/libraries/places/internal/zzatu;

    iput-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzi:Z

    const/4 p1, 0x0

    if-eqz p14, :cond_0

    invoke-virtual {p14, p5}, Lcom/google/android/libraries/places/internal/zzatg;->zzi(Lcom/google/android/libraries/places/internal/zzavf;)Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p1, 0x1

    :cond_0
    iput-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzh:Z

    iput-object p8, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzj:[I

    iput p9, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzk:I

    iput p10, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzl:I

    iput-object p11, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzp:Lcom/google/android/libraries/places/internal/zzavl;

    iput-object p12, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    iput-object p13, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzn:Lcom/google/android/libraries/places/internal/zzawn;

    iput-object p14, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzo:Lcom/google/android/libraries/places/internal/zzatg;

    iput-object p5, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzg:Lcom/google/android/libraries/places/internal/zzavf;

    iput-object p15, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzq:Lcom/google/android/libraries/places/internal/zzava;

    return-void
.end method

.method private final zzA(Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 2
    .line 3
    aget v0, v0, p3

    .line 4
    .line 5
    invoke-direct {p0, p2, v0, p3}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-direct {p0, p3}, Lcom/google/android/libraries/places/internal/zzavi;->zzp(I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const v2, 0xfffff

    .line 17
    .line 18
    .line 19
    and-int/2addr v1, v2

    .line 20
    sget-object v2, Lcom/google/android/libraries/places/internal/zzavi;->zzb:Lsun/misc/Unsafe;

    .line 21
    .line 22
    int-to-long v3, v1

    .line 23
    invoke-virtual {v2, p2, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eqz v1, :cond_4

    .line 28
    .line 29
    invoke-direct {p0, p3}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-direct {p0, p1, v0, p3}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    if-nez v5, :cond_2

    .line 38
    .line 39
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzL(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    if-nez v5, :cond_1

    .line 44
    .line 45
    invoke-virtual {v2, p1, v3, v4, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-interface {p2}, Lcom/google/android/libraries/places/internal/zzavt;->zzc()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    invoke-interface {p2, v5, v1}, Lcom/google/android/libraries/places/internal/zzavt;->zze(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2, p1, v3, v4, v5}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    :goto_0
    invoke-direct {p0, p1, v0, p3}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    invoke-virtual {v2, p1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzavi;->zzL(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p3

    .line 71
    if-nez p3, :cond_3

    .line 72
    .line 73
    invoke-interface {p2}, Lcom/google/android/libraries/places/internal/zzavt;->zzc()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    invoke-interface {p2, p3, p0}, Lcom/google/android/libraries/places/internal/zzavt;->zze(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2, p1, v3, v4, p3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    move-object p0, p3

    .line 84
    :cond_3
    invoke-interface {p2, p0, v1}, Lcom/google/android/libraries/places/internal/zzavt;->zze(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_4
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 89
    .line 90
    aget p0, p0, p3

    .line 91
    .line 92
    invoke-static {p2, p0}, Ll/hkx0;->a(Ljava/lang/Object;I)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method private final zzB(Ljava/lang/Object;ILcom/google/android/libraries/places/internal/zzavs;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzavi;->zzH(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0xfffff

    .line 6
    .line 7
    .line 8
    and-int/2addr p2, v1

    .line 9
    int-to-long v1, p2

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-interface {p3}, Lcom/google/android/libraries/places/internal/zzavs;->zzs()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p1, v1, v2, p0}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-boolean p0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzi:Z

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-interface {p3}, Lcom/google/android/libraries/places/internal/zzavs;->zzr()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p1, v1, v2, p0}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    invoke-interface {p3}, Lcom/google/android/libraries/places/internal/zzavs;->zzp()Lcom/google/android/libraries/places/internal/zzask;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p1, v1, v2, p0}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private final zzC(Ljava/lang/Object;I)V
    .locals 4

    .line 1
    invoke-direct {p0, p2}, Lcom/google/android/libraries/places/internal/zzavi;->zzn(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const p2, 0xfffff

    .line 6
    .line 7
    .line 8
    and-int/2addr p2, p0

    .line 9
    int-to-long v0, p2

    .line 10
    const-wide/32 v2, 0xfffff

    .line 11
    .line 12
    .line 13
    cmp-long p2, v0, v2

    .line 14
    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    ushr-int/lit8 p0, p0, 0x14

    .line 19
    .line 20
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    const/4 v2, 0x1

    .line 25
    shl-int p0, v2, p0

    .line 26
    .line 27
    or-int/2addr p0, p2

    .line 28
    invoke-static {p1, v0, v1, p0}, Lcom/google/android/libraries/places/internal/zzawx;->zzq(Ljava/lang/Object;JI)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private final zzD(Ljava/lang/Object;II)V
    .locals 2

    .line 1
    invoke-direct {p0, p3}, Lcom/google/android/libraries/places/internal/zzavi;->zzn(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const p3, 0xfffff

    .line 6
    .line 7
    .line 8
    and-int/2addr p0, p3

    .line 9
    int-to-long v0, p0

    .line 10
    invoke-static {p1, v0, v1, p2}, Lcom/google/android/libraries/places/internal/zzawx;->zzq(Ljava/lang/Object;JI)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private final zzE(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzavi;->zzb:Lsun/misc/Unsafe;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lcom/google/android/libraries/places/internal/zzavi;->zzp(I)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const v2, 0xfffff

    .line 8
    .line 9
    .line 10
    and-int/2addr v1, v2

    .line 11
    int-to-long v1, v1

    .line 12
    invoke-virtual {v0, p1, v1, v2, p3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private final zzF(Ljava/lang/Object;IILjava/lang/Object;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzavi;->zzb:Lsun/misc/Unsafe;

    .line 2
    .line 3
    invoke-direct {p0, p3}, Lcom/google/android/libraries/places/internal/zzavi;->zzp(I)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const v2, 0xfffff

    .line 8
    .line 9
    .line 10
    and-int/2addr v1, v2

    .line 11
    int-to-long v1, v1

    .line 12
    invoke-virtual {v0, p1, v1, v2, p4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private final zzG(Ljava/lang/Object;Ljava/lang/Object;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p3}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-direct {p0, p2, p3}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ne p1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private static zzH(I)Z
    .locals 1

    const/high16 v0, 0x20000000

    and-int/2addr p0, v0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private final zzI(Ljava/lang/Object;I)Z
    .locals 7

    .line 1
    invoke-direct {p0, p2}, Lcom/google/android/libraries/places/internal/zzavi;->zzn(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0xfffff

    .line 6
    .line 7
    .line 8
    and-int v2, v0, v1

    .line 9
    .line 10
    int-to-long v2, v2

    .line 11
    const-wide/32 v4, 0xfffff

    .line 12
    .line 13
    .line 14
    cmp-long v4, v2, v4

    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    const/4 v6, 0x1

    .line 18
    if-nez v4, :cond_14

    .line 19
    .line 20
    invoke-direct {p0, p2}, Lcom/google/android/libraries/places/internal/zzavi;->zzp(I)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    and-int p2, p0, v1

    .line 25
    .line 26
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzavi;->zzo(I)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    int-to-long v0, p2

    .line 31
    const-wide/16 v2, 0x0

    .line 32
    .line 33
    packed-switch p0, :pswitch_data_0

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/fig0;->a()V

    .line 37
    .line 38
    .line 39
    return v5

    .line 40
    :pswitch_0
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    return v6

    .line 47
    :cond_0
    return v5

    .line 48
    :pswitch_1
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 49
    .line 50
    .line 51
    move-result-wide p0

    .line 52
    cmp-long p0, p0, v2

    .line 53
    .line 54
    if-eqz p0, :cond_1

    .line 55
    .line 56
    return v6

    .line 57
    :cond_1
    return v5

    .line 58
    :pswitch_2
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_2

    .line 63
    .line 64
    return v6

    .line 65
    :cond_2
    return v5

    .line 66
    :pswitch_3
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 67
    .line 68
    .line 69
    move-result-wide p0

    .line 70
    cmp-long p0, p0, v2

    .line 71
    .line 72
    if-eqz p0, :cond_3

    .line 73
    .line 74
    return v6

    .line 75
    :cond_3
    return v5

    .line 76
    :pswitch_4
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-eqz p0, :cond_4

    .line 81
    .line 82
    return v6

    .line 83
    :cond_4
    return v5

    .line 84
    :pswitch_5
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    if-eqz p0, :cond_5

    .line 89
    .line 90
    return v6

    .line 91
    :cond_5
    return v5

    .line 92
    :pswitch_6
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-eqz p0, :cond_6

    .line 97
    .line 98
    return v6

    .line 99
    :cond_6
    return v5

    .line 100
    :pswitch_7
    sget-object p0, Lcom/google/android/libraries/places/internal/zzask;->zzb:Lcom/google/android/libraries/places/internal/zzask;

    .line 101
    .line 102
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzask;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    if-nez p0, :cond_7

    .line 111
    .line 112
    return v6

    .line 113
    :cond_7
    return v5

    .line 114
    :pswitch_8
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    if-eqz p0, :cond_8

    .line 119
    .line 120
    return v6

    .line 121
    :cond_8
    return v5

    .line 122
    :pswitch_9
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    instance-of p1, p0, Ljava/lang/String;

    .line 127
    .line 128
    if-eqz p1, :cond_a

    .line 129
    .line 130
    check-cast p0, Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    if-nez p0, :cond_9

    .line 137
    .line 138
    return v6

    .line 139
    :cond_9
    return v5

    .line 140
    :cond_a
    instance-of p1, p0, Lcom/google/android/libraries/places/internal/zzask;

    .line 141
    .line 142
    if-eqz p1, :cond_c

    .line 143
    .line 144
    sget-object p1, Lcom/google/android/libraries/places/internal/zzask;->zzb:Lcom/google/android/libraries/places/internal/zzask;

    .line 145
    .line 146
    invoke-virtual {p1, p0}, Lcom/google/android/libraries/places/internal/zzask;->equals(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    if-nez p0, :cond_b

    .line 151
    .line 152
    return v6

    .line 153
    :cond_b
    return v5

    .line 154
    :cond_c
    invoke-static {}, Ll/fig0;->a()V

    .line 155
    .line 156
    .line 157
    return v5

    .line 158
    :pswitch_a
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzw(Ljava/lang/Object;J)Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    return p0

    .line 163
    :pswitch_b
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    if-eqz p0, :cond_d

    .line 168
    .line 169
    return v6

    .line 170
    :cond_d
    return v5

    .line 171
    :pswitch_c
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 172
    .line 173
    .line 174
    move-result-wide p0

    .line 175
    cmp-long p0, p0, v2

    .line 176
    .line 177
    if-eqz p0, :cond_e

    .line 178
    .line 179
    return v6

    .line 180
    :cond_e
    return v5

    .line 181
    :pswitch_d
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 182
    .line 183
    .line 184
    move-result p0

    .line 185
    if-eqz p0, :cond_f

    .line 186
    .line 187
    return v6

    .line 188
    :cond_f
    return v5

    .line 189
    :pswitch_e
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 190
    .line 191
    .line 192
    move-result-wide p0

    .line 193
    cmp-long p0, p0, v2

    .line 194
    .line 195
    if-eqz p0, :cond_10

    .line 196
    .line 197
    return v6

    .line 198
    :cond_10
    return v5

    .line 199
    :pswitch_f
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 200
    .line 201
    .line 202
    move-result-wide p0

    .line 203
    cmp-long p0, p0, v2

    .line 204
    .line 205
    if-eqz p0, :cond_11

    .line 206
    .line 207
    return v6

    .line 208
    :cond_11
    return v5

    .line 209
    :pswitch_10
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzb(Ljava/lang/Object;J)F

    .line 210
    .line 211
    .line 212
    move-result p0

    .line 213
    invoke-static {p0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    .line 214
    .line 215
    .line 216
    move-result p0

    .line 217
    if-eqz p0, :cond_12

    .line 218
    .line 219
    return v6

    .line 220
    :cond_12
    return v5

    .line 221
    :pswitch_11
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zza(Ljava/lang/Object;J)D

    .line 222
    .line 223
    .line 224
    move-result-wide p0

    .line 225
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    .line 226
    .line 227
    .line 228
    move-result-wide p0

    .line 229
    cmp-long p0, p0, v2

    .line 230
    .line 231
    if-eqz p0, :cond_13

    .line 232
    .line 233
    return v6

    .line 234
    :cond_13
    return v5

    .line 235
    :cond_14
    ushr-int/lit8 p0, v0, 0x14

    .line 236
    .line 237
    shl-int p0, v6, p0

    .line 238
    .line 239
    invoke-static {p1, v2, v3}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 240
    .line 241
    .line 242
    move-result p1

    .line 243
    and-int/2addr p0, p1

    .line 244
    if-eqz p0, :cond_15

    .line 245
    .line 246
    return v6

    .line 247
    :cond_15
    return v5

    .line 248
    nop

    .line 249
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private final zzJ(Ljava/lang/Object;IIII)Z
    .locals 1

    .line 1
    const v0, 0xfffff

    .line 2
    .line 3
    .line 4
    if-ne p3, v0, :cond_0

    .line 5
    .line 6
    invoke-direct {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0

    .line 11
    :cond_0
    and-int p0, p4, p5

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private static zzK(Ljava/lang/Object;ILcom/google/android/libraries/places/internal/zzavt;)Z
    .locals 2

    .line 1
    const v0, 0xfffff

    .line 2
    .line 3
    .line 4
    and-int/2addr p1, v0

    .line 5
    int-to-long v0, p1

    .line 6
    invoke-static {p0, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p2, p0}, Lcom/google/android/libraries/places/internal/zzavt;->zzh(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method private static zzL(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p0, Lcom/google/android/libraries/places/internal/zzatu;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    check-cast p0, Lcom/google/android/libraries/places/internal/zzatu;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaH()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_1
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method private final zzM(Ljava/lang/Object;II)Z
    .locals 2

    .line 1
    invoke-direct {p0, p3}, Lcom/google/android/libraries/places/internal/zzavi;->zzn(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const p3, 0xfffff

    .line 6
    .line 7
    .line 8
    and-int/2addr p0, p3

    .line 9
    int-to-long v0, p0

    .line 10
    invoke-static {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-ne p0, p2, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method private static zzN(Ljava/lang/Object;J)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private static final zzO(ILjava/lang/Object;Lcom/google/android/libraries/places/internal/zzasy;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p2, p0, p1}, Lcom/google/android/libraries/places/internal/zzasy;->zzG(ILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    check-cast p1, Lcom/google/android/libraries/places/internal/zzask;

    .line 12
    .line 13
    invoke-virtual {p2, p0, p1}, Lcom/google/android/libraries/places/internal/zzasy;->zzd(ILcom/google/android/libraries/places/internal/zzask;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static zzi(Ljava/lang/Class;Lcom/google/android/libraries/places/internal/zzavc;Lcom/google/android/libraries/places/internal/zzavl;Lcom/google/android/libraries/places/internal/zzaut;Lcom/google/android/libraries/places/internal/zzawn;Lcom/google/android/libraries/places/internal/zzatg;Lcom/google/android/libraries/places/internal/zzava;)Lcom/google/android/libraries/places/internal/zzavi;
    .locals 32

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    instance-of v1, v0, Lcom/google/android/libraries/places/internal/zzavr;

    .line 4
    .line 5
    if-eqz v1, :cond_37

    .line 6
    .line 7
    check-cast v0, Lcom/google/android/libraries/places/internal/zzavr;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzavr;->zzd()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    const v5, 0xd800

    .line 23
    .line 24
    .line 25
    if-lt v4, v5, :cond_0

    .line 26
    .line 27
    const/4 v4, 0x1

    .line 28
    :goto_0
    add-int/lit8 v7, v4, 0x1

    .line 29
    .line 30
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-lt v4, v5, :cond_1

    .line 35
    .line 36
    move v4, v7

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 v7, 0x1

    .line 39
    :cond_1
    add-int/lit8 v4, v7, 0x1

    .line 40
    .line 41
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    .line 42
    .line 43
    .line 44
    move-result v7

    .line 45
    if-lt v7, v5, :cond_3

    .line 46
    .line 47
    and-int/lit16 v7, v7, 0x1fff

    .line 48
    .line 49
    const/16 v9, 0xd

    .line 50
    .line 51
    :goto_1
    add-int/lit8 v10, v4, 0x1

    .line 52
    .line 53
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-lt v4, v5, :cond_2

    .line 58
    .line 59
    and-int/lit16 v4, v4, 0x1fff

    .line 60
    .line 61
    shl-int/2addr v4, v9

    .line 62
    or-int/2addr v7, v4

    .line 63
    add-int/lit8 v9, v9, 0xd

    .line 64
    .line 65
    move v4, v10

    .line 66
    goto :goto_1

    .line 67
    :cond_2
    shl-int/2addr v4, v9

    .line 68
    or-int/2addr v7, v4

    .line 69
    move v4, v10

    .line 70
    :cond_3
    if-nez v7, :cond_4

    .line 71
    .line 72
    sget-object v7, Lcom/google/android/libraries/places/internal/zzavi;->zza:[I

    .line 73
    .line 74
    move v9, v3

    .line 75
    move v11, v9

    .line 76
    move v12, v11

    .line 77
    move v13, v12

    .line 78
    move/from16 v16, v13

    .line 79
    .line 80
    move/from16 v18, v16

    .line 81
    .line 82
    move-object/from16 v17, v7

    .line 83
    .line 84
    move/from16 v7, v18

    .line 85
    .line 86
    goto/16 :goto_a

    .line 87
    .line 88
    :cond_4
    add-int/lit8 v7, v4, 0x1

    .line 89
    .line 90
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    if-lt v4, v5, :cond_6

    .line 95
    .line 96
    and-int/lit16 v4, v4, 0x1fff

    .line 97
    .line 98
    const/16 v9, 0xd

    .line 99
    .line 100
    :goto_2
    add-int/lit8 v10, v7, 0x1

    .line 101
    .line 102
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    .line 103
    .line 104
    .line 105
    move-result v7

    .line 106
    if-lt v7, v5, :cond_5

    .line 107
    .line 108
    and-int/lit16 v7, v7, 0x1fff

    .line 109
    .line 110
    shl-int/2addr v7, v9

    .line 111
    or-int/2addr v4, v7

    .line 112
    add-int/lit8 v9, v9, 0xd

    .line 113
    .line 114
    move v7, v10

    .line 115
    goto :goto_2

    .line 116
    :cond_5
    shl-int/2addr v7, v9

    .line 117
    or-int/2addr v4, v7

    .line 118
    move v7, v10

    .line 119
    :cond_6
    add-int/lit8 v9, v7, 0x1

    .line 120
    .line 121
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    .line 122
    .line 123
    .line 124
    move-result v7

    .line 125
    if-lt v7, v5, :cond_8

    .line 126
    .line 127
    and-int/lit16 v7, v7, 0x1fff

    .line 128
    .line 129
    const/16 v10, 0xd

    .line 130
    .line 131
    :goto_3
    add-int/lit8 v11, v9, 0x1

    .line 132
    .line 133
    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    .line 134
    .line 135
    .line 136
    move-result v9

    .line 137
    if-lt v9, v5, :cond_7

    .line 138
    .line 139
    and-int/lit16 v9, v9, 0x1fff

    .line 140
    .line 141
    shl-int/2addr v9, v10

    .line 142
    or-int/2addr v7, v9

    .line 143
    add-int/lit8 v10, v10, 0xd

    .line 144
    .line 145
    move v9, v11

    .line 146
    goto :goto_3

    .line 147
    :cond_7
    shl-int/2addr v9, v10

    .line 148
    or-int/2addr v7, v9

    .line 149
    move v9, v11

    .line 150
    :cond_8
    add-int/lit8 v10, v9, 0x1

    .line 151
    .line 152
    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    .line 153
    .line 154
    .line 155
    move-result v9

    .line 156
    if-lt v9, v5, :cond_a

    .line 157
    .line 158
    and-int/lit16 v9, v9, 0x1fff

    .line 159
    .line 160
    const/16 v11, 0xd

    .line 161
    .line 162
    :goto_4
    add-int/lit8 v12, v10, 0x1

    .line 163
    .line 164
    invoke-virtual {v1, v10}, Ljava/lang/String;->charAt(I)C

    .line 165
    .line 166
    .line 167
    move-result v10

    .line 168
    if-lt v10, v5, :cond_9

    .line 169
    .line 170
    and-int/lit16 v10, v10, 0x1fff

    .line 171
    .line 172
    shl-int/2addr v10, v11

    .line 173
    or-int/2addr v9, v10

    .line 174
    add-int/lit8 v11, v11, 0xd

    .line 175
    .line 176
    move v10, v12

    .line 177
    goto :goto_4

    .line 178
    :cond_9
    shl-int/2addr v10, v11

    .line 179
    or-int/2addr v9, v10

    .line 180
    move v10, v12

    .line 181
    :cond_a
    add-int/lit8 v11, v10, 0x1

    .line 182
    .line 183
    invoke-virtual {v1, v10}, Ljava/lang/String;->charAt(I)C

    .line 184
    .line 185
    .line 186
    move-result v10

    .line 187
    if-lt v10, v5, :cond_c

    .line 188
    .line 189
    and-int/lit16 v10, v10, 0x1fff

    .line 190
    .line 191
    const/16 v12, 0xd

    .line 192
    .line 193
    :goto_5
    add-int/lit8 v13, v11, 0x1

    .line 194
    .line 195
    invoke-virtual {v1, v11}, Ljava/lang/String;->charAt(I)C

    .line 196
    .line 197
    .line 198
    move-result v11

    .line 199
    if-lt v11, v5, :cond_b

    .line 200
    .line 201
    and-int/lit16 v11, v11, 0x1fff

    .line 202
    .line 203
    shl-int/2addr v11, v12

    .line 204
    or-int/2addr v10, v11

    .line 205
    add-int/lit8 v12, v12, 0xd

    .line 206
    .line 207
    move v11, v13

    .line 208
    goto :goto_5

    .line 209
    :cond_b
    shl-int/2addr v11, v12

    .line 210
    or-int/2addr v10, v11

    .line 211
    move v11, v13

    .line 212
    :cond_c
    add-int/lit8 v12, v11, 0x1

    .line 213
    .line 214
    invoke-virtual {v1, v11}, Ljava/lang/String;->charAt(I)C

    .line 215
    .line 216
    .line 217
    move-result v11

    .line 218
    if-lt v11, v5, :cond_e

    .line 219
    .line 220
    and-int/lit16 v11, v11, 0x1fff

    .line 221
    .line 222
    const/16 v13, 0xd

    .line 223
    .line 224
    :goto_6
    add-int/lit8 v14, v12, 0x1

    .line 225
    .line 226
    invoke-virtual {v1, v12}, Ljava/lang/String;->charAt(I)C

    .line 227
    .line 228
    .line 229
    move-result v12

    .line 230
    if-lt v12, v5, :cond_d

    .line 231
    .line 232
    and-int/lit16 v12, v12, 0x1fff

    .line 233
    .line 234
    shl-int/2addr v12, v13

    .line 235
    or-int/2addr v11, v12

    .line 236
    add-int/lit8 v13, v13, 0xd

    .line 237
    .line 238
    move v12, v14

    .line 239
    goto :goto_6

    .line 240
    :cond_d
    shl-int/2addr v12, v13

    .line 241
    or-int/2addr v11, v12

    .line 242
    move v12, v14

    .line 243
    :cond_e
    add-int/lit8 v13, v12, 0x1

    .line 244
    .line 245
    invoke-virtual {v1, v12}, Ljava/lang/String;->charAt(I)C

    .line 246
    .line 247
    .line 248
    move-result v12

    .line 249
    if-lt v12, v5, :cond_10

    .line 250
    .line 251
    and-int/lit16 v12, v12, 0x1fff

    .line 252
    .line 253
    const/16 v14, 0xd

    .line 254
    .line 255
    :goto_7
    add-int/lit8 v15, v13, 0x1

    .line 256
    .line 257
    invoke-virtual {v1, v13}, Ljava/lang/String;->charAt(I)C

    .line 258
    .line 259
    .line 260
    move-result v13

    .line 261
    if-lt v13, v5, :cond_f

    .line 262
    .line 263
    and-int/lit16 v13, v13, 0x1fff

    .line 264
    .line 265
    shl-int/2addr v13, v14

    .line 266
    or-int/2addr v12, v13

    .line 267
    add-int/lit8 v14, v14, 0xd

    .line 268
    .line 269
    move v13, v15

    .line 270
    goto :goto_7

    .line 271
    :cond_f
    shl-int/2addr v13, v14

    .line 272
    or-int/2addr v12, v13

    .line 273
    move v13, v15

    .line 274
    :cond_10
    add-int/lit8 v14, v13, 0x1

    .line 275
    .line 276
    invoke-virtual {v1, v13}, Ljava/lang/String;->charAt(I)C

    .line 277
    .line 278
    .line 279
    move-result v13

    .line 280
    if-lt v13, v5, :cond_12

    .line 281
    .line 282
    and-int/lit16 v13, v13, 0x1fff

    .line 283
    .line 284
    const/16 v15, 0xd

    .line 285
    .line 286
    :goto_8
    add-int/lit8 v16, v14, 0x1

    .line 287
    .line 288
    invoke-virtual {v1, v14}, Ljava/lang/String;->charAt(I)C

    .line 289
    .line 290
    .line 291
    move-result v14

    .line 292
    if-lt v14, v5, :cond_11

    .line 293
    .line 294
    and-int/lit16 v14, v14, 0x1fff

    .line 295
    .line 296
    shl-int/2addr v14, v15

    .line 297
    or-int/2addr v13, v14

    .line 298
    add-int/lit8 v15, v15, 0xd

    .line 299
    .line 300
    move/from16 v14, v16

    .line 301
    .line 302
    goto :goto_8

    .line 303
    :cond_11
    shl-int/2addr v14, v15

    .line 304
    or-int/2addr v13, v14

    .line 305
    move/from16 v14, v16

    .line 306
    .line 307
    :cond_12
    add-int/lit8 v15, v14, 0x1

    .line 308
    .line 309
    invoke-virtual {v1, v14}, Ljava/lang/String;->charAt(I)C

    .line 310
    .line 311
    .line 312
    move-result v14

    .line 313
    if-lt v14, v5, :cond_14

    .line 314
    .line 315
    and-int/lit16 v14, v14, 0x1fff

    .line 316
    .line 317
    const/16 v16, 0xd

    .line 318
    .line 319
    :goto_9
    add-int/lit8 v17, v15, 0x1

    .line 320
    .line 321
    invoke-virtual {v1, v15}, Ljava/lang/String;->charAt(I)C

    .line 322
    .line 323
    .line 324
    move-result v15

    .line 325
    if-lt v15, v5, :cond_13

    .line 326
    .line 327
    and-int/lit16 v15, v15, 0x1fff

    .line 328
    .line 329
    shl-int v15, v15, v16

    .line 330
    .line 331
    or-int/2addr v14, v15

    .line 332
    add-int/lit8 v16, v16, 0xd

    .line 333
    .line 334
    move/from16 v15, v17

    .line 335
    .line 336
    goto :goto_9

    .line 337
    :cond_13
    shl-int v15, v15, v16

    .line 338
    .line 339
    or-int/2addr v14, v15

    .line 340
    move/from16 v15, v17

    .line 341
    .line 342
    :cond_14
    add-int v16, v14, v12

    .line 343
    .line 344
    add-int v13, v16, v13

    .line 345
    .line 346
    add-int v16, v4, v4

    .line 347
    .line 348
    add-int v16, v16, v7

    .line 349
    .line 350
    new-array v7, v13, [I

    .line 351
    .line 352
    move v13, v12

    .line 353
    move v12, v9

    .line 354
    move v9, v13

    .line 355
    move-object/from16 v17, v7

    .line 356
    .line 357
    move v13, v10

    .line 358
    move/from16 v18, v14

    .line 359
    .line 360
    move v7, v4

    .line 361
    move v4, v15

    .line 362
    :goto_a
    sget-object v10, Lcom/google/android/libraries/places/internal/zzavi;->zzb:Lsun/misc/Unsafe;

    .line 363
    .line 364
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzavr;->zze()[Ljava/lang/Object;

    .line 365
    .line 366
    .line 367
    move-result-object v14

    .line 368
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzavr;->zza()Lcom/google/android/libraries/places/internal/zzavf;

    .line 369
    .line 370
    .line 371
    move-result-object v15

    .line 372
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 373
    .line 374
    .line 375
    move-result-object v15

    .line 376
    add-int v19, v18, v9

    .line 377
    .line 378
    add-int v9, v11, v11

    .line 379
    .line 380
    mul-int/lit8 v11, v11, 0x3

    .line 381
    .line 382
    new-array v11, v11, [I

    .line 383
    .line 384
    new-array v9, v9, [Ljava/lang/Object;

    .line 385
    .line 386
    move/from16 v20, v3

    .line 387
    .line 388
    move/from16 v21, v20

    .line 389
    .line 390
    move/from16 v22, v18

    .line 391
    .line 392
    move/from16 v23, v19

    .line 393
    .line 394
    :goto_b
    if-ge v4, v2, :cond_36

    .line 395
    .line 396
    add-int/lit8 v24, v4, 0x1

    .line 397
    .line 398
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    .line 399
    .line 400
    .line 401
    move-result v4

    .line 402
    if-lt v4, v5, :cond_16

    .line 403
    .line 404
    and-int/lit16 v4, v4, 0x1fff

    .line 405
    .line 406
    move/from16 v3, v24

    .line 407
    .line 408
    const/16 v24, 0xd

    .line 409
    .line 410
    :goto_c
    add-int/lit8 v25, v3, 0x1

    .line 411
    .line 412
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    .line 413
    .line 414
    .line 415
    move-result v3

    .line 416
    if-lt v3, v5, :cond_15

    .line 417
    .line 418
    and-int/lit16 v3, v3, 0x1fff

    .line 419
    .line 420
    shl-int v3, v3, v24

    .line 421
    .line 422
    or-int/2addr v4, v3

    .line 423
    add-int/lit8 v24, v24, 0xd

    .line 424
    .line 425
    move/from16 v3, v25

    .line 426
    .line 427
    goto :goto_c

    .line 428
    :cond_15
    shl-int v3, v3, v24

    .line 429
    .line 430
    or-int/2addr v4, v3

    .line 431
    move/from16 v3, v25

    .line 432
    .line 433
    goto :goto_d

    .line 434
    :cond_16
    move/from16 v3, v24

    .line 435
    .line 436
    :goto_d
    add-int/lit8 v24, v3, 0x1

    .line 437
    .line 438
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    .line 439
    .line 440
    .line 441
    move-result v3

    .line 442
    if-lt v3, v5, :cond_18

    .line 443
    .line 444
    and-int/lit16 v3, v3, 0x1fff

    .line 445
    .line 446
    move/from16 v8, v24

    .line 447
    .line 448
    const/16 v24, 0xd

    .line 449
    .line 450
    :goto_e
    add-int/lit8 v25, v8, 0x1

    .line 451
    .line 452
    invoke-virtual {v1, v8}, Ljava/lang/String;->charAt(I)C

    .line 453
    .line 454
    .line 455
    move-result v8

    .line 456
    if-lt v8, v5, :cond_17

    .line 457
    .line 458
    and-int/lit16 v8, v8, 0x1fff

    .line 459
    .line 460
    shl-int v8, v8, v24

    .line 461
    .line 462
    or-int/2addr v3, v8

    .line 463
    add-int/lit8 v24, v24, 0xd

    .line 464
    .line 465
    move/from16 v8, v25

    .line 466
    .line 467
    goto :goto_e

    .line 468
    :cond_17
    shl-int v8, v8, v24

    .line 469
    .line 470
    or-int/2addr v3, v8

    .line 471
    move/from16 v8, v25

    .line 472
    .line 473
    goto :goto_f

    .line 474
    :cond_18
    move/from16 v8, v24

    .line 475
    .line 476
    :goto_f
    and-int/lit16 v6, v3, 0x400

    .line 477
    .line 478
    if-eqz v6, :cond_19

    .line 479
    .line 480
    add-int/lit8 v6, v21, 0x1

    .line 481
    .line 482
    aput v20, v17, v21

    .line 483
    .line 484
    move/from16 v21, v6

    .line 485
    .line 486
    :cond_19
    and-int/lit16 v6, v3, 0xff

    .line 487
    .line 488
    and-int/lit16 v5, v3, 0x800

    .line 489
    .line 490
    move-object/from16 v26, v0

    .line 491
    .line 492
    const/16 v0, 0x33

    .line 493
    .line 494
    if-lt v6, v0, :cond_23

    .line 495
    .line 496
    add-int/lit8 v0, v8, 0x1

    .line 497
    .line 498
    invoke-virtual {v1, v8}, Ljava/lang/String;->charAt(I)C

    .line 499
    .line 500
    .line 501
    move-result v8

    .line 502
    move/from16 v27, v0

    .line 503
    .line 504
    const v0, 0xd800

    .line 505
    .line 506
    .line 507
    if-lt v8, v0, :cond_1b

    .line 508
    .line 509
    and-int/lit16 v8, v8, 0x1fff

    .line 510
    .line 511
    move/from16 v30, v27

    .line 512
    .line 513
    move/from16 v27, v8

    .line 514
    .line 515
    move/from16 v8, v30

    .line 516
    .line 517
    const/16 v30, 0xd

    .line 518
    .line 519
    :goto_10
    add-int/lit8 v31, v8, 0x1

    .line 520
    .line 521
    invoke-virtual {v1, v8}, Ljava/lang/String;->charAt(I)C

    .line 522
    .line 523
    .line 524
    move-result v8

    .line 525
    if-lt v8, v0, :cond_1a

    .line 526
    .line 527
    and-int/lit16 v0, v8, 0x1fff

    .line 528
    .line 529
    shl-int v0, v0, v30

    .line 530
    .line 531
    or-int v27, v27, v0

    .line 532
    .line 533
    add-int/lit8 v30, v30, 0xd

    .line 534
    .line 535
    move/from16 v8, v31

    .line 536
    .line 537
    const v0, 0xd800

    .line 538
    .line 539
    .line 540
    goto :goto_10

    .line 541
    :cond_1a
    shl-int v0, v8, v30

    .line 542
    .line 543
    or-int v8, v27, v0

    .line 544
    .line 545
    move/from16 v0, v31

    .line 546
    .line 547
    goto :goto_11

    .line 548
    :cond_1b
    move/from16 v0, v27

    .line 549
    .line 550
    :goto_11
    move/from16 v27, v0

    .line 551
    .line 552
    add-int/lit8 v0, v6, -0x33

    .line 553
    .line 554
    move/from16 v30, v2

    .line 555
    .line 556
    const/16 v2, 0x9

    .line 557
    .line 558
    if-eq v0, v2, :cond_1c

    .line 559
    .line 560
    const/16 v2, 0x11

    .line 561
    .line 562
    if-ne v0, v2, :cond_1d

    .line 563
    .line 564
    :cond_1c
    const/4 v2, 0x1

    .line 565
    goto :goto_14

    .line 566
    :cond_1d
    const/16 v2, 0xc

    .line 567
    .line 568
    if-ne v0, v2, :cond_20

    .line 569
    .line 570
    invoke-virtual/range {v26 .. v26}, Lcom/google/android/libraries/places/internal/zzavr;->zzc()I

    .line 571
    .line 572
    .line 573
    move-result v0

    .line 574
    const/4 v2, 0x1

    .line 575
    if-eq v0, v2, :cond_1f

    .line 576
    .line 577
    if-eqz v5, :cond_1e

    .line 578
    .line 579
    goto :goto_12

    .line 580
    :cond_1e
    const/4 v5, 0x0

    .line 581
    goto :goto_15

    .line 582
    :cond_1f
    :goto_12
    add-int/lit8 v0, v16, 0x1

    .line 583
    .line 584
    div-int/lit8 v24, v20, 0x3

    .line 585
    .line 586
    add-int v24, v24, v24

    .line 587
    .line 588
    add-int/lit8 v24, v24, 0x1

    .line 589
    .line 590
    aget-object v16, v14, v16

    .line 591
    .line 592
    aput-object v16, v9, v24

    .line 593
    .line 594
    :goto_13
    move/from16 v16, v0

    .line 595
    .line 596
    goto :goto_15

    .line 597
    :goto_14
    add-int/lit8 v0, v16, 0x1

    .line 598
    .line 599
    div-int/lit8 v24, v20, 0x3

    .line 600
    .line 601
    add-int v24, v24, v24

    .line 602
    .line 603
    add-int/lit8 v28, v24, 0x1

    .line 604
    .line 605
    aget-object v2, v14, v16

    .line 606
    .line 607
    aput-object v2, v9, v28

    .line 608
    .line 609
    goto :goto_13

    .line 610
    :cond_20
    :goto_15
    add-int/2addr v8, v8

    .line 611
    aget-object v0, v14, v8

    .line 612
    .line 613
    instance-of v2, v0, Ljava/lang/reflect/Field;

    .line 614
    .line 615
    if-eqz v2, :cond_21

    .line 616
    .line 617
    check-cast v0, Ljava/lang/reflect/Field;

    .line 618
    .line 619
    :goto_16
    move v2, v4

    .line 620
    move/from16 v28, v5

    .line 621
    .line 622
    goto :goto_17

    .line 623
    :cond_21
    check-cast v0, Ljava/lang/String;

    .line 624
    .line 625
    invoke-static {v15, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzx(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 626
    .line 627
    .line 628
    move-result-object v0

    .line 629
    aput-object v0, v14, v8

    .line 630
    .line 631
    goto :goto_16

    .line 632
    :goto_17
    invoke-virtual {v10, v0}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 633
    .line 634
    .line 635
    move-result-wide v4

    .line 636
    long-to-int v0, v4

    .line 637
    add-int/lit8 v8, v8, 0x1

    .line 638
    .line 639
    aget-object v4, v14, v8

    .line 640
    .line 641
    instance-of v5, v4, Ljava/lang/reflect/Field;

    .line 642
    .line 643
    if-eqz v5, :cond_22

    .line 644
    .line 645
    check-cast v4, Ljava/lang/reflect/Field;

    .line 646
    .line 647
    goto :goto_18

    .line 648
    :cond_22
    check-cast v4, Ljava/lang/String;

    .line 649
    .line 650
    invoke-static {v15, v4}, Lcom/google/android/libraries/places/internal/zzavi;->zzx(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 651
    .line 652
    .line 653
    move-result-object v4

    .line 654
    aput-object v4, v14, v8

    .line 655
    .line 656
    :goto_18
    invoke-virtual {v10, v4}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 657
    .line 658
    .line 659
    move-result-wide v4

    .line 660
    long-to-int v4, v4

    .line 661
    move-object/from16 v29, v1

    .line 662
    .line 663
    move/from16 v25, v27

    .line 664
    .line 665
    move/from16 v5, v28

    .line 666
    .line 667
    const/4 v8, 0x0

    .line 668
    move/from16 v28, v2

    .line 669
    .line 670
    goto/16 :goto_25

    .line 671
    .line 672
    :cond_23
    move/from16 v30, v2

    .line 673
    .line 674
    move v2, v4

    .line 675
    add-int/lit8 v0, v16, 0x1

    .line 676
    .line 677
    aget-object v4, v14, v16

    .line 678
    .line 679
    check-cast v4, Ljava/lang/String;

    .line 680
    .line 681
    invoke-static {v15, v4}, Lcom/google/android/libraries/places/internal/zzavi;->zzx(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 682
    .line 683
    .line 684
    move-result-object v4

    .line 685
    move/from16 v27, v0

    .line 686
    .line 687
    const/16 v0, 0x9

    .line 688
    .line 689
    if-eq v6, v0, :cond_24

    .line 690
    .line 691
    const/16 v0, 0x11

    .line 692
    .line 693
    if-ne v6, v0, :cond_25

    .line 694
    .line 695
    :cond_24
    move/from16 v28, v2

    .line 696
    .line 697
    const/4 v2, 0x1

    .line 698
    goto/16 :goto_1e

    .line 699
    .line 700
    :cond_25
    const/16 v0, 0x1b

    .line 701
    .line 702
    if-eq v6, v0, :cond_2d

    .line 703
    .line 704
    const/16 v0, 0x31

    .line 705
    .line 706
    if-ne v6, v0, :cond_26

    .line 707
    .line 708
    add-int/lit8 v16, v16, 0x2

    .line 709
    .line 710
    move/from16 v28, v2

    .line 711
    .line 712
    const/4 v2, 0x1

    .line 713
    goto/16 :goto_1d

    .line 714
    .line 715
    :cond_26
    const/16 v0, 0xc

    .line 716
    .line 717
    if-eq v6, v0, :cond_2a

    .line 718
    .line 719
    const/16 v0, 0x1e

    .line 720
    .line 721
    if-eq v6, v0, :cond_2a

    .line 722
    .line 723
    const/16 v0, 0x2c

    .line 724
    .line 725
    if-ne v6, v0, :cond_27

    .line 726
    .line 727
    goto :goto_1a

    .line 728
    :cond_27
    const/16 v0, 0x32

    .line 729
    .line 730
    if-ne v6, v0, :cond_29

    .line 731
    .line 732
    add-int/lit8 v0, v16, 0x2

    .line 733
    .line 734
    add-int/lit8 v28, v22, 0x1

    .line 735
    .line 736
    aput v20, v17, v22

    .line 737
    .line 738
    div-int/lit8 v22, v20, 0x3

    .line 739
    .line 740
    aget-object v27, v14, v27

    .line 741
    .line 742
    add-int v22, v22, v22

    .line 743
    .line 744
    aput-object v27, v9, v22

    .line 745
    .line 746
    if-eqz v5, :cond_28

    .line 747
    .line 748
    add-int/lit8 v22, v22, 0x1

    .line 749
    .line 750
    add-int/lit8 v16, v16, 0x3

    .line 751
    .line 752
    aget-object v0, v14, v0

    .line 753
    .line 754
    aput-object v0, v9, v22

    .line 755
    .line 756
    move/from16 v0, v16

    .line 757
    .line 758
    move/from16 v22, v28

    .line 759
    .line 760
    move/from16 v28, v2

    .line 761
    .line 762
    :goto_19
    move/from16 v16, v3

    .line 763
    .line 764
    goto :goto_20

    .line 765
    :cond_28
    move/from16 v16, v3

    .line 766
    .line 767
    move/from16 v22, v28

    .line 768
    .line 769
    const/4 v5, 0x0

    .line 770
    move/from16 v28, v2

    .line 771
    .line 772
    goto :goto_20

    .line 773
    :cond_29
    move/from16 v28, v2

    .line 774
    .line 775
    const/4 v2, 0x1

    .line 776
    goto :goto_1f

    .line 777
    :cond_2a
    :goto_1a
    invoke-virtual/range {v26 .. v26}, Lcom/google/android/libraries/places/internal/zzavr;->zzc()I

    .line 778
    .line 779
    .line 780
    move-result v0

    .line 781
    move/from16 v28, v2

    .line 782
    .line 783
    const/4 v2, 0x1

    .line 784
    if-eq v0, v2, :cond_2c

    .line 785
    .line 786
    if-eqz v5, :cond_2b

    .line 787
    .line 788
    goto :goto_1b

    .line 789
    :cond_2b
    move/from16 v16, v3

    .line 790
    .line 791
    move/from16 v0, v27

    .line 792
    .line 793
    const/4 v5, 0x0

    .line 794
    goto :goto_20

    .line 795
    :cond_2c
    :goto_1b
    add-int/lit8 v16, v16, 0x2

    .line 796
    .line 797
    div-int/lit8 v0, v20, 0x3

    .line 798
    .line 799
    add-int/2addr v0, v0

    .line 800
    add-int/2addr v0, v2

    .line 801
    aget-object v24, v14, v27

    .line 802
    .line 803
    aput-object v24, v9, v0

    .line 804
    .line 805
    :goto_1c
    move/from16 v0, v16

    .line 806
    .line 807
    goto :goto_19

    .line 808
    :cond_2d
    move/from16 v28, v2

    .line 809
    .line 810
    const/4 v2, 0x1

    .line 811
    add-int/lit8 v16, v16, 0x2

    .line 812
    .line 813
    :goto_1d
    div-int/lit8 v0, v20, 0x3

    .line 814
    .line 815
    add-int/2addr v0, v0

    .line 816
    add-int/2addr v0, v2

    .line 817
    aget-object v24, v14, v27

    .line 818
    .line 819
    aput-object v24, v9, v0

    .line 820
    .line 821
    goto :goto_1c

    .line 822
    :goto_1e
    div-int/lit8 v0, v20, 0x3

    .line 823
    .line 824
    add-int/2addr v0, v0

    .line 825
    add-int/2addr v0, v2

    .line 826
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    .line 827
    .line 828
    .line 829
    move-result-object v16

    .line 830
    aput-object v16, v9, v0

    .line 831
    .line 832
    :goto_1f
    move/from16 v16, v3

    .line 833
    .line 834
    move/from16 v0, v27

    .line 835
    .line 836
    :goto_20
    invoke-virtual {v10, v4}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 837
    .line 838
    .line 839
    move-result-wide v2

    .line 840
    long-to-int v2, v2

    .line 841
    move/from16 v3, v16

    .line 842
    .line 843
    and-int/lit16 v4, v3, 0x1000

    .line 844
    .line 845
    const v16, 0xfffff

    .line 846
    .line 847
    .line 848
    if-eqz v4, :cond_31

    .line 849
    .line 850
    const/16 v4, 0x11

    .line 851
    .line 852
    if-gt v6, v4, :cond_31

    .line 853
    .line 854
    add-int/lit8 v4, v8, 0x1

    .line 855
    .line 856
    invoke-virtual {v1, v8}, Ljava/lang/String;->charAt(I)C

    .line 857
    .line 858
    .line 859
    move-result v8

    .line 860
    move/from16 v27, v0

    .line 861
    .line 862
    const v0, 0xd800

    .line 863
    .line 864
    .line 865
    if-lt v8, v0, :cond_2f

    .line 866
    .line 867
    and-int/lit16 v8, v8, 0x1fff

    .line 868
    .line 869
    const/16 v16, 0xd

    .line 870
    .line 871
    :goto_21
    add-int/lit8 v25, v4, 0x1

    .line 872
    .line 873
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    .line 874
    .line 875
    .line 876
    move-result v4

    .line 877
    if-lt v4, v0, :cond_2e

    .line 878
    .line 879
    and-int/lit16 v4, v4, 0x1fff

    .line 880
    .line 881
    shl-int v4, v4, v16

    .line 882
    .line 883
    or-int/2addr v8, v4

    .line 884
    add-int/lit8 v16, v16, 0xd

    .line 885
    .line 886
    move/from16 v4, v25

    .line 887
    .line 888
    goto :goto_21

    .line 889
    :cond_2e
    shl-int v4, v4, v16

    .line 890
    .line 891
    or-int/2addr v8, v4

    .line 892
    goto :goto_22

    .line 893
    :cond_2f
    move/from16 v25, v4

    .line 894
    .line 895
    :goto_22
    add-int v4, v7, v7

    .line 896
    .line 897
    div-int/lit8 v16, v8, 0x20

    .line 898
    .line 899
    add-int v4, v4, v16

    .line 900
    .line 901
    aget-object v0, v14, v4

    .line 902
    .line 903
    move-object/from16 v29, v1

    .line 904
    .line 905
    instance-of v1, v0, Ljava/lang/reflect/Field;

    .line 906
    .line 907
    if-eqz v1, :cond_30

    .line 908
    .line 909
    check-cast v0, Ljava/lang/reflect/Field;

    .line 910
    .line 911
    goto :goto_23

    .line 912
    :cond_30
    check-cast v0, Ljava/lang/String;

    .line 913
    .line 914
    invoke-static {v15, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzx(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 915
    .line 916
    .line 917
    move-result-object v0

    .line 918
    aput-object v0, v14, v4

    .line 919
    .line 920
    :goto_23
    invoke-virtual {v10, v0}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 921
    .line 922
    .line 923
    move-result-wide v0

    .line 924
    long-to-int v0, v0

    .line 925
    rem-int/lit8 v8, v8, 0x20

    .line 926
    .line 927
    move v4, v0

    .line 928
    goto :goto_24

    .line 929
    :cond_31
    move/from16 v27, v0

    .line 930
    .line 931
    move-object/from16 v29, v1

    .line 932
    .line 933
    move/from16 v25, v8

    .line 934
    .line 935
    move/from16 v4, v16

    .line 936
    .line 937
    const/4 v8, 0x0

    .line 938
    :goto_24
    const/16 v0, 0x12

    .line 939
    .line 940
    if-lt v6, v0, :cond_32

    .line 941
    .line 942
    const/16 v0, 0x31

    .line 943
    .line 944
    if-gt v6, v0, :cond_32

    .line 945
    .line 946
    add-int/lit8 v0, v23, 0x1

    .line 947
    .line 948
    aput v2, v17, v23

    .line 949
    .line 950
    move/from16 v23, v0

    .line 951
    .line 952
    :cond_32
    move v0, v2

    .line 953
    move/from16 v16, v27

    .line 954
    .line 955
    :goto_25
    add-int/lit8 v1, v20, 0x1

    .line 956
    .line 957
    aput v28, v11, v20

    .line 958
    .line 959
    add-int/lit8 v2, v20, 0x2

    .line 960
    .line 961
    move/from16 v27, v0

    .line 962
    .line 963
    and-int/lit16 v0, v3, 0x200

    .line 964
    .line 965
    if-eqz v0, :cond_33

    .line 966
    .line 967
    const/high16 v0, 0x20000000

    .line 968
    .line 969
    goto :goto_26

    .line 970
    :cond_33
    const/4 v0, 0x0

    .line 971
    :goto_26
    and-int/lit16 v3, v3, 0x100

    .line 972
    .line 973
    if-eqz v3, :cond_34

    .line 974
    .line 975
    const/high16 v3, 0x10000000

    .line 976
    .line 977
    goto :goto_27

    .line 978
    :cond_34
    const/4 v3, 0x0

    .line 979
    :goto_27
    if-eqz v5, :cond_35

    .line 980
    .line 981
    const/high16 v5, -0x80000000

    .line 982
    .line 983
    goto :goto_28

    .line 984
    :cond_35
    const/4 v5, 0x0

    .line 985
    :goto_28
    shl-int/lit8 v6, v6, 0x14

    .line 986
    .line 987
    or-int/2addr v0, v3

    .line 988
    or-int/2addr v0, v5

    .line 989
    or-int/2addr v0, v6

    .line 990
    or-int v0, v0, v27

    .line 991
    .line 992
    aput v0, v11, v1

    .line 993
    .line 994
    add-int/lit8 v20, v20, 0x3

    .line 995
    .line 996
    shl-int/lit8 v0, v8, 0x14

    .line 997
    .line 998
    or-int/2addr v0, v4

    .line 999
    aput v0, v11, v2

    .line 1000
    .line 1001
    move/from16 v4, v25

    .line 1002
    .line 1003
    move-object/from16 v0, v26

    .line 1004
    .line 1005
    move-object/from16 v1, v29

    .line 1006
    .line 1007
    move/from16 v2, v30

    .line 1008
    .line 1009
    const/4 v3, 0x0

    .line 1010
    const v5, 0xd800

    .line 1011
    .line 1012
    .line 1013
    goto/16 :goto_b

    .line 1014
    .line 1015
    :cond_36
    move-object/from16 v26, v0

    .line 1016
    .line 1017
    new-instance v0, Lcom/google/android/libraries/places/internal/zzavi;

    .line 1018
    .line 1019
    invoke-virtual/range {v26 .. v26}, Lcom/google/android/libraries/places/internal/zzavr;->zza()Lcom/google/android/libraries/places/internal/zzavf;

    .line 1020
    .line 1021
    .line 1022
    move-result-object v14

    .line 1023
    invoke-virtual/range {v26 .. v26}, Lcom/google/android/libraries/places/internal/zzavr;->zzc()I

    .line 1024
    .line 1025
    .line 1026
    move-result v15

    .line 1027
    const/16 v16, 0x0

    .line 1028
    .line 1029
    move-object/from16 v20, p2

    .line 1030
    .line 1031
    move-object/from16 v21, p3

    .line 1032
    .line 1033
    move-object/from16 v22, p4

    .line 1034
    .line 1035
    move-object/from16 v23, p5

    .line 1036
    .line 1037
    move-object/from16 v24, p6

    .line 1038
    .line 1039
    move-object v10, v11

    .line 1040
    move-object v11, v9

    .line 1041
    move-object v9, v0

    .line 1042
    invoke-direct/range {v9 .. v24}, Lcom/google/android/libraries/places/internal/zzavi;-><init>([I[Ljava/lang/Object;IILcom/google/android/libraries/places/internal/zzavf;IZ[IIILcom/google/android/libraries/places/internal/zzavl;Lcom/google/android/libraries/places/internal/zzaut;Lcom/google/android/libraries/places/internal/zzawn;Lcom/google/android/libraries/places/internal/zzatg;Lcom/google/android/libraries/places/internal/zzava;)V

    .line 1043
    .line 1044
    .line 1045
    return-object v9

    .line 1046
    :cond_37
    check-cast v0, Lcom/google/android/libraries/places/internal/zzawh;

    .line 1047
    .line 1048
    const/4 v0, 0x0

    .line 1049
    throw v0
.end method

.method private static zzk(Ljava/lang/Object;J)D
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Double;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method private static zzl(Ljava/lang/Object;J)F
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private static zzm(Ljava/lang/Object;J)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private final zzn(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x2

    .line 4
    .line 5
    aget p0, p0, p1

    .line 6
    .line 7
    return p0
.end method

.method private static zzo(I)I
    .locals 0

    ushr-int/lit8 p0, p0, 0x14

    and-int/lit16 p0, p0, 0xff

    return p0
.end method

.method private final zzp(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    aget p0, p0, p1

    .line 6
    .line 7
    return p0
.end method

.method private static zzq(Ljava/lang/Object;J)J
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Long;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method private final zzr(I)Lcom/google/android/libraries/places/internal/zzaty;
    .locals 0

    .line 1
    div-int/lit8 p1, p1, 0x3

    .line 2
    .line 3
    add-int/2addr p1, p1

    .line 4
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzd:[Ljava/lang/Object;

    .line 5
    .line 6
    add-int/lit8 p1, p1, 0x1

    .line 7
    .line 8
    aget-object p0, p0, p1

    .line 9
    .line 10
    check-cast p0, Lcom/google/android/libraries/places/internal/zzaty;

    .line 11
    .line 12
    return-object p0
.end method

.method private final zzs(I)Lcom/google/android/libraries/places/internal/zzavt;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzd:[Ljava/lang/Object;

    .line 2
    .line 3
    div-int/lit8 p1, p1, 0x3

    .line 4
    .line 5
    add-int/2addr p1, p1

    .line 6
    aget-object v1, v0, p1

    .line 7
    .line 8
    check-cast v1, Lcom/google/android/libraries/places/internal/zzavt;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    return-object v1

    .line 13
    :cond_0
    add-int/lit8 v1, p1, 0x1

    .line 14
    .line 15
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzavp;->zza()Lcom/google/android/libraries/places/internal/zzavp;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    aget-object v0, v0, v1

    .line 20
    .line 21
    check-cast v0, Ljava/lang/Class;

    .line 22
    .line 23
    invoke-virtual {v2, v0}, Lcom/google/android/libraries/places/internal/zzavp;->zzb(Ljava/lang/Class;)Lcom/google/android/libraries/places/internal/zzavt;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzd:[Ljava/lang/Object;

    .line 28
    .line 29
    aput-object v0, p0, p1

    .line 30
    .line 31
    return-object v0
.end method

.method private final zzt(Ljava/lang/Object;ILjava/lang/Object;Lcom/google/android/libraries/places/internal/zzawn;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p4, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 2
    .line 3
    aget p4, p4, p2

    .line 4
    .line 5
    invoke-direct {p0, p2}, Lcom/google/android/libraries/places/internal/zzavi;->zzp(I)I

    .line 6
    .line 7
    .line 8
    move-result p4

    .line 9
    const p5, 0xfffff

    .line 10
    .line 11
    .line 12
    and-int/2addr p4, p5

    .line 13
    int-to-long p4, p4

    .line 14
    invoke-static {p1, p4, p5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-direct {p0, p2}, Lcom/google/android/libraries/places/internal/zzavi;->zzr(I)Lcom/google/android/libraries/places/internal/zzaty;

    .line 22
    .line 23
    .line 24
    move-result-object p4

    .line 25
    if-nez p4, :cond_1

    .line 26
    .line 27
    :goto_0
    return-object p3

    .line 28
    :cond_1
    check-cast p1, Lcom/google/android/libraries/places/internal/zzauz;

    .line 29
    .line 30
    invoke-direct {p0, p2}, Lcom/google/android/libraries/places/internal/zzavi;->zzu(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lcom/google/android/libraries/places/internal/zzauy;

    .line 35
    .line 36
    const/4 p0, 0x0

    .line 37
    throw p0
.end method

.method private final zzu(I)Ljava/lang/Object;
    .locals 0

    .line 1
    div-int/lit8 p1, p1, 0x3

    .line 2
    .line 3
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzd:[Ljava/lang/Object;

    .line 4
    .line 5
    add-int/2addr p1, p1

    .line 6
    aget-object p0, p0, p1

    .line 7
    .line 8
    return-object p0
.end method

.method private final zzv(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-direct {p0, p2}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, p2}, Lcom/google/android/libraries/places/internal/zzavi;->zzp(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const v2, 0xfffff

    .line 10
    .line 11
    .line 12
    and-int/2addr v1, v2

    .line 13
    invoke-direct {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavt;->zzc()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    int-to-long v1, v1

    .line 25
    sget-object p0, Lcom/google/android/libraries/places/internal/zzavi;->zzb:Lsun/misc/Unsafe;

    .line 26
    .line 27
    invoke-virtual {p0, p1, v1, v2}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzavi;->zzL(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_1
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavt;->zzc()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    invoke-interface {v0, p1, p0}, Lcom/google/android/libraries/places/internal/zzavt;->zze(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-object p1
.end method

.method private final zzw(Ljava/lang/Object;II)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-direct {p0, p3}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavt;->zzc()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    sget-object p2, Lcom/google/android/libraries/places/internal/zzavi;->zzb:Lsun/misc/Unsafe;

    .line 17
    .line 18
    invoke-direct {p0, p3}, Lcom/google/android/libraries/places/internal/zzavi;->zzp(I)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const p3, 0xfffff

    .line 23
    .line 24
    .line 25
    and-int/2addr p0, p3

    .line 26
    int-to-long v1, p0

    .line 27
    invoke-virtual {p2, p1, v1, v2}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzavi;->zzL(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_1
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavt;->zzc()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    invoke-interface {v0, p1, p0}, Lcom/google/android/libraries/places/internal/zzavt;->zze(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-object p1
.end method

.method private static zzx(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 5

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    array-length v1, v0

    .line 11
    const/4 v2, 0x0

    .line 12
    :goto_0
    if-ge v2, v1, :cond_1

    .line 13
    .line 14
    aget-object v3, v0, v2

    .line 15
    .line 16
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    return-object v3

    .line 27
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {p1, p0, v0}, Ll/ikx0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return-object p0
.end method

.method private static zzy(Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzavi;->zzL(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string v0, "Mutating immutable message: "

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private final zzz(Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 5

    .line 1
    invoke-direct {p0, p2, p3}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-direct {p0, p3}, Lcom/google/android/libraries/places/internal/zzavi;->zzp(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const v1, 0xfffff

    .line 13
    .line 14
    .line 15
    and-int/2addr v0, v1

    .line 16
    sget-object v1, Lcom/google/android/libraries/places/internal/zzavi;->zzb:Lsun/misc/Unsafe;

    .line 17
    .line 18
    int-to-long v2, v0

    .line 19
    invoke-virtual {v1, p2, v2, v3}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_4

    .line 24
    .line 25
    invoke-direct {p0, p3}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-direct {p0, p1, p3}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-nez v4, :cond_2

    .line 34
    .line 35
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzL(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-nez v4, :cond_1

    .line 40
    .line 41
    invoke-virtual {v1, p1, v2, v3, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-interface {p2}, Lcom/google/android/libraries/places/internal/zzavt;->zzc()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-interface {p2, v4, v0}, Lcom/google/android/libraries/places/internal/zzavt;->zze(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, p1, v2, v3, v4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :goto_0
    invoke-direct {p0, p1, p3}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    invoke-virtual {v1, p1, v2, v3}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzavi;->zzL(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p3

    .line 67
    if-nez p3, :cond_3

    .line 68
    .line 69
    invoke-interface {p2}, Lcom/google/android/libraries/places/internal/zzavt;->zzc()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    invoke-interface {p2, p3, p0}, Lcom/google/android/libraries/places/internal/zzavt;->zze(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1, p1, v2, v3, p3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    move-object p0, p3

    .line 80
    :cond_3
    invoke-interface {p2, p0, v0}, Lcom/google/android/libraries/places/internal/zzavt;->zze(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_4
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 85
    .line 86
    aget p0, p0, p3

    .line 87
    .line 88
    invoke-static {p2, p0}, Ll/hkx0;->a(Ljava/lang/Object;I)V

    .line 89
    .line 90
    .line 91
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)I
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 1
    sget-object v6, Lcom/google/android/libraries/places/internal/zzavi;->zzb:Lsun/misc/Unsafe;

    const/4 v7, 0x0

    const v8, 0xfffff

    move v2, v7

    move v4, v2

    move v9, v4

    move v3, v8

    :goto_0
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    array-length v5, v5

    if-ge v2, v5, :cond_1e

    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzp(I)I

    move-result v5

    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzo(I)I

    move-result v10

    iget-object v11, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    add-int/lit8 v12, v2, 0x2

    .line 2
    aget v13, v11, v2

    .line 3
    aget v11, v11, v12

    and-int v12, v11, v8

    const/16 v14, 0x11

    const/4 v15, 0x1

    if-gt v10, v14, :cond_2

    if-eq v12, v3, :cond_1

    if-ne v12, v8, :cond_0

    move v4, v7

    goto :goto_1

    :cond_0
    int-to-long v3, v12

    .line 4
    invoke-virtual {v6, v1, v3, v4}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v3

    move v4, v3

    :goto_1
    move v3, v12

    :cond_1
    ushr-int/lit8 v11, v11, 0x14

    shl-int v11, v15, v11

    goto :goto_2

    :cond_2
    move v11, v7

    :goto_2
    and-int/2addr v5, v8

    .line 5
    sget-object v12, Lcom/google/android/libraries/places/internal/zzatl;->zzJ:Lcom/google/android/libraries/places/internal/zzatl;

    .line 6
    invoke-virtual {v12}, Lcom/google/android/libraries/places/internal/zzatl;->zza()I

    move-result v12

    if-lt v10, v12, :cond_3

    sget-object v12, Lcom/google/android/libraries/places/internal/zzatl;->zzW:Lcom/google/android/libraries/places/internal/zzatl;

    .line 7
    invoke-virtual {v12}, Lcom/google/android/libraries/places/internal/zzatl;->zza()I

    :cond_3
    move v14, v9

    int-to-long v8, v5

    const/16 v16, 0x3f

    packed-switch v10, :pswitch_data_0

    goto/16 :goto_1e

    .line 8
    :pswitch_0
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_1d

    .line 9
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/libraries/places/internal/zzavf;

    .line 10
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    move-result-object v8

    .line 11
    invoke-static {v13, v5, v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzy(ILcom/google/android/libraries/places/internal/zzavf;Lcom/google/android/libraries/places/internal/zzavt;)I

    move-result v5

    :goto_3
    add-int v9, v14, v5

    goto/16 :goto_1f

    .line 12
    :pswitch_1
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_1d

    shl-int/lit8 v5, v13, 0x3

    .line 13
    invoke-static {v1, v8, v9}, Lcom/google/android/libraries/places/internal/zzavi;->zzq(Ljava/lang/Object;J)J

    move-result-wide v8

    add-long v10, v8, v8

    shr-long v8, v8, v16

    .line 14
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    xor-long/2addr v8, v10

    .line 15
    invoke-static {v8, v9}, Lcom/google/android/libraries/places/internal/zzasx;->zzC(J)I

    move-result v8

    :goto_4
    add-int/2addr v5, v8

    goto :goto_3

    .line 16
    :pswitch_2
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_1d

    shl-int/lit8 v5, v13, 0x3

    .line 17
    invoke-static {v1, v8, v9}, Lcom/google/android/libraries/places/internal/zzavi;->zzm(Ljava/lang/Object;J)I

    move-result v8

    add-int v9, v8, v8

    shr-int/lit8 v8, v8, 0x1f

    .line 18
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    xor-int/2addr v8, v9

    .line 19
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    goto :goto_4

    .line 20
    :pswitch_3
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_1d

    shl-int/lit8 v5, v13, 0x3

    .line 21
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    :goto_5
    add-int/lit8 v5, v5, 0x8

    goto :goto_3

    .line 22
    :pswitch_4
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_1d

    shl-int/lit8 v5, v13, 0x3

    .line 23
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    :goto_6
    add-int/lit8 v5, v5, 0x4

    goto :goto_3

    .line 24
    :pswitch_5
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_1d

    shl-int/lit8 v5, v13, 0x3

    .line 25
    invoke-static {v1, v8, v9}, Lcom/google/android/libraries/places/internal/zzavi;->zzm(Ljava/lang/Object;J)I

    move-result v8

    int-to-long v8, v8

    .line 26
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    .line 27
    invoke-static {v8, v9}, Lcom/google/android/libraries/places/internal/zzasx;->zzC(J)I

    move-result v8

    goto :goto_4

    .line 28
    :pswitch_6
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_1d

    shl-int/lit8 v5, v13, 0x3

    .line 29
    invoke-static {v1, v8, v9}, Lcom/google/android/libraries/places/internal/zzavi;->zzm(Ljava/lang/Object;J)I

    move-result v8

    .line 30
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    .line 31
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    goto :goto_4

    .line 32
    :pswitch_7
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_1d

    shl-int/lit8 v5, v13, 0x3

    .line 33
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/libraries/places/internal/zzask;

    .line 34
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    .line 35
    invoke-virtual {v8}, Lcom/google/android/libraries/places/internal/zzask;->zzd()I

    move-result v8

    .line 36
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    :goto_7
    add-int/2addr v9, v8

    add-int/2addr v5, v9

    goto/16 :goto_3

    .line 37
    :pswitch_8
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_1d

    .line 38
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 39
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    move-result-object v8

    invoke-static {v13, v5, v8}, Lcom/google/android/libraries/places/internal/zzavv;->zzh(ILjava/lang/Object;Lcom/google/android/libraries/places/internal/zzavt;)I

    move-result v5

    goto/16 :goto_3

    .line 40
    :pswitch_9
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_1d

    shl-int/lit8 v5, v13, 0x3

    .line 41
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v8

    instance-of v9, v8, Lcom/google/android/libraries/places/internal/zzask;

    if-eqz v9, :cond_4

    .line 42
    check-cast v8, Lcom/google/android/libraries/places/internal/zzask;

    .line 43
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    .line 44
    invoke-virtual {v8}, Lcom/google/android/libraries/places/internal/zzask;->zzd()I

    move-result v8

    .line 45
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    goto :goto_7

    .line 46
    :cond_4
    check-cast v8, Ljava/lang/String;

    .line 47
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    .line 48
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzA(Ljava/lang/String;)I

    move-result v8

    goto/16 :goto_4

    .line 49
    :pswitch_a
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_1d

    shl-int/lit8 v5, v13, 0x3

    .line 50
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    add-int/2addr v5, v15

    goto/16 :goto_3

    .line 51
    :pswitch_b
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_1d

    shl-int/lit8 v5, v13, 0x3

    .line 52
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    goto/16 :goto_6

    .line 53
    :pswitch_c
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_1d

    shl-int/lit8 v5, v13, 0x3

    .line 54
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    goto/16 :goto_5

    .line 55
    :pswitch_d
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_1d

    shl-int/lit8 v5, v13, 0x3

    .line 56
    invoke-static {v1, v8, v9}, Lcom/google/android/libraries/places/internal/zzavi;->zzm(Ljava/lang/Object;J)I

    move-result v8

    int-to-long v8, v8

    .line 57
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    .line 58
    invoke-static {v8, v9}, Lcom/google/android/libraries/places/internal/zzasx;->zzC(J)I

    move-result v8

    goto/16 :goto_4

    .line 59
    :pswitch_e
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_1d

    shl-int/lit8 v5, v13, 0x3

    .line 60
    invoke-static {v1, v8, v9}, Lcom/google/android/libraries/places/internal/zzavi;->zzq(Ljava/lang/Object;J)J

    move-result-wide v8

    .line 61
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    .line 62
    invoke-static {v8, v9}, Lcom/google/android/libraries/places/internal/zzasx;->zzC(J)I

    move-result v8

    goto/16 :goto_4

    .line 63
    :pswitch_f
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_1d

    shl-int/lit8 v5, v13, 0x3

    .line 64
    invoke-static {v1, v8, v9}, Lcom/google/android/libraries/places/internal/zzavi;->zzq(Ljava/lang/Object;J)J

    move-result-wide v8

    .line 65
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    .line 66
    invoke-static {v8, v9}, Lcom/google/android/libraries/places/internal/zzasx;->zzC(J)I

    move-result v8

    goto/16 :goto_4

    .line 67
    :pswitch_10
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_1d

    shl-int/lit8 v5, v13, 0x3

    .line 68
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    goto/16 :goto_6

    .line 69
    :pswitch_11
    invoke-direct {v0, v1, v13, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_1d

    shl-int/lit8 v5, v13, 0x3

    .line 70
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    goto/16 :goto_5

    .line 71
    :pswitch_12
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzu(I)Ljava/lang/Object;

    move-result-object v8

    .line 72
    check-cast v5, Lcom/google/android/libraries/places/internal/zzauz;

    .line 73
    check-cast v8, Lcom/google/android/libraries/places/internal/zzauy;

    .line 74
    invoke-virtual {v5}, Ljava/util/AbstractMap;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_1d

    .line 75
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzauz;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_5

    goto/16 :goto_1e

    :cond_5
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 76
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    const/4 v0, 0x0

    .line 77
    throw v0

    .line 78
    :pswitch_13
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 79
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    move-result-object v8

    .line 80
    sget v9, Lcom/google/android/libraries/places/internal/zzavv;->zza:I

    .line 81
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v9

    if-nez v9, :cond_6

    move v11, v7

    goto :goto_9

    :cond_6
    move v10, v7

    move v11, v10

    :goto_8
    if-ge v10, v9, :cond_7

    .line 82
    invoke-interface {v5, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/google/android/libraries/places/internal/zzavf;

    invoke-static {v13, v15, v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzy(ILcom/google/android/libraries/places/internal/zzavf;Lcom/google/android/libraries/places/internal/zzavt;)I

    move-result v15

    add-int/2addr v11, v15

    add-int/lit8 v10, v10, 0x1

    goto :goto_8

    :cond_7
    :goto_9
    add-int v9, v14, v11

    goto/16 :goto_1f

    .line 83
    :pswitch_14
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 84
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zzj(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_1d

    shl-int/lit8 v8, v13, 0x3

    .line 85
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    .line 86
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    :goto_a
    add-int/2addr v8, v9

    add-int/2addr v8, v5

    :cond_8
    :goto_b
    add-int v9, v14, v8

    goto/16 :goto_1f

    .line 87
    :pswitch_15
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 88
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zzi(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_1d

    shl-int/lit8 v8, v13, 0x3

    .line 89
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    .line 90
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    goto :goto_a

    .line 91
    :pswitch_16
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 92
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zze(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_1d

    shl-int/lit8 v8, v13, 0x3

    .line 93
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    .line 94
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    goto :goto_a

    .line 95
    :pswitch_17
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 96
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zzc(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_1d

    shl-int/lit8 v8, v13, 0x3

    .line 97
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    .line 98
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    goto :goto_a

    .line 99
    :pswitch_18
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 100
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zza(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_1d

    shl-int/lit8 v8, v13, 0x3

    .line 101
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    .line 102
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    goto :goto_a

    .line 103
    :pswitch_19
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 104
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zzk(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_1d

    shl-int/lit8 v8, v13, 0x3

    .line 105
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    .line 106
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    goto :goto_a

    .line 107
    :pswitch_1a
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 108
    sget v8, Lcom/google/android/libraries/places/internal/zzavv;->zza:I

    .line 109
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_1d

    shl-int/lit8 v8, v13, 0x3

    .line 110
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    .line 111
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    goto/16 :goto_a

    .line 112
    :pswitch_1b
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 113
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zzc(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_1d

    shl-int/lit8 v8, v13, 0x3

    .line 114
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    .line 115
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    goto/16 :goto_a

    .line 116
    :pswitch_1c
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 117
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zze(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_1d

    shl-int/lit8 v8, v13, 0x3

    .line 118
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    .line 119
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    goto/16 :goto_a

    .line 120
    :pswitch_1d
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 121
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zzf(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_1d

    shl-int/lit8 v8, v13, 0x3

    .line 122
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    .line 123
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    goto/16 :goto_a

    .line 124
    :pswitch_1e
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 125
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zzl(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_1d

    shl-int/lit8 v8, v13, 0x3

    .line 126
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    .line 127
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    goto/16 :goto_a

    .line 128
    :pswitch_1f
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 129
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zzg(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_1d

    shl-int/lit8 v8, v13, 0x3

    .line 130
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    .line 131
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    goto/16 :goto_a

    .line 132
    :pswitch_20
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 133
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zzc(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_1d

    shl-int/lit8 v8, v13, 0x3

    .line 134
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    .line 135
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    goto/16 :goto_a

    .line 136
    :pswitch_21
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 137
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zze(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_1d

    shl-int/lit8 v8, v13, 0x3

    .line 138
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    .line 139
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    goto/16 :goto_a

    .line 140
    :pswitch_22
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 141
    sget v8, Lcom/google/android/libraries/places/internal/zzavv;->zza:I

    .line 142
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_9

    :goto_c
    move v5, v7

    goto/16 :goto_3

    :cond_9
    shl-int/lit8 v9, v13, 0x3

    .line 143
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zzj(Ljava/util/List;)I

    move-result v5

    .line 144
    invoke-static {v9}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    :goto_d
    mul-int/2addr v8, v9

    goto/16 :goto_4

    .line 145
    :pswitch_23
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 146
    sget v8, Lcom/google/android/libraries/places/internal/zzavv;->zza:I

    .line 147
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_a

    goto :goto_c

    :cond_a
    shl-int/lit8 v9, v13, 0x3

    .line 148
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zzi(Ljava/util/List;)I

    move-result v5

    .line 149
    invoke-static {v9}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    goto :goto_d

    .line 150
    :pswitch_24
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 151
    invoke-static {v13, v5, v7}, Lcom/google/android/libraries/places/internal/zzavv;->zzd(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_3

    .line 152
    :pswitch_25
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 153
    invoke-static {v13, v5, v7}, Lcom/google/android/libraries/places/internal/zzavv;->zzb(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_3

    .line 154
    :pswitch_26
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 155
    sget v8, Lcom/google/android/libraries/places/internal/zzavv;->zza:I

    .line 156
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_b

    goto :goto_c

    :cond_b
    shl-int/lit8 v9, v13, 0x3

    .line 157
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zza(Ljava/util/List;)I

    move-result v5

    .line 158
    invoke-static {v9}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    goto :goto_d

    .line 159
    :pswitch_27
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 160
    sget v8, Lcom/google/android/libraries/places/internal/zzavv;->zza:I

    .line 161
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_c

    goto :goto_c

    :cond_c
    shl-int/lit8 v9, v13, 0x3

    .line 162
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zzk(Ljava/util/List;)I

    move-result v5

    .line 163
    invoke-static {v9}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    goto :goto_d

    .line 164
    :pswitch_28
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 165
    sget v8, Lcom/google/android/libraries/places/internal/zzavv;->zza:I

    .line 166
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_d

    move v8, v7

    goto/16 :goto_b

    :cond_d
    shl-int/lit8 v9, v13, 0x3

    .line 167
    invoke-static {v9}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    mul-int/2addr v8, v9

    move v9, v7

    .line 168
    :goto_e
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v10

    if-ge v9, v10, :cond_8

    .line 169
    invoke-interface {v5, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/google/android/libraries/places/internal/zzask;

    .line 170
    invoke-virtual {v10}, Lcom/google/android/libraries/places/internal/zzask;->zzd()I

    move-result v10

    .line 171
    invoke-static {v10}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v11

    add-int/2addr v11, v10

    add-int/2addr v8, v11

    add-int/lit8 v9, v9, 0x1

    goto :goto_e

    .line 172
    :pswitch_29
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    move-result-object v8

    .line 173
    sget v9, Lcom/google/android/libraries/places/internal/zzavv;->zza:I

    .line 174
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v9

    if-nez v9, :cond_e

    move v10, v7

    goto :goto_11

    :cond_e
    shl-int/lit8 v10, v13, 0x3

    .line 175
    invoke-static {v10}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v10

    mul-int/2addr v10, v9

    move v11, v7

    :goto_f
    if-ge v11, v9, :cond_10

    .line 176
    invoke-interface {v5, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    instance-of v15, v13, Lcom/google/android/libraries/places/internal/zzaul;

    if-eqz v15, :cond_f

    .line 177
    check-cast v13, Lcom/google/android/libraries/places/internal/zzaul;

    .line 178
    invoke-virtual {v13}, Lcom/google/android/libraries/places/internal/zzaul;->zza()I

    move-result v13

    .line 179
    invoke-static {v13}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v15

    add-int/2addr v15, v13

    add-int/2addr v10, v15

    goto :goto_10

    .line 180
    :cond_f
    check-cast v13, Lcom/google/android/libraries/places/internal/zzavf;

    invoke-static {v13, v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzz(Lcom/google/android/libraries/places/internal/zzavf;Lcom/google/android/libraries/places/internal/zzavt;)I

    move-result v13

    add-int/2addr v10, v13

    :goto_10
    add-int/lit8 v11, v11, 0x1

    goto :goto_f

    :cond_10
    :goto_11
    add-int v9, v14, v10

    goto/16 :goto_1f

    .line 181
    :pswitch_2a
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    sget v8, Lcom/google/android/libraries/places/internal/zzavv;->zza:I

    .line 182
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_11

    :goto_12
    move v9, v7

    goto :goto_17

    :cond_11
    shl-int/lit8 v9, v13, 0x3

    .line 183
    invoke-static {v9}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    mul-int/2addr v9, v8

    instance-of v10, v5, Lcom/google/android/libraries/places/internal/zzaun;

    if-eqz v10, :cond_13

    .line 184
    check-cast v5, Lcom/google/android/libraries/places/internal/zzaun;

    move v10, v7

    :goto_13
    if-ge v10, v8, :cond_15

    .line 185
    invoke-interface {v5, v10}, Lcom/google/android/libraries/places/internal/zzaun;->zzf(I)Ljava/lang/Object;

    move-result-object v11

    instance-of v13, v11, Lcom/google/android/libraries/places/internal/zzask;

    if-eqz v13, :cond_12

    .line 186
    check-cast v11, Lcom/google/android/libraries/places/internal/zzask;

    .line 187
    invoke-virtual {v11}, Lcom/google/android/libraries/places/internal/zzask;->zzd()I

    move-result v11

    .line 188
    invoke-static {v11}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v13

    add-int/2addr v13, v11

    add-int/2addr v9, v13

    goto :goto_14

    .line 189
    :cond_12
    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Lcom/google/android/libraries/places/internal/zzasx;->zzA(Ljava/lang/String;)I

    move-result v11

    add-int/2addr v9, v11

    :goto_14
    add-int/lit8 v10, v10, 0x1

    goto :goto_13

    :cond_13
    move v10, v7

    :goto_15
    if-ge v10, v8, :cond_15

    .line 190
    invoke-interface {v5, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    instance-of v13, v11, Lcom/google/android/libraries/places/internal/zzask;

    if-eqz v13, :cond_14

    .line 191
    check-cast v11, Lcom/google/android/libraries/places/internal/zzask;

    .line 192
    invoke-virtual {v11}, Lcom/google/android/libraries/places/internal/zzask;->zzd()I

    move-result v11

    .line 193
    invoke-static {v11}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v13

    add-int/2addr v13, v11

    add-int/2addr v9, v13

    goto :goto_16

    .line 194
    :cond_14
    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Lcom/google/android/libraries/places/internal/zzasx;->zzA(Ljava/lang/String;)I

    move-result v11

    add-int/2addr v9, v11

    :goto_16
    add-int/lit8 v10, v10, 0x1

    goto :goto_15

    :cond_15
    :goto_17
    add-int/2addr v9, v14

    goto/16 :goto_1f

    .line 195
    :pswitch_2b
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 196
    sget v8, Lcom/google/android/libraries/places/internal/zzavv;->zza:I

    .line 197
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_16

    goto/16 :goto_c

    :cond_16
    shl-int/lit8 v8, v13, 0x3

    .line 198
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    add-int/2addr v8, v15

    mul-int/2addr v5, v8

    goto/16 :goto_3

    .line 199
    :pswitch_2c
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 200
    invoke-static {v13, v5, v7}, Lcom/google/android/libraries/places/internal/zzavv;->zzb(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_3

    .line 201
    :pswitch_2d
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 202
    invoke-static {v13, v5, v7}, Lcom/google/android/libraries/places/internal/zzavv;->zzd(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_3

    .line 203
    :pswitch_2e
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 204
    sget v8, Lcom/google/android/libraries/places/internal/zzavv;->zza:I

    .line 205
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_17

    goto/16 :goto_c

    :cond_17
    shl-int/lit8 v9, v13, 0x3

    .line 206
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zzf(Ljava/util/List;)I

    move-result v5

    .line 207
    invoke-static {v9}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    goto/16 :goto_d

    .line 208
    :pswitch_2f
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 209
    sget v8, Lcom/google/android/libraries/places/internal/zzavv;->zza:I

    .line 210
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_18

    goto/16 :goto_c

    :cond_18
    shl-int/lit8 v9, v13, 0x3

    .line 211
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zzl(Ljava/util/List;)I

    move-result v5

    .line 212
    invoke-static {v9}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v9

    goto/16 :goto_d

    .line 213
    :pswitch_30
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 214
    sget v8, Lcom/google/android/libraries/places/internal/zzavv;->zza:I

    .line 215
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_19

    goto/16 :goto_12

    :cond_19
    shl-int/lit8 v8, v13, 0x3

    .line 216
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzavv;->zzg(Ljava/util/List;)I

    move-result v9

    .line 217
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    .line 218
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    mul-int/2addr v5, v8

    add-int/2addr v9, v5

    goto/16 :goto_17

    .line 219
    :pswitch_31
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 220
    invoke-static {v13, v5, v7}, Lcom/google/android/libraries/places/internal/zzavv;->zzb(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_3

    .line 221
    :pswitch_32
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 222
    invoke-static {v13, v5, v7}, Lcom/google/android/libraries/places/internal/zzavv;->zzd(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_3

    :pswitch_33
    move v5, v11

    .line 223
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1d

    .line 224
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/libraries/places/internal/zzavf;

    .line 225
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    move-result-object v8

    .line 226
    invoke-static {v13, v5, v8}, Lcom/google/android/libraries/places/internal/zzasx;->zzy(ILcom/google/android/libraries/places/internal/zzavf;Lcom/google/android/libraries/places/internal/zzavt;)I

    move-result v5

    goto/16 :goto_3

    :pswitch_34
    move v5, v11

    .line 227
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1a

    shl-int/lit8 v0, v13, 0x3

    .line 228
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v8

    add-long v10, v8, v8

    shr-long v8, v8, v16

    .line 229
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v0

    xor-long/2addr v8, v10

    .line 230
    invoke-static {v8, v9}, Lcom/google/android/libraries/places/internal/zzasx;->zzC(J)I

    move-result v5

    :goto_18
    add-int/2addr v0, v5

    :goto_19
    add-int v9, v14, v0

    move-object/from16 v0, p0

    goto/16 :goto_1f

    :cond_1a
    move-object/from16 v0, p0

    goto/16 :goto_1e

    :pswitch_35
    move v5, v11

    .line 231
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1a

    shl-int/lit8 v0, v13, 0x3

    .line 232
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v5

    add-int v8, v5, v5

    shr-int/lit8 v5, v5, 0x1f

    .line 233
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v0

    xor-int/2addr v5, v8

    .line 234
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    goto :goto_18

    :pswitch_36
    move v5, v11

    .line 235
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1b

    shl-int/lit8 v0, v13, 0x3

    .line 236
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v0

    :goto_1a
    add-int/lit8 v0, v0, 0x8

    :goto_1b
    add-int v9, v14, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    goto/16 :goto_1f

    :cond_1b
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    goto/16 :goto_1e

    :pswitch_37
    move v5, v11

    .line 237
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1b

    shl-int/lit8 v0, v13, 0x3

    .line 238
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v0

    :goto_1c
    add-int/lit8 v0, v0, 0x4

    goto :goto_1b

    :pswitch_38
    move v5, v11

    .line 239
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1a

    shl-int/lit8 v0, v13, 0x3

    .line 240
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v5

    int-to-long v8, v5

    .line 241
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v0

    .line 242
    invoke-static {v8, v9}, Lcom/google/android/libraries/places/internal/zzasx;->zzC(J)I

    move-result v5

    goto :goto_18

    :pswitch_39
    move v5, v11

    .line 243
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1a

    shl-int/lit8 v0, v13, 0x3

    .line 244
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v5

    .line 245
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v0

    .line 246
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    goto :goto_18

    :pswitch_3a
    move v5, v11

    .line 247
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1a

    shl-int/lit8 v0, v13, 0x3

    .line 248
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/libraries/places/internal/zzask;

    .line 249
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v0

    .line 250
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzask;->zzd()I

    move-result v5

    .line 251
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    :goto_1d
    add-int/2addr v8, v5

    add-int/2addr v0, v8

    goto/16 :goto_19

    :pswitch_3b
    move v5, v11

    .line 252
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1d

    .line 253
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 254
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    move-result-object v8

    invoke-static {v13, v5, v8}, Lcom/google/android/libraries/places/internal/zzavv;->zzh(ILjava/lang/Object;Lcom/google/android/libraries/places/internal/zzavt;)I

    move-result v5

    goto/16 :goto_3

    :pswitch_3c
    move v5, v11

    .line 255
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1a

    shl-int/lit8 v0, v13, 0x3

    .line 256
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    instance-of v8, v5, Lcom/google/android/libraries/places/internal/zzask;

    if-eqz v8, :cond_1c

    .line 257
    check-cast v5, Lcom/google/android/libraries/places/internal/zzask;

    .line 258
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v0

    .line 259
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzask;->zzd()I

    move-result v5

    .line 260
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v8

    goto :goto_1d

    .line 261
    :cond_1c
    check-cast v5, Ljava/lang/String;

    .line 262
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v0

    .line 263
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzA(Ljava/lang/String;)I

    move-result v5

    goto/16 :goto_18

    :pswitch_3d
    move v5, v11

    .line 264
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1b

    shl-int/lit8 v0, v13, 0x3

    .line 265
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v0

    add-int/2addr v0, v15

    goto/16 :goto_1b

    :pswitch_3e
    move v5, v11

    .line 266
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1b

    shl-int/lit8 v0, v13, 0x3

    .line 267
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v0

    goto/16 :goto_1c

    :pswitch_3f
    move v5, v11

    .line 268
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1b

    shl-int/lit8 v0, v13, 0x3

    .line 269
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v0

    goto/16 :goto_1a

    :pswitch_40
    move v5, v11

    .line 270
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1a

    shl-int/lit8 v0, v13, 0x3

    .line 271
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v5

    int-to-long v8, v5

    .line 272
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v0

    .line 273
    invoke-static {v8, v9}, Lcom/google/android/libraries/places/internal/zzasx;->zzC(J)I

    move-result v5

    goto/16 :goto_18

    :pswitch_41
    move v5, v11

    .line 274
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1a

    shl-int/lit8 v0, v13, 0x3

    .line 275
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v8

    .line 276
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v0

    .line 277
    invoke-static {v8, v9}, Lcom/google/android/libraries/places/internal/zzasx;->zzC(J)I

    move-result v5

    goto/16 :goto_18

    :pswitch_42
    move v5, v11

    .line 278
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1a

    shl-int/lit8 v0, v13, 0x3

    .line 279
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v8

    .line 280
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v0

    .line 281
    invoke-static {v8, v9}, Lcom/google/android/libraries/places/internal/zzasx;->zzC(J)I

    move-result v5

    goto/16 :goto_18

    :pswitch_43
    move v5, v11

    .line 282
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1b

    shl-int/lit8 v0, v13, 0x3

    .line 283
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v0

    goto/16 :goto_1c

    :pswitch_44
    move v5, v11

    .line 284
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_1d

    shl-int/lit8 v5, v13, 0x3

    .line 285
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzasx;->zzB(I)I

    move-result v5

    goto/16 :goto_5

    :cond_1d
    :goto_1e
    move v9, v14

    :goto_1f
    add-int/lit8 v2, v2, 0x3

    const v8, 0xfffff

    goto/16 :goto_0

    :cond_1e
    move v14, v9

    .line 286
    iget-object v2, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzn:Lcom/google/android/libraries/places/internal/zzawn;

    .line 287
    invoke-virtual {v2, v1}, Lcom/google/android/libraries/places/internal/zzawn;->zzd(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 288
    invoke-virtual {v2, v3}, Lcom/google/android/libraries/places/internal/zzawn;->zza(Ljava/lang/Object;)I

    move-result v2

    add-int v9, v14, v2

    iget-boolean v2, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzh:Z

    if-eqz v2, :cond_21

    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzo:Lcom/google/android/libraries/places/internal/zzatg;

    .line 289
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/internal/zzatg;->zzb(Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzatk;

    move-result-object v0

    move v1, v7

    :goto_20
    iget-object v2, v0, Lcom/google/android/libraries/places/internal/zzatk;->zza:Lcom/google/android/libraries/places/internal/zzawg;

    .line 290
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzawg;->zzb()I

    move-result v2

    .line 291
    iget-object v3, v0, Lcom/google/android/libraries/places/internal/zzatk;->zza:Lcom/google/android/libraries/places/internal/zzawg;

    if-ge v7, v2, :cond_1f

    .line 292
    invoke-virtual {v3, v7}, Lcom/google/android/libraries/places/internal/zzawg;->zzg(I)Ljava/util/Map$Entry;

    move-result-object v2

    .line 293
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/libraries/places/internal/zzatj;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/google/android/libraries/places/internal/zzatk;->zzb(Lcom/google/android/libraries/places/internal/zzatj;Ljava/lang/Object;)I

    move-result v2

    add-int/2addr v1, v2

    add-int/lit8 v7, v7, 0x1

    goto :goto_20

    .line 294
    :cond_1f
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzawg;->zzc()Ljava/lang/Iterable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_21
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 295
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/libraries/places/internal/zzatj;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/google/android/libraries/places/internal/zzatk;->zzb(Lcom/google/android/libraries/places/internal/zzatj;Ljava/lang/Object;)I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_21

    :cond_20
    add-int/2addr v9, v1

    :cond_21
    return v9

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final zzb(Ljava/lang/Object;)I
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 4
    .line 5
    array-length v2, v2

    .line 6
    if-ge v0, v2, :cond_2

    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzp(I)I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 13
    .line 14
    const v4, 0xfffff

    .line 15
    .line 16
    .line 17
    and-int/2addr v4, v2

    .line 18
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzo(I)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    aget v3, v3, v0

    .line 23
    .line 24
    int-to-long v4, v4

    .line 25
    const/16 v6, 0x25

    .line 26
    .line 27
    const/16 v7, 0x20

    .line 28
    .line 29
    packed-switch v2, :pswitch_data_0

    .line 30
    .line 31
    .line 32
    goto/16 :goto_4

    .line 33
    .line 34
    :pswitch_0
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_1

    .line 39
    .line 40
    mul-int/lit8 v1, v1, 0x35

    .line 41
    .line 42
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    :goto_1
    add-int/2addr v1, v2

    .line 51
    goto/16 :goto_4

    .line 52
    .line 53
    :pswitch_1
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_1

    .line 58
    .line 59
    mul-int/lit8 v1, v1, 0x35

    .line 60
    .line 61
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzq(Ljava/lang/Object;J)J

    .line 62
    .line 63
    .line 64
    move-result-wide v2

    .line 65
    sget-object v4, Lcom/google/android/libraries/places/internal/zzaud;->zzd:[B

    .line 66
    .line 67
    :goto_2
    ushr-long v4, v2, v7

    .line 68
    .line 69
    xor-long/2addr v2, v4

    .line 70
    long-to-int v2, v2

    .line 71
    goto :goto_1

    .line 72
    :pswitch_2
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_1

    .line 77
    .line 78
    mul-int/lit8 v1, v1, 0x35

    .line 79
    .line 80
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzm(Ljava/lang/Object;J)I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    goto :goto_1

    .line 85
    :pswitch_3
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-eqz v2, :cond_1

    .line 90
    .line 91
    mul-int/lit8 v1, v1, 0x35

    .line 92
    .line 93
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzq(Ljava/lang/Object;J)J

    .line 94
    .line 95
    .line 96
    move-result-wide v2

    .line 97
    sget-object v4, Lcom/google/android/libraries/places/internal/zzaud;->zzd:[B

    .line 98
    .line 99
    goto :goto_2

    .line 100
    :pswitch_4
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    if-eqz v2, :cond_1

    .line 105
    .line 106
    mul-int/lit8 v1, v1, 0x35

    .line 107
    .line 108
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzm(Ljava/lang/Object;J)I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    goto :goto_1

    .line 113
    :pswitch_5
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    if-eqz v2, :cond_1

    .line 118
    .line 119
    mul-int/lit8 v1, v1, 0x35

    .line 120
    .line 121
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzm(Ljava/lang/Object;J)I

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    goto :goto_1

    .line 126
    :pswitch_6
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    if-eqz v2, :cond_1

    .line 131
    .line 132
    mul-int/lit8 v1, v1, 0x35

    .line 133
    .line 134
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzm(Ljava/lang/Object;J)I

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    goto :goto_1

    .line 139
    :pswitch_7
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    if-eqz v2, :cond_1

    .line 144
    .line 145
    mul-int/lit8 v1, v1, 0x35

    .line 146
    .line 147
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    goto :goto_1

    .line 156
    :pswitch_8
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    if-eqz v2, :cond_1

    .line 161
    .line 162
    mul-int/lit8 v1, v1, 0x35

    .line 163
    .line 164
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 169
    .line 170
    .line 171
    move-result v2

    .line 172
    goto :goto_1

    .line 173
    :pswitch_9
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 174
    .line 175
    .line 176
    move-result v2

    .line 177
    if-eqz v2, :cond_1

    .line 178
    .line 179
    mul-int/lit8 v1, v1, 0x35

    .line 180
    .line 181
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    check-cast v2, Ljava/lang/String;

    .line 186
    .line 187
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    goto/16 :goto_1

    .line 192
    .line 193
    :pswitch_a
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    if-eqz v2, :cond_1

    .line 198
    .line 199
    mul-int/lit8 v1, v1, 0x35

    .line 200
    .line 201
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzN(Ljava/lang/Object;J)Z

    .line 202
    .line 203
    .line 204
    move-result v2

    .line 205
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzaud;->zza(Z)I

    .line 206
    .line 207
    .line 208
    move-result v2

    .line 209
    goto/16 :goto_1

    .line 210
    .line 211
    :pswitch_b
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 212
    .line 213
    .line 214
    move-result v2

    .line 215
    if-eqz v2, :cond_1

    .line 216
    .line 217
    mul-int/lit8 v1, v1, 0x35

    .line 218
    .line 219
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzm(Ljava/lang/Object;J)I

    .line 220
    .line 221
    .line 222
    move-result v2

    .line 223
    goto/16 :goto_1

    .line 224
    .line 225
    :pswitch_c
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 226
    .line 227
    .line 228
    move-result v2

    .line 229
    if-eqz v2, :cond_1

    .line 230
    .line 231
    mul-int/lit8 v1, v1, 0x35

    .line 232
    .line 233
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzq(Ljava/lang/Object;J)J

    .line 234
    .line 235
    .line 236
    move-result-wide v2

    .line 237
    sget-object v4, Lcom/google/android/libraries/places/internal/zzaud;->zzd:[B

    .line 238
    .line 239
    goto/16 :goto_2

    .line 240
    .line 241
    :pswitch_d
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 242
    .line 243
    .line 244
    move-result v2

    .line 245
    if-eqz v2, :cond_1

    .line 246
    .line 247
    mul-int/lit8 v1, v1, 0x35

    .line 248
    .line 249
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzm(Ljava/lang/Object;J)I

    .line 250
    .line 251
    .line 252
    move-result v2

    .line 253
    goto/16 :goto_1

    .line 254
    .line 255
    :pswitch_e
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 256
    .line 257
    .line 258
    move-result v2

    .line 259
    if-eqz v2, :cond_1

    .line 260
    .line 261
    mul-int/lit8 v1, v1, 0x35

    .line 262
    .line 263
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzq(Ljava/lang/Object;J)J

    .line 264
    .line 265
    .line 266
    move-result-wide v2

    .line 267
    sget-object v4, Lcom/google/android/libraries/places/internal/zzaud;->zzd:[B

    .line 268
    .line 269
    goto/16 :goto_2

    .line 270
    .line 271
    :pswitch_f
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 272
    .line 273
    .line 274
    move-result v2

    .line 275
    if-eqz v2, :cond_1

    .line 276
    .line 277
    mul-int/lit8 v1, v1, 0x35

    .line 278
    .line 279
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzq(Ljava/lang/Object;J)J

    .line 280
    .line 281
    .line 282
    move-result-wide v2

    .line 283
    sget-object v4, Lcom/google/android/libraries/places/internal/zzaud;->zzd:[B

    .line 284
    .line 285
    goto/16 :goto_2

    .line 286
    .line 287
    :pswitch_10
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 288
    .line 289
    .line 290
    move-result v2

    .line 291
    if-eqz v2, :cond_1

    .line 292
    .line 293
    mul-int/lit8 v1, v1, 0x35

    .line 294
    .line 295
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzl(Ljava/lang/Object;J)F

    .line 296
    .line 297
    .line 298
    move-result v2

    .line 299
    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 300
    .line 301
    .line 302
    move-result v2

    .line 303
    goto/16 :goto_1

    .line 304
    .line 305
    :pswitch_11
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 306
    .line 307
    .line 308
    move-result v2

    .line 309
    if-eqz v2, :cond_1

    .line 310
    .line 311
    mul-int/lit8 v1, v1, 0x35

    .line 312
    .line 313
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzk(Ljava/lang/Object;J)D

    .line 314
    .line 315
    .line 316
    move-result-wide v2

    .line 317
    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 318
    .line 319
    .line 320
    move-result-wide v2

    .line 321
    sget-object v4, Lcom/google/android/libraries/places/internal/zzaud;->zzd:[B

    .line 322
    .line 323
    goto/16 :goto_2

    .line 324
    .line 325
    :pswitch_12
    mul-int/lit8 v1, v1, 0x35

    .line 326
    .line 327
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    move-result-object v2

    .line 331
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 332
    .line 333
    .line 334
    move-result v2

    .line 335
    goto/16 :goto_1

    .line 336
    .line 337
    :pswitch_13
    mul-int/lit8 v1, v1, 0x35

    .line 338
    .line 339
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 340
    .line 341
    .line 342
    move-result-object v2

    .line 343
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 344
    .line 345
    .line 346
    move-result v2

    .line 347
    goto/16 :goto_1

    .line 348
    .line 349
    :pswitch_14
    mul-int/lit8 v1, v1, 0x35

    .line 350
    .line 351
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 352
    .line 353
    .line 354
    move-result-object v2

    .line 355
    if-eqz v2, :cond_0

    .line 356
    .line 357
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 358
    .line 359
    .line 360
    move-result v6

    .line 361
    :cond_0
    :goto_3
    add-int/2addr v1, v6

    .line 362
    goto/16 :goto_4

    .line 363
    .line 364
    :pswitch_15
    mul-int/lit8 v1, v1, 0x35

    .line 365
    .line 366
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 367
    .line 368
    .line 369
    move-result-wide v2

    .line 370
    sget-object v4, Lcom/google/android/libraries/places/internal/zzaud;->zzd:[B

    .line 371
    .line 372
    goto/16 :goto_2

    .line 373
    .line 374
    :pswitch_16
    mul-int/lit8 v1, v1, 0x35

    .line 375
    .line 376
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 377
    .line 378
    .line 379
    move-result v2

    .line 380
    goto/16 :goto_1

    .line 381
    .line 382
    :pswitch_17
    mul-int/lit8 v1, v1, 0x35

    .line 383
    .line 384
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 385
    .line 386
    .line 387
    move-result-wide v2

    .line 388
    sget-object v4, Lcom/google/android/libraries/places/internal/zzaud;->zzd:[B

    .line 389
    .line 390
    goto/16 :goto_2

    .line 391
    .line 392
    :pswitch_18
    mul-int/lit8 v1, v1, 0x35

    .line 393
    .line 394
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 395
    .line 396
    .line 397
    move-result v2

    .line 398
    goto/16 :goto_1

    .line 399
    .line 400
    :pswitch_19
    mul-int/lit8 v1, v1, 0x35

    .line 401
    .line 402
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 403
    .line 404
    .line 405
    move-result v2

    .line 406
    goto/16 :goto_1

    .line 407
    .line 408
    :pswitch_1a
    mul-int/lit8 v1, v1, 0x35

    .line 409
    .line 410
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 411
    .line 412
    .line 413
    move-result v2

    .line 414
    goto/16 :goto_1

    .line 415
    .line 416
    :pswitch_1b
    mul-int/lit8 v1, v1, 0x35

    .line 417
    .line 418
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 419
    .line 420
    .line 421
    move-result-object v2

    .line 422
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 423
    .line 424
    .line 425
    move-result v2

    .line 426
    goto/16 :goto_1

    .line 427
    .line 428
    :pswitch_1c
    mul-int/lit8 v1, v1, 0x35

    .line 429
    .line 430
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 431
    .line 432
    .line 433
    move-result-object v2

    .line 434
    if-eqz v2, :cond_0

    .line 435
    .line 436
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 437
    .line 438
    .line 439
    move-result v6

    .line 440
    goto :goto_3

    .line 441
    :pswitch_1d
    mul-int/lit8 v1, v1, 0x35

    .line 442
    .line 443
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 444
    .line 445
    .line 446
    move-result-object v2

    .line 447
    check-cast v2, Ljava/lang/String;

    .line 448
    .line 449
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 450
    .line 451
    .line 452
    move-result v2

    .line 453
    goto/16 :goto_1

    .line 454
    .line 455
    :pswitch_1e
    mul-int/lit8 v1, v1, 0x35

    .line 456
    .line 457
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzw(Ljava/lang/Object;J)Z

    .line 458
    .line 459
    .line 460
    move-result v2

    .line 461
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzaud;->zza(Z)I

    .line 462
    .line 463
    .line 464
    move-result v2

    .line 465
    goto/16 :goto_1

    .line 466
    .line 467
    :pswitch_1f
    mul-int/lit8 v1, v1, 0x35

    .line 468
    .line 469
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 470
    .line 471
    .line 472
    move-result v2

    .line 473
    goto/16 :goto_1

    .line 474
    .line 475
    :pswitch_20
    mul-int/lit8 v1, v1, 0x35

    .line 476
    .line 477
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 478
    .line 479
    .line 480
    move-result-wide v2

    .line 481
    sget-object v4, Lcom/google/android/libraries/places/internal/zzaud;->zzd:[B

    .line 482
    .line 483
    goto/16 :goto_2

    .line 484
    .line 485
    :pswitch_21
    mul-int/lit8 v1, v1, 0x35

    .line 486
    .line 487
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 488
    .line 489
    .line 490
    move-result v2

    .line 491
    goto/16 :goto_1

    .line 492
    .line 493
    :pswitch_22
    mul-int/lit8 v1, v1, 0x35

    .line 494
    .line 495
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 496
    .line 497
    .line 498
    move-result-wide v2

    .line 499
    sget-object v4, Lcom/google/android/libraries/places/internal/zzaud;->zzd:[B

    .line 500
    .line 501
    goto/16 :goto_2

    .line 502
    .line 503
    :pswitch_23
    mul-int/lit8 v1, v1, 0x35

    .line 504
    .line 505
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 506
    .line 507
    .line 508
    move-result-wide v2

    .line 509
    sget-object v4, Lcom/google/android/libraries/places/internal/zzaud;->zzd:[B

    .line 510
    .line 511
    goto/16 :goto_2

    .line 512
    .line 513
    :pswitch_24
    mul-int/lit8 v1, v1, 0x35

    .line 514
    .line 515
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzb(Ljava/lang/Object;J)F

    .line 516
    .line 517
    .line 518
    move-result v2

    .line 519
    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 520
    .line 521
    .line 522
    move-result v2

    .line 523
    goto/16 :goto_1

    .line 524
    .line 525
    :pswitch_25
    mul-int/lit8 v1, v1, 0x35

    .line 526
    .line 527
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zza(Ljava/lang/Object;J)D

    .line 528
    .line 529
    .line 530
    move-result-wide v2

    .line 531
    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 532
    .line 533
    .line 534
    move-result-wide v2

    .line 535
    sget-object v4, Lcom/google/android/libraries/places/internal/zzaud;->zzd:[B

    .line 536
    .line 537
    goto/16 :goto_2

    .line 538
    .line 539
    :cond_1
    :goto_4
    add-int/lit8 v0, v0, 0x3

    .line 540
    .line 541
    goto/16 :goto_0

    .line 542
    .line 543
    :cond_2
    mul-int/lit8 v1, v1, 0x35

    .line 544
    .line 545
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzn:Lcom/google/android/libraries/places/internal/zzawn;

    .line 546
    .line 547
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzawn;->zzd(Ljava/lang/Object;)Ljava/lang/Object;

    .line 548
    .line 549
    .line 550
    move-result-object v0

    .line 551
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 552
    .line 553
    .line 554
    move-result v0

    .line 555
    add-int/2addr v1, v0

    .line 556
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzh:Z

    .line 557
    .line 558
    if-eqz v0, :cond_3

    .line 559
    .line 560
    mul-int/lit8 v1, v1, 0x35

    .line 561
    .line 562
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzo:Lcom/google/android/libraries/places/internal/zzatg;

    .line 563
    .line 564
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzatg;->zzb(Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzatk;

    .line 565
    .line 566
    .line 567
    move-result-object p0

    .line 568
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzatk;->zza:Lcom/google/android/libraries/places/internal/zzawg;

    .line 569
    .line 570
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzawg;->hashCode()I

    .line 571
    .line 572
    .line 573
    move-result p0

    .line 574
    add-int/2addr v1, p0

    .line 575
    :cond_3
    return v1

    .line 576
    nop

    .line 577
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final zzc()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzg:Lcom/google/android/libraries/places/internal/zzavf;

    .line 2
    .line 3
    check-cast p0, Lcom/google/android/libraries/places/internal/zzatu;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzatu;->zzat()Lcom/google/android/libraries/places/internal/zzatu;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final zzd(Ljava/lang/Object;)V
    .locals 7

    .line 1
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzavi;->zzL(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_2

    .line 8
    .line 9
    :cond_0
    instance-of v0, p1, Lcom/google/android/libraries/places/internal/zzatu;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    move-object v0, p1

    .line 15
    check-cast v0, Lcom/google/android/libraries/places/internal/zzatu;

    .line 16
    .line 17
    const v2, 0x7fffffff

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/internal/zzatu;->zzaF(I)V

    .line 21
    .line 22
    .line 23
    iput v1, v0, Lcom/google/android/libraries/places/internal/zzart;->zza:I

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzatu;->zzaD()V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 29
    .line 30
    :goto_0
    array-length v2, v0

    .line 31
    if-ge v1, v2, :cond_5

    .line 32
    .line 33
    invoke-direct {p0, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzp(I)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    const v3, 0xfffff

    .line 38
    .line 39
    .line 40
    and-int/2addr v3, v2

    .line 41
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzo(I)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    int-to-long v3, v3

    .line 46
    const/16 v5, 0x9

    .line 47
    .line 48
    if-eq v2, v5, :cond_3

    .line 49
    .line 50
    const/16 v5, 0x3c

    .line 51
    .line 52
    if-eq v2, v5, :cond_2

    .line 53
    .line 54
    const/16 v5, 0x44

    .line 55
    .line 56
    if-eq v2, v5, :cond_2

    .line 57
    .line 58
    packed-switch v2, :pswitch_data_0

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :pswitch_0
    sget-object v2, Lcom/google/android/libraries/places/internal/zzavi;->zzb:Lsun/misc/Unsafe;

    .line 63
    .line 64
    invoke-virtual {v2, p1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    if-eqz v5, :cond_4

    .line 69
    .line 70
    move-object v6, v5

    .line 71
    check-cast v6, Lcom/google/android/libraries/places/internal/zzauz;

    .line 72
    .line 73
    invoke-virtual {v6}, Lcom/google/android/libraries/places/internal/zzauz;->zzc()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2, p1, v3, v4, v5}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :pswitch_1
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    .line 81
    .line 82
    invoke-virtual {v2, p1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zzb(Ljava/lang/Object;J)V

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_2
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 87
    .line 88
    aget v2, v2, v1

    .line 89
    .line 90
    invoke-direct {p0, p1, v2, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-eqz v2, :cond_4

    .line 95
    .line 96
    invoke-direct {p0, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    sget-object v5, Lcom/google/android/libraries/places/internal/zzavi;->zzb:Lsun/misc/Unsafe;

    .line 101
    .line 102
    invoke-virtual {v5, p1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-interface {v2, v3}, Lcom/google/android/libraries/places/internal/zzavt;->zzd(Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_3
    :pswitch_2
    invoke-direct {p0, p1, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    if-eqz v2, :cond_4

    .line 115
    .line 116
    invoke-direct {p0, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    sget-object v5, Lcom/google/android/libraries/places/internal/zzavi;->zzb:Lsun/misc/Unsafe;

    .line 121
    .line 122
    invoke-virtual {v5, p1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-interface {v2, v3}, Lcom/google/android/libraries/places/internal/zzavt;->zzd(Ljava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    :cond_4
    :goto_1
    add-int/lit8 v1, v1, 0x3

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_5
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzn:Lcom/google/android/libraries/places/internal/zzawn;

    .line 133
    .line 134
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzawn;->zzm(Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzh:Z

    .line 138
    .line 139
    if-eqz v0, :cond_6

    .line 140
    .line 141
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzo:Lcom/google/android/libraries/places/internal/zzatg;

    .line 142
    .line 143
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzatg;->zzf(Ljava/lang/Object;)V

    .line 144
    .line 145
    .line 146
    :cond_6
    :goto_2
    return-void

    .line 147
    :pswitch_data_0
    .packed-switch 0x11
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final zze(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 1
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzavi;->zzy(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 9
    .line 10
    array-length v1, v1

    .line 11
    if-ge v0, v1, :cond_1

    .line 12
    .line 13
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzp(I)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const v2, 0xfffff

    .line 18
    .line 19
    .line 20
    and-int/2addr v2, v1

    .line 21
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 22
    .line 23
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzo(I)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    aget v3, v3, v0

    .line 28
    .line 29
    int-to-long v4, v2

    .line 30
    packed-switch v1, :pswitch_data_0

    .line 31
    .line 32
    .line 33
    goto/16 :goto_1

    .line 34
    .line 35
    :pswitch_0
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzA(Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 36
    .line 37
    .line 38
    goto/16 :goto_1

    .line 39
    .line 40
    :pswitch_1
    invoke-direct {p0, p2, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-static {p1, v4, v5, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    .line 54
    .line 55
    .line 56
    goto/16 :goto_1

    .line 57
    .line 58
    :pswitch_2
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzA(Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 59
    .line 60
    .line 61
    goto/16 :goto_1

    .line 62
    .line 63
    :pswitch_3
    invoke-direct {p0, p2, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_0

    .line 68
    .line 69
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-static {p1, v4, v5, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    invoke-direct {p0, p1, v3, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    .line 77
    .line 78
    .line 79
    goto/16 :goto_1

    .line 80
    .line 81
    :pswitch_4
    sget v1, Lcom/google/android/libraries/places/internal/zzavv;->zza:I

    .line 82
    .line 83
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-static {v1, v2}, Lcom/google/android/libraries/places/internal/zzava;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-static {p1, v4, v5, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    goto/16 :goto_1

    .line 99
    .line 100
    :pswitch_5
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    .line 101
    .line 102
    invoke-virtual {v1, p1, p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzaut;->zzc(Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 103
    .line 104
    .line 105
    goto/16 :goto_1

    .line 106
    .line 107
    :pswitch_6
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzz(Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 108
    .line 109
    .line 110
    goto/16 :goto_1

    .line 111
    .line 112
    :pswitch_7
    invoke-direct {p0, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-eqz v1, :cond_0

    .line 117
    .line 118
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 119
    .line 120
    .line 121
    move-result-wide v1

    .line 122
    invoke-static {p1, v4, v5, v1, v2}, Lcom/google/android/libraries/places/internal/zzawx;->zzr(Ljava/lang/Object;JJ)V

    .line 123
    .line 124
    .line 125
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    .line 126
    .line 127
    .line 128
    goto/16 :goto_1

    .line 129
    .line 130
    :pswitch_8
    invoke-direct {p0, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-eqz v1, :cond_0

    .line 135
    .line 136
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    invoke-static {p1, v4, v5, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzq(Ljava/lang/Object;JI)V

    .line 141
    .line 142
    .line 143
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    .line 144
    .line 145
    .line 146
    goto/16 :goto_1

    .line 147
    .line 148
    :pswitch_9
    invoke-direct {p0, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    if-eqz v1, :cond_0

    .line 153
    .line 154
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 155
    .line 156
    .line 157
    move-result-wide v1

    .line 158
    invoke-static {p1, v4, v5, v1, v2}, Lcom/google/android/libraries/places/internal/zzawx;->zzr(Ljava/lang/Object;JJ)V

    .line 159
    .line 160
    .line 161
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    .line 162
    .line 163
    .line 164
    goto/16 :goto_1

    .line 165
    .line 166
    :pswitch_a
    invoke-direct {p0, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    if-eqz v1, :cond_0

    .line 171
    .line 172
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    invoke-static {p1, v4, v5, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzq(Ljava/lang/Object;JI)V

    .line 177
    .line 178
    .line 179
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    .line 180
    .line 181
    .line 182
    goto/16 :goto_1

    .line 183
    .line 184
    :pswitch_b
    invoke-direct {p0, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    if-eqz v1, :cond_0

    .line 189
    .line 190
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    invoke-static {p1, v4, v5, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzq(Ljava/lang/Object;JI)V

    .line 195
    .line 196
    .line 197
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    .line 198
    .line 199
    .line 200
    goto/16 :goto_1

    .line 201
    .line 202
    :pswitch_c
    invoke-direct {p0, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 203
    .line 204
    .line 205
    move-result v1

    .line 206
    if-eqz v1, :cond_0

    .line 207
    .line 208
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    invoke-static {p1, v4, v5, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzq(Ljava/lang/Object;JI)V

    .line 213
    .line 214
    .line 215
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    .line 216
    .line 217
    .line 218
    goto/16 :goto_1

    .line 219
    .line 220
    :pswitch_d
    invoke-direct {p0, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    if-eqz v1, :cond_0

    .line 225
    .line 226
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    invoke-static {p1, v4, v5, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 231
    .line 232
    .line 233
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    .line 234
    .line 235
    .line 236
    goto/16 :goto_1

    .line 237
    .line 238
    :pswitch_e
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzz(Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 239
    .line 240
    .line 241
    goto/16 :goto_1

    .line 242
    .line 243
    :pswitch_f
    invoke-direct {p0, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    if-eqz v1, :cond_0

    .line 248
    .line 249
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    invoke-static {p1, v4, v5, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 254
    .line 255
    .line 256
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    .line 257
    .line 258
    .line 259
    goto/16 :goto_1

    .line 260
    .line 261
    :pswitch_10
    invoke-direct {p0, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 262
    .line 263
    .line 264
    move-result v1

    .line 265
    if-eqz v1, :cond_0

    .line 266
    .line 267
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzw(Ljava/lang/Object;J)Z

    .line 268
    .line 269
    .line 270
    move-result v1

    .line 271
    invoke-static {p1, v4, v5, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzm(Ljava/lang/Object;JZ)V

    .line 272
    .line 273
    .line 274
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    .line 275
    .line 276
    .line 277
    goto/16 :goto_1

    .line 278
    .line 279
    :pswitch_11
    invoke-direct {p0, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 280
    .line 281
    .line 282
    move-result v1

    .line 283
    if-eqz v1, :cond_0

    .line 284
    .line 285
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 286
    .line 287
    .line 288
    move-result v1

    .line 289
    invoke-static {p1, v4, v5, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzq(Ljava/lang/Object;JI)V

    .line 290
    .line 291
    .line 292
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    .line 293
    .line 294
    .line 295
    goto :goto_1

    .line 296
    :pswitch_12
    invoke-direct {p0, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 297
    .line 298
    .line 299
    move-result v1

    .line 300
    if-eqz v1, :cond_0

    .line 301
    .line 302
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 303
    .line 304
    .line 305
    move-result-wide v1

    .line 306
    invoke-static {p1, v4, v5, v1, v2}, Lcom/google/android/libraries/places/internal/zzawx;->zzr(Ljava/lang/Object;JJ)V

    .line 307
    .line 308
    .line 309
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    .line 310
    .line 311
    .line 312
    goto :goto_1

    .line 313
    :pswitch_13
    invoke-direct {p0, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 314
    .line 315
    .line 316
    move-result v1

    .line 317
    if-eqz v1, :cond_0

    .line 318
    .line 319
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 320
    .line 321
    .line 322
    move-result v1

    .line 323
    invoke-static {p1, v4, v5, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzq(Ljava/lang/Object;JI)V

    .line 324
    .line 325
    .line 326
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    .line 327
    .line 328
    .line 329
    goto :goto_1

    .line 330
    :pswitch_14
    invoke-direct {p0, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 331
    .line 332
    .line 333
    move-result v1

    .line 334
    if-eqz v1, :cond_0

    .line 335
    .line 336
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 337
    .line 338
    .line 339
    move-result-wide v1

    .line 340
    invoke-static {p1, v4, v5, v1, v2}, Lcom/google/android/libraries/places/internal/zzawx;->zzr(Ljava/lang/Object;JJ)V

    .line 341
    .line 342
    .line 343
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    .line 344
    .line 345
    .line 346
    goto :goto_1

    .line 347
    :pswitch_15
    invoke-direct {p0, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 348
    .line 349
    .line 350
    move-result v1

    .line 351
    if-eqz v1, :cond_0

    .line 352
    .line 353
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 354
    .line 355
    .line 356
    move-result-wide v1

    .line 357
    invoke-static {p1, v4, v5, v1, v2}, Lcom/google/android/libraries/places/internal/zzawx;->zzr(Ljava/lang/Object;JJ)V

    .line 358
    .line 359
    .line 360
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    .line 361
    .line 362
    .line 363
    goto :goto_1

    .line 364
    :pswitch_16
    invoke-direct {p0, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 365
    .line 366
    .line 367
    move-result v1

    .line 368
    if-eqz v1, :cond_0

    .line 369
    .line 370
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzb(Ljava/lang/Object;J)F

    .line 371
    .line 372
    .line 373
    move-result v1

    .line 374
    invoke-static {p1, v4, v5, v1}, Lcom/google/android/libraries/places/internal/zzawx;->zzp(Ljava/lang/Object;JF)V

    .line 375
    .line 376
    .line 377
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    .line 378
    .line 379
    .line 380
    goto :goto_1

    .line 381
    :pswitch_17
    invoke-direct {p0, p2, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzI(Ljava/lang/Object;I)Z

    .line 382
    .line 383
    .line 384
    move-result v1

    .line 385
    if-eqz v1, :cond_0

    .line 386
    .line 387
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zza(Ljava/lang/Object;J)D

    .line 388
    .line 389
    .line 390
    move-result-wide v1

    .line 391
    invoke-static {p1, v4, v5, v1, v2}, Lcom/google/android/libraries/places/internal/zzawx;->zzo(Ljava/lang/Object;JD)V

    .line 392
    .line 393
    .line 394
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    .line 395
    .line 396
    .line 397
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x3

    .line 398
    .line 399
    goto/16 :goto_0

    .line 400
    .line 401
    :cond_1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzn:Lcom/google/android/libraries/places/internal/zzawn;

    .line 402
    .line 403
    invoke-static {v0, p1, p2}, Lcom/google/android/libraries/places/internal/zzavv;->zzr(Lcom/google/android/libraries/places/internal/zzawn;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 404
    .line 405
    .line 406
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzh:Z

    .line 407
    .line 408
    if-eqz v0, :cond_2

    .line 409
    .line 410
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzo:Lcom/google/android/libraries/places/internal/zzatg;

    .line 411
    .line 412
    invoke-static {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzavv;->zzq(Lcom/google/android/libraries/places/internal/zzatg;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 413
    .line 414
    .line 415
    :cond_2
    return-void

    .line 416
    nop

    .line 417
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final zzf(Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzavs;Lcom/google/android/libraries/places/internal/zzatf;)V
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v4, p3

    .line 1
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    invoke-static/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzavi;->zzy(Ljava/lang/Object;)V

    iget-object v5, v1, Lcom/google/android/libraries/places/internal/zzavi;->zzn:Lcom/google/android/libraries/places/internal/zzawn;

    iget-object v0, v1, Lcom/google/android/libraries/places/internal/zzavi;->zzo:Lcom/google/android/libraries/places/internal/zzatg;

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 3
    :goto_0
    :try_start_0
    invoke-interface/range {p2 .. p2}, Lcom/google/android/libraries/places/internal/zzavs;->zzc()I

    move-result v2

    iget v3, v1, Lcom/google/android/libraries/places/internal/zzavi;->zze:I

    const/4 v9, 0x0

    const/4 v10, -0x1

    const/4 v11, 0x1

    if-lt v2, v3, :cond_2

    iget v3, v1, Lcom/google/android/libraries/places/internal/zzavi;->zzf:I

    if-gt v2, v3, :cond_2

    iget-object v3, v1, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    array-length v3, v3

    div-int/lit8 v3, v3, 0x3

    add-int/2addr v3, v10

    move v12, v9

    :goto_1
    if-gt v12, v3, :cond_2

    add-int v13, v3, v12

    ushr-int/2addr v13, v11

    mul-int/lit8 v14, v13, 0x3

    iget-object v15, v1, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 4
    aget v15, v15, v14
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v2, v15, :cond_0

    move v10, v14

    goto :goto_2

    :cond_0
    if-ge v2, v15, :cond_1

    add-int/lit8 v3, v13, -0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v12, v13, 0x1

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object/from16 v2, p1

    goto/16 :goto_16

    :cond_2
    :goto_2
    if-gez v10, :cond_a

    const v3, 0x7fffffff

    if-ne v2, v3, :cond_4

    iget v0, v1, Lcom/google/android/libraries/places/internal/zzavi;->zzk:I

    move-object v4, v6

    :goto_3
    iget v2, v1, Lcom/google/android/libraries/places/internal/zzavi;->zzl:I

    if-ge v0, v2, :cond_3

    iget-object v2, v1, Lcom/google/android/libraries/places/internal/zzavi;->zzj:[I

    .line 5
    aget v3, v2, v0

    move-object/from16 v6, p1

    move-object/from16 v2, p1

    .line 6
    invoke-direct/range {v1 .. v6}, Lcom/google/android/libraries/places/internal/zzavi;->zzt(Ljava/lang/Object;ILjava/lang/Object;Lcom/google/android/libraries/places/internal/zzawn;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v9, v1

    move-object v1, v2

    add-int/lit8 v0, v0, 0x1

    move-object v1, v9

    goto :goto_3

    :cond_3
    move-object/from16 v2, p1

    goto/16 :goto_15

    :cond_4
    move-object v9, v1

    move-object/from16 v1, p1

    .line 7
    :try_start_1
    iget-boolean v3, v9, Lcom/google/android/libraries/places/internal/zzavi;->zzh:Z

    if-nez v3, :cond_5

    const/4 v3, 0x0

    goto :goto_4

    .line 8
    :cond_5
    iget-object v3, v9, Lcom/google/android/libraries/places/internal/zzavi;->zzg:Lcom/google/android/libraries/places/internal/zzavf;

    .line 9
    invoke-virtual {v0, v4, v3, v2}, Lcom/google/android/libraries/places/internal/zzatg;->zzd(Lcom/google/android/libraries/places/internal/zzatf;Lcom/google/android/libraries/places/internal/zzavf;I)Ljava/lang/Object;

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    move-object v3, v2

    :goto_4
    if-eqz v3, :cond_7

    if-nez v7, :cond_6

    .line 10
    :try_start_2
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/internal/zzatg;->zzc(Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzatk;

    move-result-object v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_6
    move-object v2, v7

    move-object v7, v5

    move-object v5, v2

    move-object/from16 v2, p2

    goto :goto_5

    :catchall_1
    move-exception v0

    move-object v2, v1

    goto/16 :goto_9

    .line 11
    :goto_5
    :try_start_3
    invoke-virtual/range {v0 .. v7}, Lcom/google/android/libraries/places/internal/zzatg;->zze(Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzavs;Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzatf;Lcom/google/android/libraries/places/internal/zzatk;Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzawn;)Ljava/lang/Object;

    move-result-object v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    move-object v12, v7

    move-object v7, v5

    move-object v5, v12

    move-object v13, v0

    move-object v0, v2

    move-object v12, v4

    move-object v2, v1

    :goto_6
    move-object v1, v9

    move-object v4, v12

    move-object v0, v13

    goto/16 :goto_0

    :catchall_2
    move-exception v0

    move-object v2, v1

    move-object v5, v7

    goto :goto_9

    :cond_7
    move-object v13, v0

    move-object v2, v1

    move-object v12, v4

    move-object/from16 v0, p2

    .line 12
    :try_start_4
    invoke-virtual {v5, v0}, Lcom/google/android/libraries/places/internal/zzawn;->zzq(Lcom/google/android/libraries/places/internal/zzavs;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    if-nez v6, :cond_8

    .line 13
    :try_start_5
    invoke-virtual {v5, v2}, Lcom/google/android/libraries/places/internal/zzawn;->zzc(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    move-object v6, v1

    goto :goto_7

    :catchall_3
    move-exception v0

    goto :goto_9

    .line 14
    :cond_8
    :goto_7
    :try_start_6
    invoke-virtual {v5, v6, v0}, Lcom/google/android/libraries/places/internal/zzawn;->zzp(Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzavs;)Z

    move-result v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    if-nez v1, :cond_9

    iget v0, v9, Lcom/google/android/libraries/places/internal/zzavi;->zzk:I

    move-object v4, v6

    :goto_8
    iget v1, v9, Lcom/google/android/libraries/places/internal/zzavi;->zzl:I

    if-ge v0, v1, :cond_17

    iget-object v1, v9, Lcom/google/android/libraries/places/internal/zzavi;->zzj:[I

    .line 15
    aget v3, v1, v0

    move-object/from16 v6, p1

    move-object v1, v9

    .line 16
    invoke-direct/range {v1 .. v6}, Lcom/google/android/libraries/places/internal/zzavi;->zzt(Ljava/lang/Object;ILjava/lang/Object;Lcom/google/android/libraries/places/internal/zzawn;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v3, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_9
    move-object v3, v2

    goto :goto_6

    :catchall_4
    move-exception v0

    move-object v3, v2

    :goto_9
    move-object v1, v9

    goto/16 :goto_16

    :catchall_5
    move-exception v0

    move-object v3, v1

    move-object v1, v9

    :goto_a
    move-object v2, v3

    goto/16 :goto_16

    :cond_a
    move-object/from16 v3, p1

    move-object v13, v0

    move-object v12, v4

    move-object/from16 v0, p2

    .line 17
    :try_start_7
    invoke-direct {v1, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzp(I)I

    move-result v4
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_6

    :try_start_8
    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzavi;->zzo(I)I

    move-result v14
    :try_end_8
    .catch Lcom/google/android/libraries/places/internal/zzaue; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_7

    const v15, 0xfffff

    packed-switch v14, :pswitch_data_0

    if-nez v6, :cond_b

    .line 18
    :try_start_9
    invoke-virtual {v5, v3}, Lcom/google/android/libraries/places/internal/zzawn;->zzc(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_9
    .catch Lcom/google/android/libraries/places/internal/zzaue; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_6

    move-object v6, v2

    goto :goto_b

    :catchall_6
    move-exception v0

    goto :goto_a

    .line 19
    :cond_b
    :goto_b
    :try_start_a
    invoke-virtual {v5, v6, v0}, Lcom/google/android/libraries/places/internal/zzawn;->zzp(Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzavs;)Z

    move-result v2
    :try_end_a
    .catch Lcom/google/android/libraries/places/internal/zzaue; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_7

    if-nez v2, :cond_d

    iget v0, v1, Lcom/google/android/libraries/places/internal/zzavi;->zzk:I

    move-object v4, v6

    :goto_c
    iget v2, v1, Lcom/google/android/libraries/places/internal/zzavi;->zzl:I

    if-ge v0, v2, :cond_c

    iget-object v2, v1, Lcom/google/android/libraries/places/internal/zzavi;->zzj:[I

    .line 20
    aget v2, v2, v0

    move-object/from16 v6, p1

    move-object/from16 v17, v3

    move v3, v2

    move-object/from16 v2, v17

    .line 21
    invoke-direct/range {v1 .. v6}, Lcom/google/android/libraries/places/internal/zzavi;->zzt(Ljava/lang/Object;ILjava/lang/Object;Lcom/google/android/libraries/places/internal/zzawn;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v14, v1

    move-object v1, v2

    add-int/lit8 v0, v0, 0x1

    move-object v3, v1

    move-object v1, v14

    goto :goto_c

    :cond_c
    move-object v2, v3

    goto/16 :goto_15

    :cond_d
    move-object v14, v1

    move-object v1, v3

    :goto_d
    move-object v4, v12

    move-object v0, v13

    move-object v1, v14

    goto/16 :goto_0

    :catchall_7
    move-exception v0

    move-object v14, v1

    move-object v1, v3

    :goto_e
    move-object v2, v1

    move-object v1, v14

    goto/16 :goto_16

    :catch_0
    move-object v14, v1

    move-object v1, v3

    :catch_1
    const/16 v16, 0x0

    goto/16 :goto_13

    :pswitch_0
    move-object v14, v1

    move-object v1, v3

    .line 22
    :try_start_b
    invoke-direct {v14, v1, v2, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzw(Ljava/lang/Object;II)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/libraries/places/internal/zzavf;

    .line 23
    invoke-direct {v14, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    move-result-object v4

    .line 24
    invoke-interface {v0, v3, v4, v12}, Lcom/google/android/libraries/places/internal/zzavs;->zzt(Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzavt;Lcom/google/android/libraries/places/internal/zzatf;)V

    .line 25
    invoke-direct {v14, v1, v2, v10, v3}, Lcom/google/android/libraries/places/internal/zzavi;->zzF(Ljava/lang/Object;IILjava/lang/Object;)V

    const/16 v16, 0x0

    goto :goto_d

    :pswitch_1
    move-object v14, v1

    move-object v1, v3

    and-int v3, v4, v15

    .line 26
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzn()J

    move-result-wide v15

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4
    :try_end_b
    .catch Lcom/google/android/libraries/places/internal/zzaue; {:try_start_b .. :try_end_b} :catch_1
    .catchall {:try_start_b .. :try_end_b} :catchall_9

    const/16 v16, 0x0

    int-to-long v8, v3

    .line 27
    :try_start_c
    invoke-static {v1, v8, v9, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 28
    invoke-direct {v14, v1, v2, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    goto :goto_d

    :pswitch_2
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v3, v4, v15

    .line 29
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzi()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    int-to-long v8, v3

    .line 30
    invoke-static {v1, v8, v9, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 31
    invoke-direct {v14, v1, v2, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    goto :goto_d

    :pswitch_3
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v3, v4, v15

    .line 32
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzm()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    int-to-long v8, v3

    .line 33
    invoke-static {v1, v8, v9, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 34
    invoke-direct {v14, v1, v2, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    goto :goto_d

    :pswitch_4
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v3, v4, v15

    .line 35
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzh()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    int-to-long v8, v3

    .line 36
    invoke-static {v1, v8, v9, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 37
    invoke-direct {v14, v1, v2, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    goto :goto_d

    :pswitch_5
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    .line 38
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zze()I

    move-result v3

    .line 39
    invoke-direct {v14, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzr(I)Lcom/google/android/libraries/places/internal/zzaty;

    move-result-object v8

    if-eqz v8, :cond_f

    invoke-interface {v8, v3}, Lcom/google/android/libraries/places/internal/zzaty;->zza(I)Z

    move-result v8

    if-eqz v8, :cond_e

    goto :goto_f

    .line 40
    :cond_e
    invoke-static {v1, v2, v3, v6, v5}, Lcom/google/android/libraries/places/internal/zzavv;->zzp(Ljava/lang/Object;IILjava/lang/Object;Lcom/google/android/libraries/places/internal/zzawn;)Ljava/lang/Object;

    move-result-object v6

    goto/16 :goto_d

    :cond_f
    :goto_f
    and-int/2addr v4, v15

    .line 41
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    int-to-long v8, v4

    invoke-static {v1, v8, v9, v3}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 42
    invoke-direct {v14, v1, v2, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_6
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v3, v4, v15

    .line 43
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzj()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    int-to-long v8, v3

    .line 44
    invoke-static {v1, v8, v9, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 45
    invoke-direct {v14, v1, v2, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_7
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v3, v4, v15

    .line 46
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzp()Lcom/google/android/libraries/places/internal/zzask;

    move-result-object v4

    int-to-long v8, v3

    invoke-static {v1, v8, v9, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 47
    invoke-direct {v14, v1, v2, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_8
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    .line 48
    invoke-direct {v14, v1, v2, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzw(Ljava/lang/Object;II)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/libraries/places/internal/zzavf;

    .line 49
    invoke-direct {v14, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    move-result-object v4

    .line 50
    invoke-interface {v0, v3, v4, v12}, Lcom/google/android/libraries/places/internal/zzavs;->zzu(Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzavt;Lcom/google/android/libraries/places/internal/zzatf;)V

    .line 51
    invoke-direct {v14, v1, v2, v10, v3}, Lcom/google/android/libraries/places/internal/zzavi;->zzF(Ljava/lang/Object;IILjava/lang/Object;)V

    goto/16 :goto_d

    :pswitch_9
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    .line 52
    invoke-direct {v14, v1, v4, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzB(Ljava/lang/Object;ILcom/google/android/libraries/places/internal/zzavs;)V

    .line 53
    invoke-direct {v14, v1, v2, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_a
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v3, v4, v15

    .line 54
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzN()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    int-to-long v8, v3

    .line 55
    invoke-static {v1, v8, v9, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 56
    invoke-direct {v14, v1, v2, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_b
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v3, v4, v15

    .line 57
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzf()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    int-to-long v8, v3

    .line 58
    invoke-static {v1, v8, v9, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 59
    invoke-direct {v14, v1, v2, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_c
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v3, v4, v15

    .line 60
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzk()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    int-to-long v8, v3

    .line 61
    invoke-static {v1, v8, v9, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 62
    invoke-direct {v14, v1, v2, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_d
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v3, v4, v15

    .line 63
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzg()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    int-to-long v8, v3

    .line 64
    invoke-static {v1, v8, v9, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 65
    invoke-direct {v14, v1, v2, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_e
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v3, v4, v15

    .line 66
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzo()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    int-to-long v8, v3

    .line 67
    invoke-static {v1, v8, v9, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 68
    invoke-direct {v14, v1, v2, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_f
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v3, v4, v15

    .line 69
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzl()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    int-to-long v8, v3

    .line 70
    invoke-static {v1, v8, v9, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 71
    invoke-direct {v14, v1, v2, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_10
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v3, v4, v15

    .line 72
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzb()F

    move-result v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    int-to-long v8, v3

    .line 73
    invoke-static {v1, v8, v9, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 74
    invoke-direct {v14, v1, v2, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_11
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v3, v4, v15

    .line 75
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zza()D

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    int-to-long v8, v3

    .line 76
    invoke-static {v1, v8, v9, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 77
    invoke-direct {v14, v1, v2, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzD(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_12
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    .line 78
    invoke-direct {v14, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzu(I)Ljava/lang/Object;

    move-result-object v2

    .line 79
    invoke-direct {v14, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzp(I)I

    move-result v3

    and-int/2addr v3, v15

    int-to-long v3, v3

    .line 80
    invoke-static {v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_10

    .line 81
    move-object v9, v8

    check-cast v9, Lcom/google/android/libraries/places/internal/zzauz;

    invoke-virtual {v9}, Lcom/google/android/libraries/places/internal/zzauz;->zze()Z

    move-result v9

    if-nez v9, :cond_11

    invoke-static {}, Lcom/google/android/libraries/places/internal/zzauz;->zza()Lcom/google/android/libraries/places/internal/zzauz;

    move-result-object v9

    .line 82
    invoke-virtual {v9}, Lcom/google/android/libraries/places/internal/zzauz;->zzb()Lcom/google/android/libraries/places/internal/zzauz;

    move-result-object v9

    .line 83
    invoke-static {v9, v8}, Lcom/google/android/libraries/places/internal/zzava;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    invoke-static {v1, v3, v4, v9}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    move-object v8, v9

    goto :goto_10

    .line 85
    :cond_10
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzauz;->zza()Lcom/google/android/libraries/places/internal/zzauz;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/android/libraries/places/internal/zzauz;->zzb()Lcom/google/android/libraries/places/internal/zzauz;

    move-result-object v8

    .line 86
    invoke-static {v1, v3, v4, v8}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 87
    :cond_11
    :goto_10
    check-cast v8, Lcom/google/android/libraries/places/internal/zzauz;

    .line 88
    check-cast v2, Lcom/google/android/libraries/places/internal/zzauy;

    .line 89
    throw v16

    :pswitch_13
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v2, v4, v15

    .line 90
    invoke-direct {v14, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    move-result-object v3

    iget-object v4, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    int-to-long v8, v2

    .line 91
    invoke-virtual {v4, v1, v8, v9}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 92
    invoke-interface {v0, v2, v3, v12}, Lcom/google/android/libraries/places/internal/zzavs;->zzC(Ljava/util/List;Lcom/google/android/libraries/places/internal/zzavt;Lcom/google/android/libraries/places/internal/zzatf;)V

    goto/16 :goto_d

    :pswitch_14
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    .line 93
    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 94
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 95
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzJ(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_15
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 96
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 97
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzI(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_16
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 98
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 99
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzH(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_17
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 100
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 101
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzG(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_18
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v3, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int/2addr v4, v15

    int-to-long v8, v4

    .line 102
    invoke-virtual {v3, v1, v8, v9}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v3

    .line 103
    invoke-interface {v0, v3}, Lcom/google/android/libraries/places/internal/zzavs;->zzy(Ljava/util/List;)V

    .line 104
    invoke-direct {v14, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzr(I)Lcom/google/android/libraries/places/internal/zzaty;

    move-result-object v4
    :try_end_c
    .catch Lcom/google/android/libraries/places/internal/zzaue; {:try_start_c .. :try_end_c} :catch_3
    .catchall {:try_start_c .. :try_end_c} :catchall_9

    move-object/from16 v17, v6

    move-object v6, v5

    move-object/from16 v5, v17

    .line 105
    :try_start_d
    invoke-static/range {v1 .. v6}, Lcom/google/android/libraries/places/internal/zzavv;->zzo(Ljava/lang/Object;ILjava/util/List;Lcom/google/android/libraries/places/internal/zzaty;Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzawn;)Ljava/lang/Object;

    move-result-object v2
    :try_end_d
    .catch Lcom/google/android/libraries/places/internal/zzaue; {:try_start_d .. :try_end_d} :catch_2
    .catchall {:try_start_d .. :try_end_d} :catchall_8

    move-object v5, v6

    :goto_11
    move-object v6, v2

    goto/16 :goto_d

    :catchall_8
    move-exception v0

    move-object/from16 v17, v6

    move-object v6, v5

    move-object/from16 v5, v17

    goto/16 :goto_e

    :catch_2
    move-object/from16 v17, v6

    move-object v6, v5

    move-object/from16 v5, v17

    goto/16 :goto_13

    :pswitch_19
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    :try_start_e
    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 106
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 107
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzL(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_1a
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 108
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 109
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzv(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_1b
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 110
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 111
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzz(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_1c
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 112
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 113
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzA(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_1d
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 114
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 115
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzD(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_1e
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 116
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 117
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzM(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_1f
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 118
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 119
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzE(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_20
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 120
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 121
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzB(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_21
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 122
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 123
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzx(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_22
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 124
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 125
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzJ(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_23
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 126
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 127
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzI(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_24
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 128
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 129
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzH(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_25
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 130
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 131
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzG(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_26
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v3, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int/2addr v4, v15

    int-to-long v8, v4

    .line 132
    invoke-virtual {v3, v1, v8, v9}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v3

    .line 133
    invoke-interface {v0, v3}, Lcom/google/android/libraries/places/internal/zzavs;->zzy(Ljava/util/List;)V

    .line 134
    invoke-direct {v14, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzr(I)Lcom/google/android/libraries/places/internal/zzaty;

    move-result-object v4
    :try_end_e
    .catch Lcom/google/android/libraries/places/internal/zzaue; {:try_start_e .. :try_end_e} :catch_3
    .catchall {:try_start_e .. :try_end_e} :catchall_9

    move-object/from16 v17, v6

    move-object v6, v5

    move-object/from16 v5, v17

    .line 135
    :try_start_f
    invoke-static/range {v1 .. v6}, Lcom/google/android/libraries/places/internal/zzavv;->zzo(Ljava/lang/Object;ILjava/util/List;Lcom/google/android/libraries/places/internal/zzaty;Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzawn;)Ljava/lang/Object;

    move-result-object v2
    :try_end_f
    .catch Lcom/google/android/libraries/places/internal/zzaue; {:try_start_f .. :try_end_f} :catch_2
    .catchall {:try_start_f .. :try_end_f} :catchall_8

    move-object v5, v6

    goto/16 :goto_11

    :pswitch_27
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    :try_start_10
    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 136
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 137
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzL(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_28
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 138
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 139
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzw(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_29
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    .line 140
    invoke-direct {v14, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    move-result-object v2

    and-int v3, v4, v15

    iget-object v4, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    int-to-long v8, v3

    .line 141
    invoke-virtual {v4, v1, v8, v9}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v3

    .line 142
    invoke-interface {v0, v3, v2, v12}, Lcom/google/android/libraries/places/internal/zzavs;->zzF(Ljava/util/List;Lcom/google/android/libraries/places/internal/zzavt;Lcom/google/android/libraries/places/internal/zzatf;)V

    goto/16 :goto_d

    :pswitch_2a
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    .line 143
    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzavi;->zzH(I)Z

    move-result v2
    :try_end_10
    .catch Lcom/google/android/libraries/places/internal/zzaue; {:try_start_10 .. :try_end_10} :catch_3
    .catchall {:try_start_10 .. :try_end_10} :catchall_9

    .line 144
    iget-object v3, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    if-eqz v2, :cond_12

    and-int v2, v4, v15

    int-to-long v8, v2

    .line 145
    :try_start_11
    invoke-virtual {v3, v1, v8, v9}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    move-object v3, v0

    check-cast v3, Lcom/google/android/libraries/places/internal/zzasr;

    .line 146
    invoke-virtual {v3, v2, v11}, Lcom/google/android/libraries/places/internal/zzasr;->zzK(Ljava/util/List;Z)V

    goto/16 :goto_d

    :cond_12
    and-int v2, v4, v15

    int-to-long v10, v2

    .line 147
    invoke-virtual {v3, v1, v10, v11}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    move-object v3, v0

    check-cast v3, Lcom/google/android/libraries/places/internal/zzasr;

    .line 148
    invoke-virtual {v3, v2, v9}, Lcom/google/android/libraries/places/internal/zzasr;->zzK(Ljava/util/List;Z)V

    goto/16 :goto_d

    :pswitch_2b
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    .line 149
    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 150
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 151
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzv(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_2c
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 152
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 153
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzz(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_2d
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 154
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 155
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzA(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_2e
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 156
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 157
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzD(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_2f
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 158
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 159
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzM(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_30
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 160
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 161
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzE(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_31
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 162
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 163
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzB(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_32
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzm:Lcom/google/android/libraries/places/internal/zzaut;

    and-int v3, v4, v15

    int-to-long v3, v3

    .line 164
    invoke-virtual {v2, v1, v3, v4}, Lcom/google/android/libraries/places/internal/zzaut;->zza(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 165
    invoke-interface {v0, v2}, Lcom/google/android/libraries/places/internal/zzavs;->zzx(Ljava/util/List;)V

    goto/16 :goto_d

    :pswitch_33
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    .line 166
    invoke-direct {v14, v1, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzv(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/libraries/places/internal/zzavf;

    .line 167
    invoke-direct {v14, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    move-result-object v3

    .line 168
    invoke-interface {v0, v2, v3, v12}, Lcom/google/android/libraries/places/internal/zzavs;->zzt(Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzavt;Lcom/google/android/libraries/places/internal/zzatf;)V

    .line 169
    invoke-direct {v14, v1, v10, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzE(Ljava/lang/Object;ILjava/lang/Object;)V

    goto/16 :goto_d

    :pswitch_34
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v2, v4, v15

    .line 170
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzn()J

    move-result-wide v3

    int-to-long v8, v2

    invoke-static {v1, v8, v9, v3, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzr(Ljava/lang/Object;JJ)V

    .line 171
    invoke-direct {v14, v1, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    goto/16 :goto_d

    :pswitch_35
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v2, v4, v15

    .line 172
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzi()I

    move-result v3

    int-to-long v8, v2

    invoke-static {v1, v8, v9, v3}, Lcom/google/android/libraries/places/internal/zzawx;->zzq(Ljava/lang/Object;JI)V

    .line 173
    invoke-direct {v14, v1, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    goto/16 :goto_d

    :pswitch_36
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v2, v4, v15

    .line 174
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzm()J

    move-result-wide v3

    int-to-long v8, v2

    invoke-static {v1, v8, v9, v3, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzr(Ljava/lang/Object;JJ)V

    .line 175
    invoke-direct {v14, v1, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    goto/16 :goto_d

    :pswitch_37
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v2, v4, v15

    .line 176
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzh()I

    move-result v3

    int-to-long v8, v2

    invoke-static {v1, v8, v9, v3}, Lcom/google/android/libraries/places/internal/zzawx;->zzq(Ljava/lang/Object;JI)V

    .line 177
    invoke-direct {v14, v1, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    goto/16 :goto_d

    :pswitch_38
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    .line 178
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zze()I

    move-result v3

    .line 179
    invoke-direct {v14, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzr(I)Lcom/google/android/libraries/places/internal/zzaty;

    move-result-object v8

    if-eqz v8, :cond_14

    invoke-interface {v8, v3}, Lcom/google/android/libraries/places/internal/zzaty;->zza(I)Z

    move-result v8

    if-eqz v8, :cond_13

    goto :goto_12

    .line 180
    :cond_13
    invoke-static {v1, v2, v3, v6, v5}, Lcom/google/android/libraries/places/internal/zzavv;->zzp(Ljava/lang/Object;IILjava/lang/Object;Lcom/google/android/libraries/places/internal/zzawn;)Ljava/lang/Object;

    move-result-object v6

    goto/16 :goto_d

    :cond_14
    :goto_12
    and-int v2, v4, v15

    int-to-long v8, v2

    .line 181
    invoke-static {v1, v8, v9, v3}, Lcom/google/android/libraries/places/internal/zzawx;->zzq(Ljava/lang/Object;JI)V

    .line 182
    invoke-direct {v14, v1, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    goto/16 :goto_d

    :pswitch_39
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v2, v4, v15

    .line 183
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzj()I

    move-result v3

    int-to-long v8, v2

    invoke-static {v1, v8, v9, v3}, Lcom/google/android/libraries/places/internal/zzawx;->zzq(Ljava/lang/Object;JI)V

    .line 184
    invoke-direct {v14, v1, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    goto/16 :goto_d

    :pswitch_3a
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v2, v4, v15

    .line 185
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzp()Lcom/google/android/libraries/places/internal/zzask;

    move-result-object v3

    int-to-long v8, v2

    invoke-static {v1, v8, v9, v3}, Lcom/google/android/libraries/places/internal/zzawx;->zzs(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 186
    invoke-direct {v14, v1, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    goto/16 :goto_d

    :pswitch_3b
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    .line 187
    invoke-direct {v14, v1, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzv(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/libraries/places/internal/zzavf;

    .line 188
    invoke-direct {v14, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    move-result-object v3

    .line 189
    invoke-interface {v0, v2, v3, v12}, Lcom/google/android/libraries/places/internal/zzavs;->zzu(Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzavt;Lcom/google/android/libraries/places/internal/zzatf;)V

    .line 190
    invoke-direct {v14, v1, v10, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzE(Ljava/lang/Object;ILjava/lang/Object;)V

    goto/16 :goto_d

    :pswitch_3c
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    .line 191
    invoke-direct {v14, v1, v4, v0}, Lcom/google/android/libraries/places/internal/zzavi;->zzB(Ljava/lang/Object;ILcom/google/android/libraries/places/internal/zzavs;)V

    .line 192
    invoke-direct {v14, v1, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    goto/16 :goto_d

    :pswitch_3d
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v2, v4, v15

    .line 193
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzN()Z

    move-result v3

    int-to-long v8, v2

    invoke-static {v1, v8, v9, v3}, Lcom/google/android/libraries/places/internal/zzawx;->zzm(Ljava/lang/Object;JZ)V

    .line 194
    invoke-direct {v14, v1, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    goto/16 :goto_d

    :pswitch_3e
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v2, v4, v15

    .line 195
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzf()I

    move-result v3

    int-to-long v8, v2

    invoke-static {v1, v8, v9, v3}, Lcom/google/android/libraries/places/internal/zzawx;->zzq(Ljava/lang/Object;JI)V

    .line 196
    invoke-direct {v14, v1, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    goto/16 :goto_d

    :pswitch_3f
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v2, v4, v15

    .line 197
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzk()J

    move-result-wide v3

    int-to-long v8, v2

    invoke-static {v1, v8, v9, v3, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzr(Ljava/lang/Object;JJ)V

    .line 198
    invoke-direct {v14, v1, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    goto/16 :goto_d

    :pswitch_40
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v2, v4, v15

    .line 199
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzg()I

    move-result v3

    int-to-long v8, v2

    invoke-static {v1, v8, v9, v3}, Lcom/google/android/libraries/places/internal/zzawx;->zzq(Ljava/lang/Object;JI)V

    .line 200
    invoke-direct {v14, v1, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    goto/16 :goto_d

    :pswitch_41
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v2, v4, v15

    .line 201
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzo()J

    move-result-wide v3

    int-to-long v8, v2

    invoke-static {v1, v8, v9, v3, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzr(Ljava/lang/Object;JJ)V

    .line 202
    invoke-direct {v14, v1, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    goto/16 :goto_d

    :pswitch_42
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v2, v4, v15

    .line 203
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzl()J

    move-result-wide v3

    int-to-long v8, v2

    invoke-static {v1, v8, v9, v3, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzr(Ljava/lang/Object;JJ)V

    .line 204
    invoke-direct {v14, v1, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    goto/16 :goto_d

    :pswitch_43
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v2, v4, v15

    .line 205
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zzb()F

    move-result v3

    int-to-long v8, v2

    invoke-static {v1, v8, v9, v3}, Lcom/google/android/libraries/places/internal/zzawx;->zzp(Ljava/lang/Object;JF)V

    .line 206
    invoke-direct {v14, v1, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V

    goto/16 :goto_d

    :pswitch_44
    move-object v14, v1

    move-object v1, v3

    const/16 v16, 0x0

    and-int v2, v4, v15

    .line 207
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavs;->zza()D

    move-result-wide v3

    int-to-long v8, v2

    invoke-static {v1, v8, v9, v3, v4}, Lcom/google/android/libraries/places/internal/zzawx;->zzo(Ljava/lang/Object;JD)V

    .line 208
    invoke-direct {v14, v1, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzC(Ljava/lang/Object;I)V
    :try_end_11
    .catch Lcom/google/android/libraries/places/internal/zzaue; {:try_start_11 .. :try_end_11} :catch_3
    .catchall {:try_start_11 .. :try_end_11} :catchall_9

    goto/16 :goto_d

    .line 209
    :catch_3
    :goto_13
    :try_start_12
    invoke-virtual {v5, v0}, Lcom/google/android/libraries/places/internal/zzawn;->zzq(Lcom/google/android/libraries/places/internal/zzavs;)Z

    if-nez v6, :cond_15

    .line 210
    invoke-virtual {v5, v1}, Lcom/google/android/libraries/places/internal/zzawn;->zzc(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v6, v2

    .line 211
    :cond_15
    invoke-virtual {v5, v6, v0}, Lcom/google/android/libraries/places/internal/zzawn;->zzp(Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzavs;)Z

    move-result v2
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_9

    if-nez v2, :cond_19

    iget v0, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzk:I

    move-object v4, v6

    :goto_14
    iget v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzl:I

    if-ge v0, v2, :cond_16

    iget-object v2, v14, Lcom/google/android/libraries/places/internal/zzavi;->zzj:[I

    .line 212
    aget v3, v2, v0

    move-object/from16 v6, p1

    move-object v2, v1

    move-object v1, v14

    .line 213
    invoke-direct/range {v1 .. v6}, Lcom/google/android/libraries/places/internal/zzavi;->zzt(Ljava/lang/Object;ILjava/lang/Object;Lcom/google/android/libraries/places/internal/zzawn;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v0, v0, 0x1

    move-object v1, v2

    goto :goto_14

    :cond_16
    move-object v2, v1

    :cond_17
    :goto_15
    if-eqz v4, :cond_18

    .line 214
    invoke-virtual {v5, v2, v4}, Lcom/google/android/libraries/places/internal/zzawn;->zzn(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_18
    return-void

    :cond_19
    move-object v2, v1

    goto/16 :goto_d

    :catchall_9
    move-exception v0

    goto/16 :goto_e

    .line 215
    :goto_16
    iget v3, v1, Lcom/google/android/libraries/places/internal/zzavi;->zzk:I

    move v7, v3

    move-object v4, v6

    :goto_17
    iget v3, v1, Lcom/google/android/libraries/places/internal/zzavi;->zzl:I

    if-ge v7, v3, :cond_1a

    iget-object v3, v1, Lcom/google/android/libraries/places/internal/zzavi;->zzj:[I

    .line 216
    aget v3, v3, v7

    move-object/from16 v6, p1

    .line 217
    invoke-direct/range {v1 .. v6}, Lcom/google/android/libraries/places/internal/zzavi;->zzt(Ljava/lang/Object;ILjava/lang/Object;Lcom/google/android/libraries/places/internal/zzawn;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v1, v2

    add-int/lit8 v7, v7, 0x1

    move-object/from16 v1, p0

    goto :goto_17

    :cond_1a
    move-object v1, v2

    if-eqz v4, :cond_1b

    .line 218
    invoke-virtual {v5, v1, v4}, Lcom/google/android/libraries/places/internal/zzawn;->zzn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 219
    :cond_1b
    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final zzg(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 4
    .line 5
    array-length v2, v2

    .line 6
    if-ge v1, v2, :cond_2

    .line 7
    .line 8
    invoke-direct {p0, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzp(I)I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const v3, 0xfffff

    .line 13
    .line 14
    .line 15
    and-int v4, v2, v3

    .line 16
    .line 17
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzo(I)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    int-to-long v4, v4

    .line 22
    packed-switch v2, :pswitch_data_0

    .line 23
    .line 24
    .line 25
    goto/16 :goto_2

    .line 26
    .line 27
    :pswitch_0
    invoke-direct {p0, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzn(I)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    and-int/2addr v2, v3

    .line 32
    int-to-long v2, v2

    .line 33
    invoke-static {p1, v2, v3}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    invoke-static {p2, v2, v3}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-ne v6, v2, :cond_1

    .line 42
    .line 43
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzavv;->zzt(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_0

    .line 56
    .line 57
    goto/16 :goto_3

    .line 58
    .line 59
    :pswitch_1
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzavv;->zzt(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    goto :goto_1

    .line 72
    :pswitch_2
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzavv;->zzt(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    :goto_1
    if-nez v2, :cond_0

    .line 85
    .line 86
    goto/16 :goto_3

    .line 87
    .line 88
    :pswitch_3
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzG(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    if-eqz v2, :cond_1

    .line 93
    .line 94
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzavv;->zzt(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    if-eqz v2, :cond_1

    .line 107
    .line 108
    goto/16 :goto_2

    .line 109
    .line 110
    :pswitch_4
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzG(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    if-eqz v2, :cond_1

    .line 115
    .line 116
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 117
    .line 118
    .line 119
    move-result-wide v2

    .line 120
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 121
    .line 122
    .line 123
    move-result-wide v4

    .line 124
    cmp-long v2, v2, v4

    .line 125
    .line 126
    if-nez v2, :cond_1

    .line 127
    .line 128
    goto/16 :goto_2

    .line 129
    .line 130
    :pswitch_5
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzG(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    if-eqz v2, :cond_1

    .line 135
    .line 136
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    if-ne v2, v3, :cond_1

    .line 145
    .line 146
    goto/16 :goto_2

    .line 147
    .line 148
    :pswitch_6
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzG(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    if-eqz v2, :cond_1

    .line 153
    .line 154
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 155
    .line 156
    .line 157
    move-result-wide v2

    .line 158
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 159
    .line 160
    .line 161
    move-result-wide v4

    .line 162
    cmp-long v2, v2, v4

    .line 163
    .line 164
    if-nez v2, :cond_1

    .line 165
    .line 166
    goto/16 :goto_2

    .line 167
    .line 168
    :pswitch_7
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzG(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 169
    .line 170
    .line 171
    move-result v2

    .line 172
    if-eqz v2, :cond_1

    .line 173
    .line 174
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 175
    .line 176
    .line 177
    move-result v2

    .line 178
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 179
    .line 180
    .line 181
    move-result v3

    .line 182
    if-ne v2, v3, :cond_1

    .line 183
    .line 184
    goto/16 :goto_2

    .line 185
    .line 186
    :pswitch_8
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzG(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 187
    .line 188
    .line 189
    move-result v2

    .line 190
    if-eqz v2, :cond_1

    .line 191
    .line 192
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 197
    .line 198
    .line 199
    move-result v3

    .line 200
    if-ne v2, v3, :cond_1

    .line 201
    .line 202
    goto/16 :goto_2

    .line 203
    .line 204
    :pswitch_9
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzG(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 205
    .line 206
    .line 207
    move-result v2

    .line 208
    if-eqz v2, :cond_1

    .line 209
    .line 210
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 211
    .line 212
    .line 213
    move-result v2

    .line 214
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 215
    .line 216
    .line 217
    move-result v3

    .line 218
    if-ne v2, v3, :cond_1

    .line 219
    .line 220
    goto/16 :goto_2

    .line 221
    .line 222
    :pswitch_a
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzG(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    if-eqz v2, :cond_1

    .line 227
    .line 228
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object v3

    .line 236
    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzavv;->zzt(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    move-result v2

    .line 240
    if-eqz v2, :cond_1

    .line 241
    .line 242
    goto/16 :goto_2

    .line 243
    .line 244
    :pswitch_b
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzG(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 245
    .line 246
    .line 247
    move-result v2

    .line 248
    if-eqz v2, :cond_1

    .line 249
    .line 250
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object v3

    .line 258
    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzavv;->zzt(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    move-result v2

    .line 262
    if-eqz v2, :cond_1

    .line 263
    .line 264
    goto/16 :goto_2

    .line 265
    .line 266
    :pswitch_c
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzG(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 267
    .line 268
    .line 269
    move-result v2

    .line 270
    if-eqz v2, :cond_1

    .line 271
    .line 272
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    move-result-object v2

    .line 276
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 277
    .line 278
    .line 279
    move-result-object v3

    .line 280
    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzavv;->zzt(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    move-result v2

    .line 284
    if-eqz v2, :cond_1

    .line 285
    .line 286
    goto/16 :goto_2

    .line 287
    .line 288
    :pswitch_d
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzG(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 289
    .line 290
    .line 291
    move-result v2

    .line 292
    if-eqz v2, :cond_1

    .line 293
    .line 294
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzw(Ljava/lang/Object;J)Z

    .line 295
    .line 296
    .line 297
    move-result v2

    .line 298
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzw(Ljava/lang/Object;J)Z

    .line 299
    .line 300
    .line 301
    move-result v3

    .line 302
    if-ne v2, v3, :cond_1

    .line 303
    .line 304
    goto/16 :goto_2

    .line 305
    .line 306
    :pswitch_e
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzG(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 307
    .line 308
    .line 309
    move-result v2

    .line 310
    if-eqz v2, :cond_1

    .line 311
    .line 312
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 313
    .line 314
    .line 315
    move-result v2

    .line 316
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 317
    .line 318
    .line 319
    move-result v3

    .line 320
    if-ne v2, v3, :cond_1

    .line 321
    .line 322
    goto/16 :goto_2

    .line 323
    .line 324
    :pswitch_f
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzG(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 325
    .line 326
    .line 327
    move-result v2

    .line 328
    if-eqz v2, :cond_1

    .line 329
    .line 330
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 331
    .line 332
    .line 333
    move-result-wide v2

    .line 334
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 335
    .line 336
    .line 337
    move-result-wide v4

    .line 338
    cmp-long v2, v2, v4

    .line 339
    .line 340
    if-nez v2, :cond_1

    .line 341
    .line 342
    goto :goto_2

    .line 343
    :pswitch_10
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzG(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 344
    .line 345
    .line 346
    move-result v2

    .line 347
    if-eqz v2, :cond_1

    .line 348
    .line 349
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 350
    .line 351
    .line 352
    move-result v2

    .line 353
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzc(Ljava/lang/Object;J)I

    .line 354
    .line 355
    .line 356
    move-result v3

    .line 357
    if-ne v2, v3, :cond_1

    .line 358
    .line 359
    goto :goto_2

    .line 360
    :pswitch_11
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzG(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 361
    .line 362
    .line 363
    move-result v2

    .line 364
    if-eqz v2, :cond_1

    .line 365
    .line 366
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 367
    .line 368
    .line 369
    move-result-wide v2

    .line 370
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 371
    .line 372
    .line 373
    move-result-wide v4

    .line 374
    cmp-long v2, v2, v4

    .line 375
    .line 376
    if-nez v2, :cond_1

    .line 377
    .line 378
    goto :goto_2

    .line 379
    :pswitch_12
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzG(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 380
    .line 381
    .line 382
    move-result v2

    .line 383
    if-eqz v2, :cond_1

    .line 384
    .line 385
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 386
    .line 387
    .line 388
    move-result-wide v2

    .line 389
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzd(Ljava/lang/Object;J)J

    .line 390
    .line 391
    .line 392
    move-result-wide v4

    .line 393
    cmp-long v2, v2, v4

    .line 394
    .line 395
    if-nez v2, :cond_1

    .line 396
    .line 397
    goto :goto_2

    .line 398
    :pswitch_13
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzG(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 399
    .line 400
    .line 401
    move-result v2

    .line 402
    if-eqz v2, :cond_1

    .line 403
    .line 404
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzb(Ljava/lang/Object;J)F

    .line 405
    .line 406
    .line 407
    move-result v2

    .line 408
    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 409
    .line 410
    .line 411
    move-result v2

    .line 412
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zzb(Ljava/lang/Object;J)F

    .line 413
    .line 414
    .line 415
    move-result v3

    .line 416
    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 417
    .line 418
    .line 419
    move-result v3

    .line 420
    if-ne v2, v3, :cond_1

    .line 421
    .line 422
    goto :goto_2

    .line 423
    :pswitch_14
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/libraries/places/internal/zzavi;->zzG(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 424
    .line 425
    .line 426
    move-result v2

    .line 427
    if-eqz v2, :cond_1

    .line 428
    .line 429
    invoke-static {p1, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zza(Ljava/lang/Object;J)D

    .line 430
    .line 431
    .line 432
    move-result-wide v2

    .line 433
    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 434
    .line 435
    .line 436
    move-result-wide v2

    .line 437
    invoke-static {p2, v4, v5}, Lcom/google/android/libraries/places/internal/zzawx;->zza(Ljava/lang/Object;J)D

    .line 438
    .line 439
    .line 440
    move-result-wide v4

    .line 441
    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 442
    .line 443
    .line 444
    move-result-wide v4

    .line 445
    cmp-long v2, v2, v4

    .line 446
    .line 447
    if-nez v2, :cond_1

    .line 448
    .line 449
    :cond_0
    :goto_2
    add-int/lit8 v1, v1, 0x3

    .line 450
    .line 451
    goto/16 :goto_0

    .line 452
    .line 453
    :cond_1
    :goto_3
    return v0

    .line 454
    :cond_2
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzn:Lcom/google/android/libraries/places/internal/zzawn;

    .line 455
    .line 456
    invoke-virtual {v1, p1}, Lcom/google/android/libraries/places/internal/zzawn;->zzd(Ljava/lang/Object;)Ljava/lang/Object;

    .line 457
    .line 458
    .line 459
    move-result-object v1

    .line 460
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzn:Lcom/google/android/libraries/places/internal/zzawn;

    .line 461
    .line 462
    invoke-virtual {v2, p2}, Lcom/google/android/libraries/places/internal/zzawn;->zzd(Ljava/lang/Object;)Ljava/lang/Object;

    .line 463
    .line 464
    .line 465
    move-result-object v2

    .line 466
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 467
    .line 468
    .line 469
    move-result v1

    .line 470
    if-nez v1, :cond_3

    .line 471
    .line 472
    return v0

    .line 473
    :cond_3
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzh:Z

    .line 474
    .line 475
    if-eqz v0, :cond_4

    .line 476
    .line 477
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzo:Lcom/google/android/libraries/places/internal/zzatg;

    .line 478
    .line 479
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzatg;->zzb(Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzatk;

    .line 480
    .line 481
    .line 482
    move-result-object p1

    .line 483
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzo:Lcom/google/android/libraries/places/internal/zzatg;

    .line 484
    .line 485
    invoke-virtual {p0, p2}, Lcom/google/android/libraries/places/internal/zzatg;->zzb(Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzatk;

    .line 486
    .line 487
    .line 488
    move-result-object p0

    .line 489
    invoke-virtual {p1, p0}, Lcom/google/android/libraries/places/internal/zzatk;->equals(Ljava/lang/Object;)Z

    .line 490
    .line 491
    .line 492
    move-result p0

    .line 493
    return p0

    .line 494
    :cond_4
    const/4 p0, 0x1

    .line 495
    return p0

    .line 496
    nop

    .line 497
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final zzh(Ljava/lang/Object;)Z
    .locals 14

    .line 1
    const/4 v0, 0x0

    .line 2
    const v1, 0xfffff

    .line 3
    .line 4
    .line 5
    move v2, v0

    .line 6
    move v4, v2

    .line 7
    move v3, v1

    .line 8
    :goto_0
    iget v5, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzk:I

    .line 9
    .line 10
    const/4 v6, 0x1

    .line 11
    if-ge v2, v5, :cond_b

    .line 12
    .line 13
    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzj:[I

    .line 14
    .line 15
    iget-object v7, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 16
    .line 17
    aget v10, v5, v2

    .line 18
    .line 19
    aget v5, v7, v10

    .line 20
    .line 21
    invoke-direct {p0, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzp(I)I

    .line 22
    .line 23
    .line 24
    move-result v7

    .line 25
    iget-object v8, p0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 26
    .line 27
    add-int/lit8 v9, v10, 0x2

    .line 28
    .line 29
    aget v8, v8, v9

    .line 30
    .line 31
    and-int v9, v8, v1

    .line 32
    .line 33
    ushr-int/lit8 v8, v8, 0x14

    .line 34
    .line 35
    shl-int v13, v6, v8

    .line 36
    .line 37
    if-eq v9, v3, :cond_1

    .line 38
    .line 39
    if-eq v9, v1, :cond_0

    .line 40
    .line 41
    int-to-long v3, v9

    .line 42
    sget-object v6, Lcom/google/android/libraries/places/internal/zzavi;->zzb:Lsun/misc/Unsafe;

    .line 43
    .line 44
    invoke-virtual {v6, p1, v3, v4}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    :cond_0
    move v12, v4

    .line 49
    move v11, v9

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    move v11, v3

    .line 52
    move v12, v4

    .line 53
    :goto_1
    const/high16 v3, 0x10000000

    .line 54
    .line 55
    and-int/2addr v3, v7

    .line 56
    move-object v8, p0

    .line 57
    move-object v9, p1

    .line 58
    if-eqz v3, :cond_3

    .line 59
    .line 60
    invoke-direct/range {v8 .. v13}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-eqz p0, :cond_2

    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_2
    return v0

    .line 68
    :cond_3
    :goto_2
    invoke-static {v7}, Lcom/google/android/libraries/places/internal/zzavi;->zzo(I)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    const/16 p1, 0x9

    .line 73
    .line 74
    if-eq p0, p1, :cond_9

    .line 75
    .line 76
    const/16 p1, 0x11

    .line 77
    .line 78
    if-eq p0, p1, :cond_9

    .line 79
    .line 80
    const/16 p1, 0x1b

    .line 81
    .line 82
    if-eq p0, p1, :cond_7

    .line 83
    .line 84
    const/16 p1, 0x3c

    .line 85
    .line 86
    if-eq p0, p1, :cond_6

    .line 87
    .line 88
    const/16 p1, 0x44

    .line 89
    .line 90
    if-eq p0, p1, :cond_6

    .line 91
    .line 92
    const/16 p1, 0x31

    .line 93
    .line 94
    if-eq p0, p1, :cond_7

    .line 95
    .line 96
    const/16 p1, 0x32

    .line 97
    .line 98
    if-eq p0, p1, :cond_4

    .line 99
    .line 100
    goto :goto_4

    .line 101
    :cond_4
    and-int p0, v7, v1

    .line 102
    .line 103
    int-to-long p0, p0

    .line 104
    invoke-static {v9, p0, p1}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    check-cast p0, Lcom/google/android/libraries/places/internal/zzauz;

    .line 109
    .line 110
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    if-eqz p0, :cond_5

    .line 115
    .line 116
    goto :goto_4

    .line 117
    :cond_5
    invoke-direct {v8, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzu(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    check-cast p0, Lcom/google/android/libraries/places/internal/zzauy;

    .line 122
    .line 123
    const/4 p0, 0x0

    .line 124
    throw p0

    .line 125
    :cond_6
    invoke-direct {v8, v9, v5, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    if-eqz p0, :cond_a

    .line 130
    .line 131
    invoke-direct {v8, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-static {v9, v7, p0}, Lcom/google/android/libraries/places/internal/zzavi;->zzK(Ljava/lang/Object;ILcom/google/android/libraries/places/internal/zzavt;)Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    if-nez p0, :cond_a

    .line 140
    .line 141
    return v0

    .line 142
    :cond_7
    and-int p0, v7, v1

    .line 143
    .line 144
    int-to-long p0, p0

    .line 145
    invoke-static {v9, p0, p1}, Lcom/google/android/libraries/places/internal/zzawx;->zzf(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    check-cast p0, Ljava/util/List;

    .line 150
    .line 151
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    if-nez p1, :cond_a

    .line 156
    .line 157
    invoke-direct {v8, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    move v3, v0

    .line 162
    :goto_3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 163
    .line 164
    .line 165
    move-result v4

    .line 166
    if-ge v3, v4, :cond_a

    .line 167
    .line 168
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    invoke-interface {p1, v4}, Lcom/google/android/libraries/places/internal/zzavt;->zzh(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result v4

    .line 176
    if-nez v4, :cond_8

    .line 177
    .line 178
    return v0

    .line 179
    :cond_8
    add-int/lit8 v3, v3, 0x1

    .line 180
    .line 181
    goto :goto_3

    .line 182
    :cond_9
    invoke-direct/range {v8 .. v13}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 183
    .line 184
    .line 185
    move-result p0

    .line 186
    if-eqz p0, :cond_a

    .line 187
    .line 188
    invoke-direct {v8, v10}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    invoke-static {v9, v7, p0}, Lcom/google/android/libraries/places/internal/zzavi;->zzK(Ljava/lang/Object;ILcom/google/android/libraries/places/internal/zzavt;)Z

    .line 193
    .line 194
    .line 195
    move-result p0

    .line 196
    if-nez p0, :cond_a

    .line 197
    .line 198
    return v0

    .line 199
    :cond_a
    :goto_4
    add-int/lit8 v2, v2, 0x1

    .line 200
    .line 201
    move-object p0, v8

    .line 202
    move-object p1, v9

    .line 203
    move v3, v11

    .line 204
    move v4, v12

    .line 205
    goto/16 :goto_0

    .line 206
    .line 207
    :cond_b
    move-object v8, p0

    .line 208
    move-object v9, p1

    .line 209
    iget-boolean p0, v8, Lcom/google/android/libraries/places/internal/zzavi;->zzh:Z

    .line 210
    .line 211
    if-eqz p0, :cond_c

    .line 212
    .line 213
    iget-object p0, v8, Lcom/google/android/libraries/places/internal/zzavi;->zzo:Lcom/google/android/libraries/places/internal/zzatg;

    .line 214
    .line 215
    invoke-virtual {p0, v9}, Lcom/google/android/libraries/places/internal/zzatg;->zzb(Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzatk;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzatk;->zzj()Z

    .line 220
    .line 221
    .line 222
    move-result p0

    .line 223
    if-nez p0, :cond_c

    .line 224
    .line 225
    return v0

    .line 226
    :cond_c
    return v6
.end method

.method public final zzj(Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzasy;)V
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v6, p2

    .line 6
    .line 7
    iget-boolean v2, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzh:Z

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    iget-object v2, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzo:Lcom/google/android/libraries/places/internal/zzatg;

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Lcom/google/android/libraries/places/internal/zzatg;->zzb(Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzatk;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget-object v3, v2, Lcom/google/android/libraries/places/internal/zzatk;->zza:Lcom/google/android/libraries/places/internal/zzawg;

    .line 18
    .line 19
    invoke-virtual {v3}, Ljava/util/AbstractMap;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-nez v3, :cond_0

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzatk;->zzf()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    check-cast v3, Ljava/util/Map$Entry;

    .line 34
    .line 35
    move-object v8, v2

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 v3, 0x0

    .line 38
    const/4 v8, 0x0

    .line 39
    :goto_0
    iget-object v9, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 40
    .line 41
    sget-object v10, Lcom/google/android/libraries/places/internal/zzavi;->zzb:Lsun/misc/Unsafe;

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    const v4, 0xfffff

    .line 45
    .line 46
    .line 47
    const/4 v5, 0x0

    .line 48
    :goto_1
    array-length v13, v9

    .line 49
    if-ge v2, v13, :cond_a

    .line 50
    .line 51
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzp(I)I

    .line 52
    .line 53
    .line 54
    move-result v13

    .line 55
    iget-object v14, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 56
    .line 57
    invoke-static {v13}, Lcom/google/android/libraries/places/internal/zzavi;->zzo(I)I

    .line 58
    .line 59
    .line 60
    move-result v15

    .line 61
    const/16 v16, 0x0

    .line 62
    .line 63
    aget v7, v14, v2

    .line 64
    .line 65
    const/16 v12, 0x11

    .line 66
    .line 67
    const v17, 0xfffff

    .line 68
    .line 69
    .line 70
    if-gt v15, v12, :cond_3

    .line 71
    .line 72
    add-int/lit8 v12, v2, 0x2

    .line 73
    .line 74
    aget v12, v14, v12

    .line 75
    .line 76
    and-int v14, v12, v17

    .line 77
    .line 78
    if-eq v14, v4, :cond_2

    .line 79
    .line 80
    move/from16 v11, v17

    .line 81
    .line 82
    const/16 v18, 0x1

    .line 83
    .line 84
    if-ne v14, v11, :cond_1

    .line 85
    .line 86
    const/4 v5, 0x0

    .line 87
    goto :goto_2

    .line 88
    :cond_1
    int-to-long v4, v14

    .line 89
    invoke-virtual {v10, v1, v4, v5}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    move v5, v4

    .line 94
    :goto_2
    move v4, v14

    .line 95
    goto :goto_3

    .line 96
    :cond_2
    const/16 v18, 0x1

    .line 97
    .line 98
    :goto_3
    ushr-int/lit8 v11, v12, 0x14

    .line 99
    .line 100
    shl-int v11, v18, v11

    .line 101
    .line 102
    move/from16 v19, v11

    .line 103
    .line 104
    move-object v11, v3

    .line 105
    move v3, v4

    .line 106
    move v4, v5

    .line 107
    move/from16 v5, v19

    .line 108
    .line 109
    goto :goto_4

    .line 110
    :cond_3
    const/16 v18, 0x1

    .line 111
    .line 112
    move-object v11, v3

    .line 113
    move v3, v4

    .line 114
    move v4, v5

    .line 115
    const/4 v5, 0x0

    .line 116
    :goto_4
    if-eqz v11, :cond_5

    .line 117
    .line 118
    iget-object v12, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzo:Lcom/google/android/libraries/places/internal/zzatg;

    .line 119
    .line 120
    invoke-virtual {v12, v11}, Lcom/google/android/libraries/places/internal/zzatg;->zza(Ljava/util/Map$Entry;)I

    .line 121
    .line 122
    .line 123
    move-result v12

    .line 124
    if-gt v12, v7, :cond_5

    .line 125
    .line 126
    iget-object v12, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzo:Lcom/google/android/libraries/places/internal/zzatg;

    .line 127
    .line 128
    invoke-virtual {v12, v6, v11}, Lcom/google/android/libraries/places/internal/zzatg;->zzj(Lcom/google/android/libraries/places/internal/zzasy;Ljava/util/Map$Entry;)V

    .line 129
    .line 130
    .line 131
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 132
    .line 133
    .line 134
    move-result v11

    .line 135
    if-eqz v11, :cond_4

    .line 136
    .line 137
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v11

    .line 141
    check-cast v11, Ljava/util/Map$Entry;

    .line 142
    .line 143
    goto :goto_4

    .line 144
    :cond_4
    move-object/from16 v11, v16

    .line 145
    .line 146
    goto :goto_4

    .line 147
    :cond_5
    const v17, 0xfffff

    .line 148
    .line 149
    .line 150
    and-int v12, v13, v17

    .line 151
    .line 152
    int-to-long v12, v12

    .line 153
    packed-switch v15, :pswitch_data_0

    .line 154
    .line 155
    .line 156
    :cond_6
    :goto_5
    const/4 v14, 0x0

    .line 157
    goto/16 :goto_9

    .line 158
    .line 159
    :pswitch_0
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 160
    .line 161
    .line 162
    move-result v5

    .line 163
    if-eqz v5, :cond_6

    .line 164
    .line 165
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    .line 170
    .line 171
    .line 172
    move-result-object v12

    .line 173
    invoke-virtual {v6, v7, v5, v12}, Lcom/google/android/libraries/places/internal/zzasy;->zzq(ILjava/lang/Object;Lcom/google/android/libraries/places/internal/zzavt;)V

    .line 174
    .line 175
    .line 176
    goto :goto_5

    .line 177
    :pswitch_1
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 178
    .line 179
    .line 180
    move-result v5

    .line 181
    if-eqz v5, :cond_6

    .line 182
    .line 183
    invoke-static {v1, v12, v13}, Lcom/google/android/libraries/places/internal/zzavi;->zzq(Ljava/lang/Object;J)J

    .line 184
    .line 185
    .line 186
    move-result-wide v12

    .line 187
    invoke-virtual {v6, v7, v12, v13}, Lcom/google/android/libraries/places/internal/zzasy;->zzD(IJ)V

    .line 188
    .line 189
    .line 190
    goto :goto_5

    .line 191
    :pswitch_2
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 192
    .line 193
    .line 194
    move-result v5

    .line 195
    if-eqz v5, :cond_6

    .line 196
    .line 197
    invoke-static {v1, v12, v13}, Lcom/google/android/libraries/places/internal/zzavi;->zzm(Ljava/lang/Object;J)I

    .line 198
    .line 199
    .line 200
    move-result v5

    .line 201
    invoke-virtual {v6, v7, v5}, Lcom/google/android/libraries/places/internal/zzasy;->zzB(II)V

    .line 202
    .line 203
    .line 204
    goto :goto_5

    .line 205
    :pswitch_3
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 206
    .line 207
    .line 208
    move-result v5

    .line 209
    if-eqz v5, :cond_6

    .line 210
    .line 211
    invoke-static {v1, v12, v13}, Lcom/google/android/libraries/places/internal/zzavi;->zzq(Ljava/lang/Object;J)J

    .line 212
    .line 213
    .line 214
    move-result-wide v12

    .line 215
    invoke-virtual {v6, v7, v12, v13}, Lcom/google/android/libraries/places/internal/zzasy;->zzz(IJ)V

    .line 216
    .line 217
    .line 218
    goto :goto_5

    .line 219
    :pswitch_4
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 220
    .line 221
    .line 222
    move-result v5

    .line 223
    if-eqz v5, :cond_6

    .line 224
    .line 225
    invoke-static {v1, v12, v13}, Lcom/google/android/libraries/places/internal/zzavi;->zzm(Ljava/lang/Object;J)I

    .line 226
    .line 227
    .line 228
    move-result v5

    .line 229
    invoke-virtual {v6, v7, v5}, Lcom/google/android/libraries/places/internal/zzasy;->zzx(II)V

    .line 230
    .line 231
    .line 232
    goto :goto_5

    .line 233
    :pswitch_5
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 234
    .line 235
    .line 236
    move-result v5

    .line 237
    if-eqz v5, :cond_6

    .line 238
    .line 239
    invoke-static {v1, v12, v13}, Lcom/google/android/libraries/places/internal/zzavi;->zzm(Ljava/lang/Object;J)I

    .line 240
    .line 241
    .line 242
    move-result v5

    .line 243
    invoke-virtual {v6, v7, v5}, Lcom/google/android/libraries/places/internal/zzasy;->zzi(II)V

    .line 244
    .line 245
    .line 246
    goto :goto_5

    .line 247
    :pswitch_6
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 248
    .line 249
    .line 250
    move-result v5

    .line 251
    if-eqz v5, :cond_6

    .line 252
    .line 253
    invoke-static {v1, v12, v13}, Lcom/google/android/libraries/places/internal/zzavi;->zzm(Ljava/lang/Object;J)I

    .line 254
    .line 255
    .line 256
    move-result v5

    .line 257
    invoke-virtual {v6, v7, v5}, Lcom/google/android/libraries/places/internal/zzasy;->zzI(II)V

    .line 258
    .line 259
    .line 260
    goto :goto_5

    .line 261
    :pswitch_7
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 262
    .line 263
    .line 264
    move-result v5

    .line 265
    if-eqz v5, :cond_6

    .line 266
    .line 267
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object v5

    .line 271
    check-cast v5, Lcom/google/android/libraries/places/internal/zzask;

    .line 272
    .line 273
    invoke-virtual {v6, v7, v5}, Lcom/google/android/libraries/places/internal/zzasy;->zzd(ILcom/google/android/libraries/places/internal/zzask;)V

    .line 274
    .line 275
    .line 276
    goto :goto_5

    .line 277
    :pswitch_8
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 278
    .line 279
    .line 280
    move-result v5

    .line 281
    if-eqz v5, :cond_6

    .line 282
    .line 283
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 284
    .line 285
    .line 286
    move-result-object v5

    .line 287
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    .line 288
    .line 289
    .line 290
    move-result-object v12

    .line 291
    invoke-virtual {v6, v7, v5, v12}, Lcom/google/android/libraries/places/internal/zzasy;->zzv(ILjava/lang/Object;Lcom/google/android/libraries/places/internal/zzavt;)V

    .line 292
    .line 293
    .line 294
    goto/16 :goto_5

    .line 295
    .line 296
    :pswitch_9
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 297
    .line 298
    .line 299
    move-result v5

    .line 300
    if-eqz v5, :cond_6

    .line 301
    .line 302
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 303
    .line 304
    .line 305
    move-result-object v5

    .line 306
    invoke-static {v7, v5, v6}, Lcom/google/android/libraries/places/internal/zzavi;->zzO(ILjava/lang/Object;Lcom/google/android/libraries/places/internal/zzasy;)V

    .line 307
    .line 308
    .line 309
    goto/16 :goto_5

    .line 310
    .line 311
    :pswitch_a
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 312
    .line 313
    .line 314
    move-result v5

    .line 315
    if-eqz v5, :cond_6

    .line 316
    .line 317
    invoke-static {v1, v12, v13}, Lcom/google/android/libraries/places/internal/zzavi;->zzN(Ljava/lang/Object;J)Z

    .line 318
    .line 319
    .line 320
    move-result v5

    .line 321
    invoke-virtual {v6, v7, v5}, Lcom/google/android/libraries/places/internal/zzasy;->zzb(IZ)V

    .line 322
    .line 323
    .line 324
    goto/16 :goto_5

    .line 325
    .line 326
    :pswitch_b
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 327
    .line 328
    .line 329
    move-result v5

    .line 330
    if-eqz v5, :cond_6

    .line 331
    .line 332
    invoke-static {v1, v12, v13}, Lcom/google/android/libraries/places/internal/zzavi;->zzm(Ljava/lang/Object;J)I

    .line 333
    .line 334
    .line 335
    move-result v5

    .line 336
    invoke-virtual {v6, v7, v5}, Lcom/google/android/libraries/places/internal/zzasy;->zzk(II)V

    .line 337
    .line 338
    .line 339
    goto/16 :goto_5

    .line 340
    .line 341
    :pswitch_c
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 342
    .line 343
    .line 344
    move-result v5

    .line 345
    if-eqz v5, :cond_6

    .line 346
    .line 347
    invoke-static {v1, v12, v13}, Lcom/google/android/libraries/places/internal/zzavi;->zzq(Ljava/lang/Object;J)J

    .line 348
    .line 349
    .line 350
    move-result-wide v12

    .line 351
    invoke-virtual {v6, v7, v12, v13}, Lcom/google/android/libraries/places/internal/zzasy;->zzm(IJ)V

    .line 352
    .line 353
    .line 354
    goto/16 :goto_5

    .line 355
    .line 356
    :pswitch_d
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 357
    .line 358
    .line 359
    move-result v5

    .line 360
    if-eqz v5, :cond_6

    .line 361
    .line 362
    invoke-static {v1, v12, v13}, Lcom/google/android/libraries/places/internal/zzavi;->zzm(Ljava/lang/Object;J)I

    .line 363
    .line 364
    .line 365
    move-result v5

    .line 366
    invoke-virtual {v6, v7, v5}, Lcom/google/android/libraries/places/internal/zzasy;->zzr(II)V

    .line 367
    .line 368
    .line 369
    goto/16 :goto_5

    .line 370
    .line 371
    :pswitch_e
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 372
    .line 373
    .line 374
    move-result v5

    .line 375
    if-eqz v5, :cond_6

    .line 376
    .line 377
    invoke-static {v1, v12, v13}, Lcom/google/android/libraries/places/internal/zzavi;->zzq(Ljava/lang/Object;J)J

    .line 378
    .line 379
    .line 380
    move-result-wide v12

    .line 381
    invoke-virtual {v6, v7, v12, v13}, Lcom/google/android/libraries/places/internal/zzasy;->zzK(IJ)V

    .line 382
    .line 383
    .line 384
    goto/16 :goto_5

    .line 385
    .line 386
    :pswitch_f
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 387
    .line 388
    .line 389
    move-result v5

    .line 390
    if-eqz v5, :cond_6

    .line 391
    .line 392
    invoke-static {v1, v12, v13}, Lcom/google/android/libraries/places/internal/zzavi;->zzq(Ljava/lang/Object;J)J

    .line 393
    .line 394
    .line 395
    move-result-wide v12

    .line 396
    invoke-virtual {v6, v7, v12, v13}, Lcom/google/android/libraries/places/internal/zzasy;->zzt(IJ)V

    .line 397
    .line 398
    .line 399
    goto/16 :goto_5

    .line 400
    .line 401
    :pswitch_10
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 402
    .line 403
    .line 404
    move-result v5

    .line 405
    if-eqz v5, :cond_6

    .line 406
    .line 407
    invoke-static {v1, v12, v13}, Lcom/google/android/libraries/places/internal/zzavi;->zzl(Ljava/lang/Object;J)F

    .line 408
    .line 409
    .line 410
    move-result v5

    .line 411
    invoke-virtual {v6, v7, v5}, Lcom/google/android/libraries/places/internal/zzasy;->zzo(IF)V

    .line 412
    .line 413
    .line 414
    goto/16 :goto_5

    .line 415
    .line 416
    :pswitch_11
    invoke-direct {v0, v1, v7, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzM(Ljava/lang/Object;II)Z

    .line 417
    .line 418
    .line 419
    move-result v5

    .line 420
    if-eqz v5, :cond_6

    .line 421
    .line 422
    invoke-static {v1, v12, v13}, Lcom/google/android/libraries/places/internal/zzavi;->zzk(Ljava/lang/Object;J)D

    .line 423
    .line 424
    .line 425
    move-result-wide v12

    .line 426
    invoke-virtual {v6, v7, v12, v13}, Lcom/google/android/libraries/places/internal/zzasy;->zzf(ID)V

    .line 427
    .line 428
    .line 429
    goto/16 :goto_5

    .line 430
    .line 431
    :pswitch_12
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 432
    .line 433
    .line 434
    move-result-object v5

    .line 435
    if-nez v5, :cond_7

    .line 436
    .line 437
    goto/16 :goto_5

    .line 438
    .line 439
    :cond_7
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzu(I)Ljava/lang/Object;

    .line 440
    .line 441
    .line 442
    move-result-object v0

    .line 443
    check-cast v0, Lcom/google/android/libraries/places/internal/zzauy;

    .line 444
    .line 445
    throw v16

    .line 446
    :pswitch_13
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 447
    .line 448
    aget v5, v5, v2

    .line 449
    .line 450
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 451
    .line 452
    .line 453
    move-result-object v7

    .line 454
    check-cast v7, Ljava/util/List;

    .line 455
    .line 456
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    .line 457
    .line 458
    .line 459
    move-result-object v12

    .line 460
    sget v13, Lcom/google/android/libraries/places/internal/zzavv;->zza:I

    .line 461
    .line 462
    if-eqz v7, :cond_6

    .line 463
    .line 464
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    .line 465
    .line 466
    .line 467
    move-result v13

    .line 468
    if-nez v13, :cond_6

    .line 469
    .line 470
    const/4 v13, 0x0

    .line 471
    :goto_6
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 472
    .line 473
    .line 474
    move-result v14

    .line 475
    if-ge v13, v14, :cond_6

    .line 476
    .line 477
    invoke-interface {v7, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 478
    .line 479
    .line 480
    move-result-object v14

    .line 481
    invoke-virtual {v6, v5, v14, v12}, Lcom/google/android/libraries/places/internal/zzasy;->zzq(ILjava/lang/Object;Lcom/google/android/libraries/places/internal/zzavt;)V

    .line 482
    .line 483
    .line 484
    add-int/lit8 v13, v13, 0x1

    .line 485
    .line 486
    goto :goto_6

    .line 487
    :pswitch_14
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 488
    .line 489
    aget v5, v5, v2

    .line 490
    .line 491
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 492
    .line 493
    .line 494
    move-result-object v7

    .line 495
    check-cast v7, Ljava/util/List;

    .line 496
    .line 497
    move/from16 v14, v18

    .line 498
    .line 499
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzF(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 500
    .line 501
    .line 502
    goto/16 :goto_5

    .line 503
    .line 504
    :pswitch_15
    move/from16 v14, v18

    .line 505
    .line 506
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 507
    .line 508
    aget v5, v5, v2

    .line 509
    .line 510
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 511
    .line 512
    .line 513
    move-result-object v7

    .line 514
    check-cast v7, Ljava/util/List;

    .line 515
    .line 516
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzE(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 517
    .line 518
    .line 519
    goto/16 :goto_5

    .line 520
    .line 521
    :pswitch_16
    move/from16 v14, v18

    .line 522
    .line 523
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 524
    .line 525
    aget v5, v5, v2

    .line 526
    .line 527
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 528
    .line 529
    .line 530
    move-result-object v7

    .line 531
    check-cast v7, Ljava/util/List;

    .line 532
    .line 533
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzD(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 534
    .line 535
    .line 536
    goto/16 :goto_5

    .line 537
    .line 538
    :pswitch_17
    move/from16 v14, v18

    .line 539
    .line 540
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 541
    .line 542
    aget v5, v5, v2

    .line 543
    .line 544
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 545
    .line 546
    .line 547
    move-result-object v7

    .line 548
    check-cast v7, Ljava/util/List;

    .line 549
    .line 550
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzC(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 551
    .line 552
    .line 553
    goto/16 :goto_5

    .line 554
    .line 555
    :pswitch_18
    move/from16 v14, v18

    .line 556
    .line 557
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 558
    .line 559
    aget v5, v5, v2

    .line 560
    .line 561
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 562
    .line 563
    .line 564
    move-result-object v7

    .line 565
    check-cast v7, Ljava/util/List;

    .line 566
    .line 567
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzw(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 568
    .line 569
    .line 570
    goto/16 :goto_5

    .line 571
    .line 572
    :pswitch_19
    move/from16 v14, v18

    .line 573
    .line 574
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 575
    .line 576
    aget v5, v5, v2

    .line 577
    .line 578
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 579
    .line 580
    .line 581
    move-result-object v7

    .line 582
    check-cast v7, Ljava/util/List;

    .line 583
    .line 584
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzG(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 585
    .line 586
    .line 587
    goto/16 :goto_5

    .line 588
    .line 589
    :pswitch_1a
    move/from16 v14, v18

    .line 590
    .line 591
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 592
    .line 593
    aget v5, v5, v2

    .line 594
    .line 595
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 596
    .line 597
    .line 598
    move-result-object v7

    .line 599
    check-cast v7, Ljava/util/List;

    .line 600
    .line 601
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzu(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 602
    .line 603
    .line 604
    goto/16 :goto_5

    .line 605
    .line 606
    :pswitch_1b
    move/from16 v14, v18

    .line 607
    .line 608
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 609
    .line 610
    aget v5, v5, v2

    .line 611
    .line 612
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 613
    .line 614
    .line 615
    move-result-object v7

    .line 616
    check-cast v7, Ljava/util/List;

    .line 617
    .line 618
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzx(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 619
    .line 620
    .line 621
    goto/16 :goto_5

    .line 622
    .line 623
    :pswitch_1c
    move/from16 v14, v18

    .line 624
    .line 625
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 626
    .line 627
    aget v5, v5, v2

    .line 628
    .line 629
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 630
    .line 631
    .line 632
    move-result-object v7

    .line 633
    check-cast v7, Ljava/util/List;

    .line 634
    .line 635
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzy(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 636
    .line 637
    .line 638
    goto/16 :goto_5

    .line 639
    .line 640
    :pswitch_1d
    move/from16 v14, v18

    .line 641
    .line 642
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 643
    .line 644
    aget v5, v5, v2

    .line 645
    .line 646
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 647
    .line 648
    .line 649
    move-result-object v7

    .line 650
    check-cast v7, Ljava/util/List;

    .line 651
    .line 652
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzA(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 653
    .line 654
    .line 655
    goto/16 :goto_5

    .line 656
    .line 657
    :pswitch_1e
    move/from16 v14, v18

    .line 658
    .line 659
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 660
    .line 661
    aget v5, v5, v2

    .line 662
    .line 663
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 664
    .line 665
    .line 666
    move-result-object v7

    .line 667
    check-cast v7, Ljava/util/List;

    .line 668
    .line 669
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzH(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 670
    .line 671
    .line 672
    goto/16 :goto_5

    .line 673
    .line 674
    :pswitch_1f
    move/from16 v14, v18

    .line 675
    .line 676
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 677
    .line 678
    aget v5, v5, v2

    .line 679
    .line 680
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 681
    .line 682
    .line 683
    move-result-object v7

    .line 684
    check-cast v7, Ljava/util/List;

    .line 685
    .line 686
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzB(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 687
    .line 688
    .line 689
    goto/16 :goto_5

    .line 690
    .line 691
    :pswitch_20
    move/from16 v14, v18

    .line 692
    .line 693
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 694
    .line 695
    aget v5, v5, v2

    .line 696
    .line 697
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 698
    .line 699
    .line 700
    move-result-object v7

    .line 701
    check-cast v7, Ljava/util/List;

    .line 702
    .line 703
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzz(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 704
    .line 705
    .line 706
    goto/16 :goto_5

    .line 707
    .line 708
    :pswitch_21
    move/from16 v14, v18

    .line 709
    .line 710
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 711
    .line 712
    aget v5, v5, v2

    .line 713
    .line 714
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 715
    .line 716
    .line 717
    move-result-object v7

    .line 718
    check-cast v7, Ljava/util/List;

    .line 719
    .line 720
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzv(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 721
    .line 722
    .line 723
    goto/16 :goto_5

    .line 724
    .line 725
    :pswitch_22
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 726
    .line 727
    aget v5, v5, v2

    .line 728
    .line 729
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 730
    .line 731
    .line 732
    move-result-object v7

    .line 733
    check-cast v7, Ljava/util/List;

    .line 734
    .line 735
    const/4 v14, 0x0

    .line 736
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzF(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 737
    .line 738
    .line 739
    goto/16 :goto_9

    .line 740
    .line 741
    :pswitch_23
    const/4 v14, 0x0

    .line 742
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 743
    .line 744
    aget v5, v5, v2

    .line 745
    .line 746
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 747
    .line 748
    .line 749
    move-result-object v7

    .line 750
    check-cast v7, Ljava/util/List;

    .line 751
    .line 752
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzE(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 753
    .line 754
    .line 755
    goto/16 :goto_9

    .line 756
    .line 757
    :pswitch_24
    const/4 v14, 0x0

    .line 758
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 759
    .line 760
    aget v5, v5, v2

    .line 761
    .line 762
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 763
    .line 764
    .line 765
    move-result-object v7

    .line 766
    check-cast v7, Ljava/util/List;

    .line 767
    .line 768
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzD(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 769
    .line 770
    .line 771
    goto/16 :goto_9

    .line 772
    .line 773
    :pswitch_25
    const/4 v14, 0x0

    .line 774
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 775
    .line 776
    aget v5, v5, v2

    .line 777
    .line 778
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 779
    .line 780
    .line 781
    move-result-object v7

    .line 782
    check-cast v7, Ljava/util/List;

    .line 783
    .line 784
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzC(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 785
    .line 786
    .line 787
    goto/16 :goto_9

    .line 788
    .line 789
    :pswitch_26
    const/4 v14, 0x0

    .line 790
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 791
    .line 792
    aget v5, v5, v2

    .line 793
    .line 794
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 795
    .line 796
    .line 797
    move-result-object v7

    .line 798
    check-cast v7, Ljava/util/List;

    .line 799
    .line 800
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzw(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 801
    .line 802
    .line 803
    goto/16 :goto_9

    .line 804
    .line 805
    :pswitch_27
    const/4 v14, 0x0

    .line 806
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 807
    .line 808
    aget v5, v5, v2

    .line 809
    .line 810
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 811
    .line 812
    .line 813
    move-result-object v7

    .line 814
    check-cast v7, Ljava/util/List;

    .line 815
    .line 816
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzG(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 817
    .line 818
    .line 819
    goto/16 :goto_9

    .line 820
    .line 821
    :pswitch_28
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 822
    .line 823
    aget v5, v5, v2

    .line 824
    .line 825
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 826
    .line 827
    .line 828
    move-result-object v7

    .line 829
    check-cast v7, Ljava/util/List;

    .line 830
    .line 831
    sget v12, Lcom/google/android/libraries/places/internal/zzavv;->zza:I

    .line 832
    .line 833
    if-eqz v7, :cond_6

    .line 834
    .line 835
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    .line 836
    .line 837
    .line 838
    move-result v12

    .line 839
    if-nez v12, :cond_6

    .line 840
    .line 841
    invoke-virtual {v6, v5, v7}, Lcom/google/android/libraries/places/internal/zzasy;->zze(ILjava/util/List;)V

    .line 842
    .line 843
    .line 844
    goto/16 :goto_5

    .line 845
    .line 846
    :pswitch_29
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 847
    .line 848
    aget v5, v5, v2

    .line 849
    .line 850
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 851
    .line 852
    .line 853
    move-result-object v7

    .line 854
    check-cast v7, Ljava/util/List;

    .line 855
    .line 856
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    .line 857
    .line 858
    .line 859
    move-result-object v12

    .line 860
    sget v13, Lcom/google/android/libraries/places/internal/zzavv;->zza:I

    .line 861
    .line 862
    if-eqz v7, :cond_6

    .line 863
    .line 864
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    .line 865
    .line 866
    .line 867
    move-result v13

    .line 868
    if-nez v13, :cond_6

    .line 869
    .line 870
    const/4 v14, 0x0

    .line 871
    :goto_7
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 872
    .line 873
    .line 874
    move-result v13

    .line 875
    if-ge v14, v13, :cond_6

    .line 876
    .line 877
    invoke-interface {v7, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 878
    .line 879
    .line 880
    move-result-object v13

    .line 881
    invoke-virtual {v6, v5, v13, v12}, Lcom/google/android/libraries/places/internal/zzasy;->zzv(ILjava/lang/Object;Lcom/google/android/libraries/places/internal/zzavt;)V

    .line 882
    .line 883
    .line 884
    add-int/lit8 v14, v14, 0x1

    .line 885
    .line 886
    goto :goto_7

    .line 887
    :pswitch_2a
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 888
    .line 889
    aget v5, v5, v2

    .line 890
    .line 891
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 892
    .line 893
    .line 894
    move-result-object v7

    .line 895
    check-cast v7, Ljava/util/List;

    .line 896
    .line 897
    sget v12, Lcom/google/android/libraries/places/internal/zzavv;->zza:I

    .line 898
    .line 899
    if-eqz v7, :cond_6

    .line 900
    .line 901
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    .line 902
    .line 903
    .line 904
    move-result v12

    .line 905
    if-nez v12, :cond_6

    .line 906
    .line 907
    invoke-virtual {v6, v5, v7}, Lcom/google/android/libraries/places/internal/zzasy;->zzH(ILjava/util/List;)V

    .line 908
    .line 909
    .line 910
    goto/16 :goto_5

    .line 911
    .line 912
    :pswitch_2b
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 913
    .line 914
    aget v5, v5, v2

    .line 915
    .line 916
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 917
    .line 918
    .line 919
    move-result-object v7

    .line 920
    check-cast v7, Ljava/util/List;

    .line 921
    .line 922
    const/4 v14, 0x0

    .line 923
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzu(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 924
    .line 925
    .line 926
    goto/16 :goto_9

    .line 927
    .line 928
    :pswitch_2c
    const/4 v14, 0x0

    .line 929
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 930
    .line 931
    aget v5, v5, v2

    .line 932
    .line 933
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 934
    .line 935
    .line 936
    move-result-object v7

    .line 937
    check-cast v7, Ljava/util/List;

    .line 938
    .line 939
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzx(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 940
    .line 941
    .line 942
    goto/16 :goto_9

    .line 943
    .line 944
    :pswitch_2d
    const/4 v14, 0x0

    .line 945
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 946
    .line 947
    aget v5, v5, v2

    .line 948
    .line 949
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 950
    .line 951
    .line 952
    move-result-object v7

    .line 953
    check-cast v7, Ljava/util/List;

    .line 954
    .line 955
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzy(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 956
    .line 957
    .line 958
    goto/16 :goto_9

    .line 959
    .line 960
    :pswitch_2e
    const/4 v14, 0x0

    .line 961
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 962
    .line 963
    aget v5, v5, v2

    .line 964
    .line 965
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 966
    .line 967
    .line 968
    move-result-object v7

    .line 969
    check-cast v7, Ljava/util/List;

    .line 970
    .line 971
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzA(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 972
    .line 973
    .line 974
    goto/16 :goto_9

    .line 975
    .line 976
    :pswitch_2f
    const/4 v14, 0x0

    .line 977
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 978
    .line 979
    aget v5, v5, v2

    .line 980
    .line 981
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 982
    .line 983
    .line 984
    move-result-object v7

    .line 985
    check-cast v7, Ljava/util/List;

    .line 986
    .line 987
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzH(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 988
    .line 989
    .line 990
    goto/16 :goto_9

    .line 991
    .line 992
    :pswitch_30
    const/4 v14, 0x0

    .line 993
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 994
    .line 995
    aget v5, v5, v2

    .line 996
    .line 997
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 998
    .line 999
    .line 1000
    move-result-object v7

    .line 1001
    check-cast v7, Ljava/util/List;

    .line 1002
    .line 1003
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzB(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 1004
    .line 1005
    .line 1006
    goto/16 :goto_9

    .line 1007
    .line 1008
    :pswitch_31
    const/4 v14, 0x0

    .line 1009
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 1010
    .line 1011
    aget v5, v5, v2

    .line 1012
    .line 1013
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1014
    .line 1015
    .line 1016
    move-result-object v7

    .line 1017
    check-cast v7, Ljava/util/List;

    .line 1018
    .line 1019
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzz(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 1020
    .line 1021
    .line 1022
    goto/16 :goto_9

    .line 1023
    .line 1024
    :pswitch_32
    const/4 v14, 0x0

    .line 1025
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzc:[I

    .line 1026
    .line 1027
    aget v5, v5, v2

    .line 1028
    .line 1029
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1030
    .line 1031
    .line 1032
    move-result-object v7

    .line 1033
    check-cast v7, Ljava/util/List;

    .line 1034
    .line 1035
    invoke-static {v5, v7, v6, v14}, Lcom/google/android/libraries/places/internal/zzavv;->zzv(ILjava/util/List;Lcom/google/android/libraries/places/internal/zzasy;Z)V

    .line 1036
    .line 1037
    .line 1038
    goto/16 :goto_9

    .line 1039
    .line 1040
    :pswitch_33
    const/4 v14, 0x0

    .line 1041
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 1042
    .line 1043
    .line 1044
    move-result v5

    .line 1045
    if-eqz v5, :cond_9

    .line 1046
    .line 1047
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1048
    .line 1049
    .line 1050
    move-result-object v5

    .line 1051
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    .line 1052
    .line 1053
    .line 1054
    move-result-object v12

    .line 1055
    invoke-virtual {v6, v7, v5, v12}, Lcom/google/android/libraries/places/internal/zzasy;->zzq(ILjava/lang/Object;Lcom/google/android/libraries/places/internal/zzavt;)V

    .line 1056
    .line 1057
    .line 1058
    goto/16 :goto_9

    .line 1059
    .line 1060
    :pswitch_34
    const/4 v14, 0x0

    .line 1061
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 1062
    .line 1063
    .line 1064
    move-result v5

    .line 1065
    if-eqz v5, :cond_8

    .line 1066
    .line 1067
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1068
    .line 1069
    .line 1070
    move-result-wide v12

    .line 1071
    invoke-virtual {v6, v7, v12, v13}, Lcom/google/android/libraries/places/internal/zzasy;->zzD(IJ)V

    .line 1072
    .line 1073
    .line 1074
    :cond_8
    :goto_8
    move-object/from16 v0, p0

    .line 1075
    .line 1076
    goto/16 :goto_9

    .line 1077
    .line 1078
    :pswitch_35
    const/4 v14, 0x0

    .line 1079
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 1080
    .line 1081
    .line 1082
    move-result v5

    .line 1083
    if-eqz v5, :cond_8

    .line 1084
    .line 1085
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1086
    .line 1087
    .line 1088
    move-result v0

    .line 1089
    invoke-virtual {v6, v7, v0}, Lcom/google/android/libraries/places/internal/zzasy;->zzB(II)V

    .line 1090
    .line 1091
    .line 1092
    goto :goto_8

    .line 1093
    :pswitch_36
    const/4 v14, 0x0

    .line 1094
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 1095
    .line 1096
    .line 1097
    move-result v5

    .line 1098
    if-eqz v5, :cond_8

    .line 1099
    .line 1100
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1101
    .line 1102
    .line 1103
    move-result-wide v12

    .line 1104
    invoke-virtual {v6, v7, v12, v13}, Lcom/google/android/libraries/places/internal/zzasy;->zzz(IJ)V

    .line 1105
    .line 1106
    .line 1107
    goto :goto_8

    .line 1108
    :pswitch_37
    const/4 v14, 0x0

    .line 1109
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 1110
    .line 1111
    .line 1112
    move-result v5

    .line 1113
    if-eqz v5, :cond_8

    .line 1114
    .line 1115
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1116
    .line 1117
    .line 1118
    move-result v0

    .line 1119
    invoke-virtual {v6, v7, v0}, Lcom/google/android/libraries/places/internal/zzasy;->zzx(II)V

    .line 1120
    .line 1121
    .line 1122
    goto :goto_8

    .line 1123
    :pswitch_38
    const/4 v14, 0x0

    .line 1124
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 1125
    .line 1126
    .line 1127
    move-result v5

    .line 1128
    if-eqz v5, :cond_8

    .line 1129
    .line 1130
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1131
    .line 1132
    .line 1133
    move-result v0

    .line 1134
    invoke-virtual {v6, v7, v0}, Lcom/google/android/libraries/places/internal/zzasy;->zzi(II)V

    .line 1135
    .line 1136
    .line 1137
    goto :goto_8

    .line 1138
    :pswitch_39
    const/4 v14, 0x0

    .line 1139
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 1140
    .line 1141
    .line 1142
    move-result v5

    .line 1143
    if-eqz v5, :cond_8

    .line 1144
    .line 1145
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1146
    .line 1147
    .line 1148
    move-result v0

    .line 1149
    invoke-virtual {v6, v7, v0}, Lcom/google/android/libraries/places/internal/zzasy;->zzI(II)V

    .line 1150
    .line 1151
    .line 1152
    goto :goto_8

    .line 1153
    :pswitch_3a
    const/4 v14, 0x0

    .line 1154
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 1155
    .line 1156
    .line 1157
    move-result v5

    .line 1158
    if-eqz v5, :cond_8

    .line 1159
    .line 1160
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1161
    .line 1162
    .line 1163
    move-result-object v0

    .line 1164
    check-cast v0, Lcom/google/android/libraries/places/internal/zzask;

    .line 1165
    .line 1166
    invoke-virtual {v6, v7, v0}, Lcom/google/android/libraries/places/internal/zzasy;->zzd(ILcom/google/android/libraries/places/internal/zzask;)V

    .line 1167
    .line 1168
    .line 1169
    goto :goto_8

    .line 1170
    :pswitch_3b
    const/4 v14, 0x0

    .line 1171
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 1172
    .line 1173
    .line 1174
    move-result v5

    .line 1175
    if-eqz v5, :cond_9

    .line 1176
    .line 1177
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1178
    .line 1179
    .line 1180
    move-result-object v5

    .line 1181
    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzavi;->zzs(I)Lcom/google/android/libraries/places/internal/zzavt;

    .line 1182
    .line 1183
    .line 1184
    move-result-object v12

    .line 1185
    invoke-virtual {v6, v7, v5, v12}, Lcom/google/android/libraries/places/internal/zzasy;->zzv(ILjava/lang/Object;Lcom/google/android/libraries/places/internal/zzavt;)V

    .line 1186
    .line 1187
    .line 1188
    goto/16 :goto_9

    .line 1189
    .line 1190
    :pswitch_3c
    const/4 v14, 0x0

    .line 1191
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 1192
    .line 1193
    .line 1194
    move-result v5

    .line 1195
    if-eqz v5, :cond_8

    .line 1196
    .line 1197
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1198
    .line 1199
    .line 1200
    move-result-object v0

    .line 1201
    invoke-static {v7, v0, v6}, Lcom/google/android/libraries/places/internal/zzavi;->zzO(ILjava/lang/Object;Lcom/google/android/libraries/places/internal/zzasy;)V

    .line 1202
    .line 1203
    .line 1204
    goto/16 :goto_8

    .line 1205
    .line 1206
    :pswitch_3d
    const/4 v14, 0x0

    .line 1207
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 1208
    .line 1209
    .line 1210
    move-result v5

    .line 1211
    if-eqz v5, :cond_8

    .line 1212
    .line 1213
    invoke-static {v1, v12, v13}, Lcom/google/android/libraries/places/internal/zzawx;->zzw(Ljava/lang/Object;J)Z

    .line 1214
    .line 1215
    .line 1216
    move-result v0

    .line 1217
    invoke-virtual {v6, v7, v0}, Lcom/google/android/libraries/places/internal/zzasy;->zzb(IZ)V

    .line 1218
    .line 1219
    .line 1220
    goto/16 :goto_8

    .line 1221
    .line 1222
    :pswitch_3e
    const/4 v14, 0x0

    .line 1223
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 1224
    .line 1225
    .line 1226
    move-result v5

    .line 1227
    if-eqz v5, :cond_8

    .line 1228
    .line 1229
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1230
    .line 1231
    .line 1232
    move-result v0

    .line 1233
    invoke-virtual {v6, v7, v0}, Lcom/google/android/libraries/places/internal/zzasy;->zzk(II)V

    .line 1234
    .line 1235
    .line 1236
    goto/16 :goto_8

    .line 1237
    .line 1238
    :pswitch_3f
    const/4 v14, 0x0

    .line 1239
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 1240
    .line 1241
    .line 1242
    move-result v5

    .line 1243
    if-eqz v5, :cond_8

    .line 1244
    .line 1245
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1246
    .line 1247
    .line 1248
    move-result-wide v12

    .line 1249
    invoke-virtual {v6, v7, v12, v13}, Lcom/google/android/libraries/places/internal/zzasy;->zzm(IJ)V

    .line 1250
    .line 1251
    .line 1252
    goto/16 :goto_8

    .line 1253
    .line 1254
    :pswitch_40
    const/4 v14, 0x0

    .line 1255
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 1256
    .line 1257
    .line 1258
    move-result v5

    .line 1259
    if-eqz v5, :cond_8

    .line 1260
    .line 1261
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1262
    .line 1263
    .line 1264
    move-result v0

    .line 1265
    invoke-virtual {v6, v7, v0}, Lcom/google/android/libraries/places/internal/zzasy;->zzr(II)V

    .line 1266
    .line 1267
    .line 1268
    goto/16 :goto_8

    .line 1269
    .line 1270
    :pswitch_41
    const/4 v14, 0x0

    .line 1271
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 1272
    .line 1273
    .line 1274
    move-result v5

    .line 1275
    if-eqz v5, :cond_8

    .line 1276
    .line 1277
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1278
    .line 1279
    .line 1280
    move-result-wide v12

    .line 1281
    invoke-virtual {v6, v7, v12, v13}, Lcom/google/android/libraries/places/internal/zzasy;->zzK(IJ)V

    .line 1282
    .line 1283
    .line 1284
    goto/16 :goto_8

    .line 1285
    .line 1286
    :pswitch_42
    const/4 v14, 0x0

    .line 1287
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 1288
    .line 1289
    .line 1290
    move-result v5

    .line 1291
    if-eqz v5, :cond_8

    .line 1292
    .line 1293
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1294
    .line 1295
    .line 1296
    move-result-wide v12

    .line 1297
    invoke-virtual {v6, v7, v12, v13}, Lcom/google/android/libraries/places/internal/zzasy;->zzt(IJ)V

    .line 1298
    .line 1299
    .line 1300
    goto/16 :goto_8

    .line 1301
    .line 1302
    :pswitch_43
    const/4 v14, 0x0

    .line 1303
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 1304
    .line 1305
    .line 1306
    move-result v5

    .line 1307
    if-eqz v5, :cond_8

    .line 1308
    .line 1309
    invoke-static {v1, v12, v13}, Lcom/google/android/libraries/places/internal/zzawx;->zzb(Ljava/lang/Object;J)F

    .line 1310
    .line 1311
    .line 1312
    move-result v0

    .line 1313
    invoke-virtual {v6, v7, v0}, Lcom/google/android/libraries/places/internal/zzasy;->zzo(IF)V

    .line 1314
    .line 1315
    .line 1316
    goto/16 :goto_8

    .line 1317
    .line 1318
    :pswitch_44
    const/4 v14, 0x0

    .line 1319
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzavi;->zzJ(Ljava/lang/Object;IIII)Z

    .line 1320
    .line 1321
    .line 1322
    move-result v5

    .line 1323
    if-eqz v5, :cond_9

    .line 1324
    .line 1325
    invoke-static {v1, v12, v13}, Lcom/google/android/libraries/places/internal/zzawx;->zza(Ljava/lang/Object;J)D

    .line 1326
    .line 1327
    .line 1328
    move-result-wide v12

    .line 1329
    invoke-virtual {v6, v7, v12, v13}, Lcom/google/android/libraries/places/internal/zzasy;->zzf(ID)V

    .line 1330
    .line 1331
    .line 1332
    :cond_9
    :goto_9
    add-int/lit8 v2, v2, 0x3

    .line 1333
    .line 1334
    move v5, v4

    .line 1335
    move v4, v3

    .line 1336
    move-object v3, v11

    .line 1337
    goto/16 :goto_1

    .line 1338
    .line 1339
    :cond_a
    const/16 v16, 0x0

    .line 1340
    .line 1341
    :goto_a
    if-eqz v3, :cond_c

    .line 1342
    .line 1343
    iget-object v2, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzo:Lcom/google/android/libraries/places/internal/zzatg;

    .line 1344
    .line 1345
    invoke-virtual {v2, v6, v3}, Lcom/google/android/libraries/places/internal/zzatg;->zzj(Lcom/google/android/libraries/places/internal/zzasy;Ljava/util/Map$Entry;)V

    .line 1346
    .line 1347
    .line 1348
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 1349
    .line 1350
    .line 1351
    move-result v2

    .line 1352
    if-eqz v2, :cond_b

    .line 1353
    .line 1354
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1355
    .line 1356
    .line 1357
    move-result-object v2

    .line 1358
    move-object v3, v2

    .line 1359
    check-cast v3, Ljava/util/Map$Entry;

    .line 1360
    .line 1361
    goto :goto_a

    .line 1362
    :cond_b
    move-object/from16 v3, v16

    .line 1363
    .line 1364
    goto :goto_a

    .line 1365
    :cond_c
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzavi;->zzn:Lcom/google/android/libraries/places/internal/zzawn;

    .line 1366
    .line 1367
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/internal/zzawn;->zzd(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1368
    .line 1369
    .line 1370
    move-result-object v1

    .line 1371
    invoke-virtual {v0, v1, v6}, Lcom/google/android/libraries/places/internal/zzawn;->zzs(Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzasy;)V

    .line 1372
    .line 1373
    .line 1374
    return-void

    .line 1375
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
