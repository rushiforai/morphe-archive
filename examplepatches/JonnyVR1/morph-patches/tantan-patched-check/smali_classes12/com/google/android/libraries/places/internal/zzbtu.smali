.class final Lcom/google/android/libraries/places/internal/zzbtu;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field zza:[Lcom/google/android/libraries/places/internal/zzbtt;

.field zzb:I

.field zzc:I

.field zzd:I

.field private final zze:Ljava/util/List;

.field private final zzf:Lcom/google/android/libraries/places/internal/zzbwd;

.field private zzg:I

.field private zzh:I


# direct methods
.method public constructor <init>(IILcom/google/android/libraries/places/internal/zzbws;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zze:Ljava/util/List;

    .line 10
    .line 11
    const/16 p1, 0x8

    .line 12
    .line 13
    new-array p1, p1, [Lcom/google/android/libraries/places/internal/zzbtt;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zza:[Lcom/google/android/libraries/places/internal/zzbtt;

    .line 16
    .line 17
    array-length p1, p1

    .line 18
    add-int/lit8 p1, p1, -0x1

    .line 19
    .line 20
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzb:I

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzc:I

    .line 24
    .line 25
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzd:I

    .line 26
    .line 27
    const/16 p1, 0x1000

    .line 28
    .line 29
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzg:I

    .line 30
    .line 31
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzh:I

    .line 32
    .line 33
    invoke-static {p3}, Lcom/google/android/libraries/places/internal/zzbwh;->zzb(Lcom/google/android/libraries/places/internal/zzbws;)Lcom/google/android/libraries/places/internal/zzbwd;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzf:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 38
    .line 39
    return-void
.end method

.method private final zzf(I)I
    .locals 0

    iget p0, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzb:I

    add-int/lit8 p0, p0, 0x1

    add-int/2addr p0, p1

    return p0
.end method

.method private final zzg(I)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-lez p1, :cond_1

    .line 3
    .line 4
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zza:[Lcom/google/android/libraries/places/internal/zzbtt;

    .line 5
    .line 6
    array-length v1, v1

    .line 7
    :goto_0
    add-int/lit8 v1, v1, -0x1

    .line 8
    .line 9
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzb:I

    .line 10
    .line 11
    if-lt v1, v2, :cond_0

    .line 12
    .line 13
    if-lez p1, :cond_0

    .line 14
    .line 15
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zza:[Lcom/google/android/libraries/places/internal/zzbtt;

    .line 16
    .line 17
    aget-object v2, v2, v1

    .line 18
    .line 19
    iget v2, v2, Lcom/google/android/libraries/places/internal/zzbtt;->zzj:I

    .line 20
    .line 21
    sub-int/2addr p1, v2

    .line 22
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzd:I

    .line 23
    .line 24
    sub-int/2addr v3, v2

    .line 25
    iput v3, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzd:I

    .line 26
    .line 27
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzc:I

    .line 28
    .line 29
    add-int/lit8 v2, v2, -0x1

    .line 30
    .line 31
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzc:I

    .line 32
    .line 33
    add-int/lit8 v0, v0, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zza:[Lcom/google/android/libraries/places/internal/zzbtt;

    .line 37
    .line 38
    add-int/lit8 v2, v2, 0x1

    .line 39
    .line 40
    add-int v1, v2, v0

    .line 41
    .line 42
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzc:I

    .line 43
    .line 44
    invoke-static {p1, v2, p1, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 45
    .line 46
    .line 47
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzb:I

    .line 48
    .line 49
    add-int/2addr p1, v0

    .line 50
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzb:I

    .line 51
    .line 52
    :cond_1
    return v0
.end method

.method private final zzh()I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzf:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbwd;->zzc()B

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    and-int/lit16 p0, p0, 0xff

    .line 8
    .line 9
    return p0
.end method

.method private final zzi(I)Lcom/google/android/libraries/places/internal/zzbwf;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbtu;->zzm(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbtw;->zzd()[Lcom/google/android/libraries/places/internal/zzbtt;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    aget-object p0, p0, p1

    .line 12
    .line 13
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbtt;->zzh:Lcom/google/android/libraries/places/internal/zzbwf;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbtw;->zzd()[Lcom/google/android/libraries/places/internal/zzbtt;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    array-length v0, v0

    .line 21
    add-int/lit8 v0, p1, -0x3d

    .line 22
    .line 23
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzbtu;->zzf(I)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-ltz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zza:[Lcom/google/android/libraries/places/internal/zzbtt;

    .line 30
    .line 31
    array-length v1, p0

    .line 32
    if-ge v0, v1, :cond_1

    .line 33
    .line 34
    aget-object p0, p0, v0

    .line 35
    .line 36
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbtt;->zzh:Lcom/google/android/libraries/places/internal/zzbwf;

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 40
    .line 41
    const-string p0, "Header index too large "

    .line 42
    .line 43
    invoke-static {p0, p1}, Ll/p3r0;->a(Ljava/lang/String;I)V

    .line 44
    .line 45
    .line 46
    const/4 p0, 0x0

    .line 47
    return-object p0
.end method

.method private final zzj()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzh:I

    .line 2
    .line 3
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzd:I

    .line 4
    .line 5
    if-ge v0, v1, :cond_1

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbtu;->zzk()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sub-int/2addr v1, v0

    .line 14
    invoke-direct {p0, v1}, Lcom/google/android/libraries/places/internal/zzbtu;->zzg(I)I

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method private final zzk()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zza:[Lcom/google/android/libraries/places/internal/zzbtt;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zza:[Lcom/google/android/libraries/places/internal/zzbtt;

    .line 8
    .line 9
    array-length v0, v0

    .line 10
    add-int/lit8 v0, v0, -0x1

    .line 11
    .line 12
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzb:I

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzc:I

    .line 16
    .line 17
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzd:I

    .line 18
    .line 19
    return-void
.end method

.method private final zzl(ILcom/google/android/libraries/places/internal/zzbtt;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zze:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget p1, p2, Lcom/google/android/libraries/places/internal/zzbtt;->zzj:I

    .line 7
    .line 8
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzh:I

    .line 9
    .line 10
    if-le p1, v0, :cond_0

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbtu;->zzk()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzd:I

    .line 17
    .line 18
    add-int/2addr v1, p1

    .line 19
    sub-int/2addr v1, v0

    .line 20
    invoke-direct {p0, v1}, Lcom/google/android/libraries/places/internal/zzbtu;->zzg(I)I

    .line 21
    .line 22
    .line 23
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzc:I

    .line 24
    .line 25
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zza:[Lcom/google/android/libraries/places/internal/zzbtt;

    .line 28
    .line 29
    array-length v2, v1

    .line 30
    if-le v0, v2, :cond_1

    .line 31
    .line 32
    add-int v0, v2, v2

    .line 33
    .line 34
    new-array v0, v0, [Lcom/google/android/libraries/places/internal/zzbtt;

    .line 35
    .line 36
    const/4 v3, 0x0

    .line 37
    invoke-static {v1, v3, v0, v2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zza:[Lcom/google/android/libraries/places/internal/zzbtt;

    .line 41
    .line 42
    array-length v1, v1

    .line 43
    add-int/lit8 v1, v1, -0x1

    .line 44
    .line 45
    iput v1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzb:I

    .line 46
    .line 47
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zza:[Lcom/google/android/libraries/places/internal/zzbtt;

    .line 48
    .line 49
    :cond_1
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzb:I

    .line 50
    .line 51
    add-int/lit8 v1, v0, -0x1

    .line 52
    .line 53
    iput v1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzb:I

    .line 54
    .line 55
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zza:[Lcom/google/android/libraries/places/internal/zzbtt;

    .line 56
    .line 57
    aput-object p2, v1, v0

    .line 58
    .line 59
    iget p2, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzc:I

    .line 60
    .line 61
    add-int/lit8 p2, p2, 0x1

    .line 62
    .line 63
    iput p2, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzc:I

    .line 64
    .line 65
    iget p2, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzd:I

    .line 66
    .line 67
    add-int/2addr p2, p1

    .line 68
    iput p2, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzd:I

    .line 69
    .line 70
    return-void
.end method

.method private static final zzm(I)Z
    .locals 1

    .line 1
    if-ltz p0, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbtw;->zzd()[Lcom/google/android/libraries/places/internal/zzbtt;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    array-length v0, v0

    .line 8
    const/16 v0, 0x3c

    .line 9
    .line 10
    if-gt p0, v0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method


# virtual methods
.method public final zza(II)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    and-int/2addr p1, p2

    .line 2
    if-lt p1, p2, :cond_1

    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    :goto_0
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbtu;->zzh()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    and-int/lit16 v1, v0, 0x80

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    and-int/lit8 v0, v0, 0x7f

    .line 14
    .line 15
    shl-int/2addr v0, p1

    .line 16
    add-int/2addr p2, v0

    .line 17
    add-int/lit8 p1, p1, 0x7

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    shl-int p0, v0, p1

    .line 21
    .line 22
    add-int/2addr p2, p0

    .line 23
    return p2

    .line 24
    :cond_1
    return p1
.end method

.method public final zzb()Ljava/util/List;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zze:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zze:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public final zzc()Lcom/google/android/libraries/places/internal/zzbwf;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbtu;->zzh()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    and-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    const/16 v2, 0x7f

    .line 8
    .line 9
    invoke-virtual {p0, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtu;->zza(II)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    int-to-long v2, v0

    .line 14
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzf:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 15
    .line 16
    const/16 v0, 0x80

    .line 17
    .line 18
    if-ne v1, v0, :cond_0

    .line 19
    .line 20
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbud;->zza()Lcom/google/android/libraries/places/internal/zzbud;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast p0, Lcom/google/android/libraries/places/internal/zzbwl;

    .line 25
    .line 26
    invoke-virtual {p0, v2, v3}, Lcom/google/android/libraries/places/internal/zzbwl;->zzD(J)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwl;->zzb:Lcom/google/android/libraries/places/internal/zzbwb;

    .line 30
    .line 31
    invoke-virtual {p0, v2, v3}, Lcom/google/android/libraries/places/internal/zzbwb;->zzH(J)[B

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lcom/google/android/libraries/places/internal/zzbud;->zzb([B)[B

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbwf;->zza:Lcom/google/android/libraries/places/internal/zzbwe;

    .line 40
    .line 41
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbwe;->zzb([B)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_0
    invoke-interface {p0, v2, v3}, Lcom/google/android/libraries/places/internal/zzbwd;->zzy(J)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public final zzd(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzg:I

    .line 2
    .line 3
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzh:I

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbtu;->zzj()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final zze()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :goto_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzf:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 2
    .line 3
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbwl;

    .line 4
    .line 5
    iget-boolean v1, v0, Lcom/google/android/libraries/places/internal/zzbwl;->zzc:Z

    .line 6
    .line 7
    if-nez v1, :cond_c

    .line 8
    .line 9
    iget-object v1, v0, Lcom/google/android/libraries/places/internal/zzbwl;->zzb:Lcom/google/android/libraries/places/internal/zzbwb;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbwb;->zzG()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbwl;->zza:Lcom/google/android/libraries/places/internal/zzbws;

    .line 18
    .line 19
    const-wide/16 v2, 0x2000

    .line 20
    .line 21
    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/libraries/places/internal/zzbws;->zza(Lcom/google/android/libraries/places/internal/zzbwb;J)J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    const-wide/16 v2, -0x1

    .line 26
    .line 27
    cmp-long v0, v0, v2

    .line 28
    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    return-void

    .line 33
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzf:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 34
    .line 35
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbwd;->zzc()B

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    and-int/lit16 v1, v0, 0xff

    .line 40
    .line 41
    const/16 v2, 0x80

    .line 42
    .line 43
    if-eq v1, v2, :cond_b

    .line 44
    .line 45
    and-int/lit16 v3, v0, 0x80

    .line 46
    .line 47
    const/4 v4, -0x1

    .line 48
    if-ne v3, v2, :cond_4

    .line 49
    .line 50
    const/16 v0, 0x7f

    .line 51
    .line 52
    invoke-virtual {p0, v1, v0}, Lcom/google/android/libraries/places/internal/zzbtu;->zza(II)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    add-int/lit8 v1, v0, -0x1

    .line 57
    .line 58
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbtu;->zzm(I)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_2

    .line 63
    .line 64
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbtw;->zzd()[Lcom/google/android/libraries/places/internal/zzbtt;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    aget-object v0, v0, v1

    .line 69
    .line 70
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zze:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbtw;->zzd()[Lcom/google/android/libraries/places/internal/zzbtt;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    array-length v1, v1

    .line 81
    add-int/lit8 v1, v0, -0x3e

    .line 82
    .line 83
    invoke-direct {p0, v1}, Lcom/google/android/libraries/places/internal/zzbtu;->zzf(I)I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-ltz v1, :cond_3

    .line 88
    .line 89
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zza:[Lcom/google/android/libraries/places/internal/zzbtt;

    .line 90
    .line 91
    array-length v3, v2

    .line 92
    add-int/2addr v3, v4

    .line 93
    if-gt v1, v3, :cond_3

    .line 94
    .line 95
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zze:Ljava/util/List;

    .line 96
    .line 97
    aget-object v1, v2, v1

    .line 98
    .line 99
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_3
    const-string p0, "Header index too large "

    .line 104
    .line 105
    invoke-static {p0, v0}, Ll/p3r0;->a(Ljava/lang/String;I)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_4
    const/16 v2, 0x40

    .line 110
    .line 111
    if-ne v1, v2, :cond_5

    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbtu;->zzc()Lcom/google/android/libraries/places/internal/zzbwf;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbtw;->zzc(Lcom/google/android/libraries/places/internal/zzbwf;)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbtu;->zzc()Lcom/google/android/libraries/places/internal/zzbwf;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 125
    .line 126
    invoke-direct {v2, v0, v1}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Lcom/google/android/libraries/places/internal/zzbwf;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 127
    .line 128
    .line 129
    invoke-direct {p0, v4, v2}, Lcom/google/android/libraries/places/internal/zzbtu;->zzl(ILcom/google/android/libraries/places/internal/zzbtt;)V

    .line 130
    .line 131
    .line 132
    goto/16 :goto_0

    .line 133
    .line 134
    :cond_5
    and-int/lit8 v3, v0, 0x40

    .line 135
    .line 136
    if-ne v3, v2, :cond_6

    .line 137
    .line 138
    const/16 v0, 0x3f

    .line 139
    .line 140
    invoke-virtual {p0, v1, v0}, Lcom/google/android/libraries/places/internal/zzbtu;->zza(II)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    add-int/2addr v0, v4

    .line 145
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzbtu;->zzi(I)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbtu;->zzc()Lcom/google/android/libraries/places/internal/zzbwf;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 154
    .line 155
    invoke-direct {v2, v0, v1}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Lcom/google/android/libraries/places/internal/zzbwf;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 156
    .line 157
    .line 158
    invoke-direct {p0, v4, v2}, Lcom/google/android/libraries/places/internal/zzbtu;->zzl(ILcom/google/android/libraries/places/internal/zzbtt;)V

    .line 159
    .line 160
    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :cond_6
    and-int/lit8 v0, v0, 0x20

    .line 164
    .line 165
    const/16 v2, 0x20

    .line 166
    .line 167
    if-ne v0, v2, :cond_8

    .line 168
    .line 169
    const/16 v0, 0x1f

    .line 170
    .line 171
    invoke-virtual {p0, v1, v0}, Lcom/google/android/libraries/places/internal/zzbtu;->zza(II)I

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzh:I

    .line 176
    .line 177
    if-ltz v0, :cond_7

    .line 178
    .line 179
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zzg:I

    .line 180
    .line 181
    if-gt v0, v1, :cond_7

    .line 182
    .line 183
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbtu;->zzj()V

    .line 184
    .line 185
    .line 186
    goto/16 :goto_0

    .line 187
    .line 188
    :cond_7
    const-string p0, "Invalid dynamic table size update "

    .line 189
    .line 190
    invoke-static {p0, v0}, Ll/p3r0;->a(Ljava/lang/String;I)V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :cond_8
    const/16 v0, 0x10

    .line 195
    .line 196
    if-eq v1, v0, :cond_a

    .line 197
    .line 198
    if-nez v1, :cond_9

    .line 199
    .line 200
    goto :goto_2

    .line 201
    :cond_9
    const/16 v0, 0xf

    .line 202
    .line 203
    invoke-virtual {p0, v1, v0}, Lcom/google/android/libraries/places/internal/zzbtu;->zza(II)I

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    add-int/2addr v0, v4

    .line 208
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzbtu;->zzi(I)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbtu;->zzc()Lcom/google/android/libraries/places/internal/zzbwf;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zze:Ljava/util/List;

    .line 217
    .line 218
    new-instance v3, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 219
    .line 220
    invoke-direct {v3, v0, v1}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Lcom/google/android/libraries/places/internal/zzbwf;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 221
    .line 222
    .line 223
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    goto/16 :goto_0

    .line 227
    .line 228
    :cond_a
    :goto_2
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbtu;->zzc()Lcom/google/android/libraries/places/internal/zzbwf;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbtw;->zzc(Lcom/google/android/libraries/places/internal/zzbwf;)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 233
    .line 234
    .line 235
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbtu;->zzc()Lcom/google/android/libraries/places/internal/zzbwf;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbtu;->zze:Ljava/util/List;

    .line 240
    .line 241
    new-instance v3, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 242
    .line 243
    invoke-direct {v3, v0, v1}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Lcom/google/android/libraries/places/internal/zzbwf;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 244
    .line 245
    .line 246
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 247
    .line 248
    .line 249
    goto/16 :goto_0

    .line 250
    .line 251
    :cond_b
    const-string p0, "index == 0"

    .line 252
    .line 253
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    return-void

    .line 257
    :cond_c
    const-string p0, "closed"

    .line 258
    .line 259
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    return-void
.end method
