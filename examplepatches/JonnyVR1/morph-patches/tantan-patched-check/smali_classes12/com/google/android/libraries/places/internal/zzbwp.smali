.class public final Lcom/google/android/libraries/places/internal/zzbwp;
.super Lcom/google/android/libraries/places/internal/zzbwf;
.source "SourceFile"


# annotations
.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field private final transient zzc:[[B
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final transient zzd:[I
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>([[B[I)V
    .locals 1
    .param p1    # [[B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # [I
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbwf;->zzb:Lcom/google/android/libraries/places/internal/zzbwf;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbwf;->zzn()[B

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzbwf;-><init>([B)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzc:[[B

    .line 17
    .line 18
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzd:[I

    .line 19
    .line 20
    return-void
.end method

.method private final zzs()Lcom/google/android/libraries/places/internal/zzbwf;
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbwf;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwf;->zzp()[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Lcom/google/android/libraries/places/internal/zzbwf;-><init>([B)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/google/android/libraries/places/internal/zzbwf;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_2

    .line 9
    .line 10
    check-cast p1, Lcom/google/android/libraries/places/internal/zzbwf;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbwf;->zzc()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwf;->zzc()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-ne v1, v3, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwf;->zzc()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {p0, v2, p1, v2, v1}, Lcom/google/android/libraries/places/internal/zzbwf;->zzk(ILcom/google/android/libraries/places/internal/zzbwf;II)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    return v2

    .line 33
    :cond_1
    return v0

    .line 34
    :cond_2
    return v2
.end method

.method public final hashCode()I
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwf;->zzb()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzc:[[B

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    move v3, v2

    .line 13
    move v2, v1

    .line 14
    :goto_0
    array-length v4, v0

    .line 15
    if-ge v1, v4, :cond_2

    .line 16
    .line 17
    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzd:[I

    .line 18
    .line 19
    iget-object v6, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzc:[[B

    .line 20
    .line 21
    add-int/2addr v4, v1

    .line 22
    aget v4, v5, v4

    .line 23
    .line 24
    aget v5, v5, v1

    .line 25
    .line 26
    sub-int v2, v5, v2

    .line 27
    .line 28
    add-int/2addr v2, v4

    .line 29
    aget-object v6, v6, v1

    .line 30
    .line 31
    :goto_1
    if-ge v4, v2, :cond_1

    .line 32
    .line 33
    mul-int/lit8 v3, v3, 0x1f

    .line 34
    .line 35
    aget-byte v7, v6, v4

    .line 36
    .line 37
    add-int/2addr v3, v7

    .line 38
    add-int/lit8 v4, v4, 0x1

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 42
    .line 43
    move v2, v5

    .line 44
    goto :goto_0

    .line 45
    :cond_2
    invoke-virtual {p0, v3}, Lcom/google/android/libraries/places/internal/zzbwf;->zzh(I)V

    .line 46
    .line 47
    .line 48
    return v3
.end method

.method public final toString()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbwp;->zzs()Lcom/google/android/libraries/places/internal/zzbwf;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwf;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final zza(I)B
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzc:[[B

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzd:[I

    .line 5
    .line 6
    add-int/lit8 v0, v0, -0x1

    .line 7
    .line 8
    aget v0, v1, v0

    .line 9
    .line 10
    int-to-long v1, v0

    .line 11
    int-to-long v3, p1

    .line 12
    const-wide/16 v5, 0x1

    .line 13
    .line 14
    invoke-static/range {v1 .. v6}, Lcom/google/android/libraries/places/internal/zzbvv;->zzb(JJJ)V

    .line 15
    .line 16
    .line 17
    invoke-static {p0, p1}, Lcom/google/android/libraries/places/internal/zzbwz;->zza(Lcom/google/android/libraries/places/internal/zzbwp;I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzd:[I

    .line 26
    .line 27
    add-int/lit8 v2, v0, -0x1

    .line 28
    .line 29
    aget v1, v1, v2

    .line 30
    .line 31
    :goto_0
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzd:[I

    .line 32
    .line 33
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzc:[[B

    .line 34
    .line 35
    sub-int/2addr p1, v1

    .line 36
    array-length v1, p0

    .line 37
    add-int/2addr v1, v0

    .line 38
    aget v1, v2, v1

    .line 39
    .line 40
    add-int/2addr p1, v1

    .line 41
    aget-object p0, p0, v0

    .line 42
    .line 43
    aget-byte p0, p0, p1

    .line 44
    .line 45
    return p0
.end method

.method public final zzc()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzc:[[B

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzd:[I

    .line 5
    .line 6
    add-int/lit8 v0, v0, -0x1

    .line 7
    .line 8
    aget p0, p0, v0

    .line 9
    .line 10
    return p0
.end method

.method public final zze()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbwp;->zzs()Lcom/google/android/libraries/places/internal/zzbwf;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwf;->zze()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final zzg()Lcom/google/android/libraries/places/internal/zzbwf;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbwp;->zzs()Lcom/google/android/libraries/places/internal/zzbwf;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwf;->zzg()Lcom/google/android/libraries/places/internal/zzbwf;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final zzj(Lcom/google/android/libraries/places/internal/zzbwb;II)V
    .locals 11
    .param p1    # Lcom/google/android/libraries/places/internal/zzbwb;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    invoke-static {p0, p2}, Lcom/google/android/libraries/places/internal/zzbwz;->zza(Lcom/google/android/libraries/places/internal/zzbwp;I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    move v1, p2

    .line 10
    :goto_0
    if-ge v1, p3, :cond_2

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    move v0, p2

    .line 15
    move v2, v0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzd:[I

    .line 18
    .line 19
    add-int/lit8 v3, v0, -0x1

    .line 20
    .line 21
    aget v2, v2, v3

    .line 22
    .line 23
    :goto_1
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzd:[I

    .line 24
    .line 25
    aget v4, v3, v0

    .line 26
    .line 27
    sub-int/2addr v4, v2

    .line 28
    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzc:[[B

    .line 29
    .line 30
    add-int/2addr v4, v2

    .line 31
    array-length v5, v5

    .line 32
    add-int/2addr v5, v0

    .line 33
    aget v3, v3, v5

    .line 34
    .line 35
    invoke-static {p3, v4}, Ljava/lang/Math;->min(II)I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    sub-int/2addr v4, v1

    .line 40
    sub-int v2, v1, v2

    .line 41
    .line 42
    add-int v7, v3, v2

    .line 43
    .line 44
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzc:[[B

    .line 45
    .line 46
    add-int v8, v7, v4

    .line 47
    .line 48
    aget-object v6, v2, v0

    .line 49
    .line 50
    new-instance v5, Lcom/google/android/libraries/places/internal/zzbwn;

    .line 51
    .line 52
    const/4 v9, 0x1

    .line 53
    const/4 v10, 0x0

    .line 54
    invoke-direct/range {v5 .. v10}, Lcom/google/android/libraries/places/internal/zzbwn;-><init>([BIIZZ)V

    .line 55
    .line 56
    .line 57
    iget-object v2, p1, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 58
    .line 59
    if-nez v2, :cond_1

    .line 60
    .line 61
    iput-object v5, v5, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 62
    .line 63
    iput-object v5, v5, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 64
    .line 65
    iput-object v5, p1, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_1
    iget-object v2, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 69
    .line 70
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2, v5}, Lcom/google/android/libraries/places/internal/zzbwn;->zzb(Lcom/google/android/libraries/places/internal/zzbwn;)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 74
    .line 75
    .line 76
    :goto_2
    add-int/2addr v1, v4

    .line 77
    add-int/lit8 v0, v0, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_2
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbwb;->zzg()J

    .line 81
    .line 82
    .line 83
    move-result-wide v0

    .line 84
    int-to-long p2, p3

    .line 85
    add-long/2addr v0, p2

    .line 86
    invoke-virtual {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzbwb;->zzE(J)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final zzk(ILcom/google/android/libraries/places/internal/zzbwf;II)Z
    .locals 6
    .param p2    # Lcom/google/android/libraries/places/internal/zzbwf;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwf;->zzc()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    sub-int/2addr p1, p4

    .line 9
    const/4 p3, 0x0

    .line 10
    if-gez p1, :cond_0

    .line 11
    .line 12
    return p3

    .line 13
    :cond_0
    invoke-static {p0, p3}, Lcom/google/android/libraries/places/internal/zzbwz;->zza(Lcom/google/android/libraries/places/internal/zzbwp;I)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    move v0, p3

    .line 18
    move v1, v0

    .line 19
    :goto_0
    if-ge v0, p4, :cond_3

    .line 20
    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    move p1, p3

    .line 24
    move v2, p1

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzd:[I

    .line 27
    .line 28
    add-int/lit8 v3, p1, -0x1

    .line 29
    .line 30
    aget v2, v2, v3

    .line 31
    .line 32
    :goto_1
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzd:[I

    .line 33
    .line 34
    aget v4, v3, p1

    .line 35
    .line 36
    sub-int/2addr v4, v2

    .line 37
    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzc:[[B

    .line 38
    .line 39
    add-int/2addr v4, v2

    .line 40
    array-length v5, v5

    .line 41
    add-int/2addr v5, p1

    .line 42
    aget v3, v3, v5

    .line 43
    .line 44
    invoke-static {p4, v4}, Ljava/lang/Math;->min(II)I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    sub-int/2addr v4, v0

    .line 49
    sub-int v2, v0, v2

    .line 50
    .line 51
    add-int/2addr v3, v2

    .line 52
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzc:[[B

    .line 53
    .line 54
    aget-object v2, v2, p1

    .line 55
    .line 56
    invoke-virtual {p2, v1, v2, v3, v4}, Lcom/google/android/libraries/places/internal/zzbwf;->zzl(I[BII)Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-nez v2, :cond_2

    .line 61
    .line 62
    return p3

    .line 63
    :cond_2
    add-int/2addr v1, v4

    .line 64
    add-int/2addr v0, v4

    .line 65
    add-int/lit8 p1, p1, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    const/4 p0, 0x1

    .line 69
    return p0
.end method

.method public final zzl(I[BII)Z
    .locals 6
    .param p2    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-ltz p1, :cond_4

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwf;->zzc()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-int/2addr v1, p4

    .line 12
    if-gt p1, v1, :cond_4

    .line 13
    .line 14
    if-ltz p3, :cond_4

    .line 15
    .line 16
    array-length v1, p2

    .line 17
    sub-int/2addr v1, p4

    .line 18
    if-le p3, v1, :cond_0

    .line 19
    .line 20
    return v0

    .line 21
    :cond_0
    add-int/2addr p4, p1

    .line 22
    invoke-static {p0, p1}, Lcom/google/android/libraries/places/internal/zzbwz;->zza(Lcom/google/android/libraries/places/internal/zzbwp;I)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    :goto_0
    if-ge p1, p4, :cond_3

    .line 27
    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    move v1, v0

    .line 31
    move v2, v1

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzd:[I

    .line 34
    .line 35
    add-int/lit8 v3, v1, -0x1

    .line 36
    .line 37
    aget v2, v2, v3

    .line 38
    .line 39
    :goto_1
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzd:[I

    .line 40
    .line 41
    aget v4, v3, v1

    .line 42
    .line 43
    sub-int/2addr v4, v2

    .line 44
    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzc:[[B

    .line 45
    .line 46
    add-int/2addr v4, v2

    .line 47
    array-length v5, v5

    .line 48
    add-int/2addr v5, v1

    .line 49
    aget v3, v3, v5

    .line 50
    .line 51
    invoke-static {p4, v4}, Ljava/lang/Math;->min(II)I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    sub-int/2addr v4, p1

    .line 56
    sub-int v2, p1, v2

    .line 57
    .line 58
    add-int/2addr v3, v2

    .line 59
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzc:[[B

    .line 60
    .line 61
    aget-object v2, v2, v1

    .line 62
    .line 63
    invoke-static {v2, v3, p2, p3, v4}, Lcom/google/android/libraries/places/internal/zzbvv;->zzc([BI[BII)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-nez v2, :cond_2

    .line 68
    .line 69
    return v0

    .line 70
    :cond_2
    add-int/2addr p3, v4

    .line 71
    add-int/2addr p1, v4

    .line 72
    add-int/lit8 v1, v1, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    const/4 p0, 0x1

    .line 76
    return p0

    .line 77
    :cond_4
    return v0
.end method

.method public final zzo()[B
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwf;->zzp()[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final zzp()[B
    .locals 8
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwf;->zzc()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-array v0, v0, [B

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    move v3, v2

    .line 10
    :goto_0
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzc:[[B

    .line 11
    .line 12
    array-length v5, v4

    .line 13
    if-ge v1, v5, :cond_0

    .line 14
    .line 15
    iget-object v6, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzd:[I

    .line 16
    .line 17
    add-int/2addr v5, v1

    .line 18
    aget v5, v6, v5

    .line 19
    .line 20
    aget v6, v6, v1

    .line 21
    .line 22
    aget-object v4, v4, v1

    .line 23
    .line 24
    sub-int v2, v6, v2

    .line 25
    .line 26
    add-int v7, v5, v2

    .line 27
    .line 28
    invoke-static {v4, v0, v3, v5, v7}, Lkotlin/collections/ArraysKt;->copyInto([B[BIII)[B

    .line 29
    .line 30
    .line 31
    add-int/2addr v3, v2

    .line 32
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    move v2, v6

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return-object v0
.end method

.method public final zzq()[I
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzd:[I

    return-object p0
.end method

.method public final zzr()[[B
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwp;->zzc:[[B

    return-object p0
.end method
