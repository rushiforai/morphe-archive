.class final Lcom/google/android/libraries/places/internal/zzbsu;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final zza:Lcom/google/android/libraries/places/internal/zzbsr;

.field private final zzb:Lcom/google/android/libraries/places/internal/zzbts;

.field private zzc:I

.field private final zzd:Lcom/google/android/libraries/places/internal/zzbsq;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbsr;Lcom/google/android/libraries/places/internal/zzbts;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbsu;->zza:Lcom/google/android/libraries/places/internal/zzbsr;

    .line 5
    .line 6
    const-string p1, "frameWriter"

    .line 7
    .line 8
    invoke-static {p2, p1}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbsu;->zzb:Lcom/google/android/libraries/places/internal/zzbts;

    .line 12
    .line 13
    const p1, 0xffff

    .line 14
    .line 15
    .line 16
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbsu;->zzc:I

    .line 17
    .line 18
    new-instance p2, Lcom/google/android/libraries/places/internal/zzbsq;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-direct {p2, p0, v0, p1, v1}, Lcom/google/android/libraries/places/internal/zzbsq;-><init>(Lcom/google/android/libraries/places/internal/zzbsu;IILcom/google/android/libraries/places/internal/zzbsp;)V

    .line 23
    .line 24
    .line 25
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbsu;->zzd:Lcom/google/android/libraries/places/internal/zzbsq;

    .line 26
    .line 27
    return-void
.end method

.method public static bridge synthetic zzb(Lcom/google/android/libraries/places/internal/zzbsu;)Lcom/google/android/libraries/places/internal/zzbsq;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbsu;->zzd:Lcom/google/android/libraries/places/internal/zzbsq;

    return-object p0
.end method

.method public static bridge synthetic zzd(Lcom/google/android/libraries/places/internal/zzbsu;)Lcom/google/android/libraries/places/internal/zzbts;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbsu;->zzb:Lcom/google/android/libraries/places/internal/zzbts;

    return-object p0
.end method


# virtual methods
.method public final zza(Lcom/google/android/libraries/places/internal/zzbsq;I)I
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbsu;->zzd:Lcom/google/android/libraries/places/internal/zzbsq;

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Lcom/google/android/libraries/places/internal/zzbsq;->zzb(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbsu;->zzg()V

    .line 10
    .line 11
    .line 12
    return p1

    .line 13
    :cond_0
    invoke-virtual {p1, p2}, Lcom/google/android/libraries/places/internal/zzbsq;->zzb(I)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbst;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-direct {v0, v1}, Lcom/google/android/libraries/places/internal/zzbst;-><init>(Lcom/google/android/libraries/places/internal/zzbss;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbsq;->zze()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {p1, v1, v0}, Lcom/google/android/libraries/places/internal/zzbsq;->zzf(ILcom/google/android/libraries/places/internal/zzbst;)I

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbst;->zza()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    return p2

    .line 37
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbsu;->zzf()V

    .line 38
    .line 39
    .line 40
    return p2
.end method

.method public final zzc(Lcom/google/android/libraries/places/internal/zzbsp;I)Lcom/google/android/libraries/places/internal/zzbsq;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbsq;

    .line 2
    .line 3
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbsu;->zzc:I

    .line 4
    .line 5
    invoke-direct {v0, p0, p2, v1, p1}, Lcom/google/android/libraries/places/internal/zzbsq;-><init>(Lcom/google/android/libraries/places/internal/zzbsu;IILcom/google/android/libraries/places/internal/zzbsp;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public final zze(ZLcom/google/android/libraries/places/internal/zzbsq;Lcom/google/android/libraries/places/internal/zzbwb;Z)V
    .locals 4

    .line 1
    const-string v0, "source"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzbsq;->zze()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzbsq;->zzk()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p3}, Lcom/google/android/libraries/places/internal/zzbwb;->zzg()J

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    long-to-int v2, v2

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    if-lt v0, v2, :cond_0

    .line 22
    .line 23
    invoke-virtual {p2, p3, v2, p1}, Lcom/google/android/libraries/places/internal/zzbsq;->zzj(Lcom/google/android/libraries/places/internal/zzbwb;IZ)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    if-nez v1, :cond_1

    .line 28
    .line 29
    if-lez v0, :cond_1

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-virtual {p2, p3, v0, v1}, Lcom/google/android/libraries/places/internal/zzbsq;->zzj(Lcom/google/android/libraries/places/internal/zzbwb;IZ)V

    .line 33
    .line 34
    .line 35
    :cond_1
    invoke-virtual {p3}, Lcom/google/android/libraries/places/internal/zzbwb;->zzg()J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    long-to-int v0, v0

    .line 40
    invoke-virtual {p2, p3, v0, p1}, Lcom/google/android/libraries/places/internal/zzbsq;->zzi(Lcom/google/android/libraries/places/internal/zzbwb;IZ)V

    .line 41
    .line 42
    .line 43
    :goto_0
    if-eqz p4, :cond_2

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbsu;->zzf()V

    .line 46
    .line 47
    .line 48
    :cond_2
    return-void
.end method

.method public final zzf()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbsu;->zzb:Lcom/google/android/libraries/places/internal/zzbts;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbts;->zzg()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final zzg()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbsu;->zza:Lcom/google/android/libraries/places/internal/zzbsr;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbsr;->zzV()[Lcom/google/android/libraries/places/internal/zzbsq;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v1}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    array-length v1, v0

    .line 15
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbsu;->zzd:Lcom/google/android/libraries/places/internal/zzbsq;

    .line 16
    .line 17
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzbsq;->zzd()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    :goto_0
    const/4 v3, 0x0

    .line 22
    if-lez v1, :cond_3

    .line 23
    .line 24
    if-lez v2, :cond_3

    .line 25
    .line 26
    int-to-float v4, v2

    .line 27
    int-to-float v5, v1

    .line 28
    div-float/2addr v4, v5

    .line 29
    float-to-double v4, v4

    .line 30
    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    .line 31
    .line 32
    .line 33
    move-result-wide v4

    .line 34
    double-to-int v4, v4

    .line 35
    move v5, v3

    .line 36
    :goto_1
    if-ge v5, v1, :cond_2

    .line 37
    .line 38
    if-lez v2, :cond_2

    .line 39
    .line 40
    aget-object v6, v0, v5

    .line 41
    .line 42
    invoke-virtual {v6}, Lcom/google/android/libraries/places/internal/zzbsq;->zzc()I

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    invoke-static {v7, v4}, Ljava/lang/Math;->min(II)I

    .line 47
    .line 48
    .line 49
    move-result v7

    .line 50
    invoke-static {v2, v7}, Ljava/lang/Math;->min(II)I

    .line 51
    .line 52
    .line 53
    move-result v7

    .line 54
    if-lez v7, :cond_0

    .line 55
    .line 56
    invoke-virtual {v6, v7}, Lcom/google/android/libraries/places/internal/zzbsq;->zzg(I)V

    .line 57
    .line 58
    .line 59
    sub-int/2addr v2, v7

    .line 60
    :cond_0
    invoke-virtual {v6}, Lcom/google/android/libraries/places/internal/zzbsq;->zzc()I

    .line 61
    .line 62
    .line 63
    move-result v7

    .line 64
    if-lez v7, :cond_1

    .line 65
    .line 66
    add-int/lit8 v7, v3, 0x1

    .line 67
    .line 68
    aput-object v6, v0, v3

    .line 69
    .line 70
    move v3, v7

    .line 71
    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    move v1, v3

    .line 75
    goto :goto_0

    .line 76
    :cond_3
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbst;

    .line 77
    .line 78
    const/4 v1, 0x0

    .line 79
    invoke-direct {v0, v1}, Lcom/google/android/libraries/places/internal/zzbst;-><init>(Lcom/google/android/libraries/places/internal/zzbss;)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbsu;->zza:Lcom/google/android/libraries/places/internal/zzbsr;

    .line 83
    .line 84
    invoke-interface {v1}, Lcom/google/android/libraries/places/internal/zzbsr;->zzV()[Lcom/google/android/libraries/places/internal/zzbsq;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    array-length v2, v1

    .line 89
    :goto_2
    if-ge v3, v2, :cond_4

    .line 90
    .line 91
    aget-object v4, v1, v3

    .line 92
    .line 93
    invoke-virtual {v4}, Lcom/google/android/libraries/places/internal/zzbsq;->zza()I

    .line 94
    .line 95
    .line 96
    move-result v5

    .line 97
    invoke-virtual {v4, v5, v0}, Lcom/google/android/libraries/places/internal/zzbsq;->zzf(ILcom/google/android/libraries/places/internal/zzbst;)I

    .line 98
    .line 99
    .line 100
    invoke-virtual {v4}, Lcom/google/android/libraries/places/internal/zzbsq;->zzh()V

    .line 101
    .line 102
    .line 103
    add-int/lit8 v3, v3, 0x1

    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_4
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbst;->zza()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_5

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbsu;->zzf()V

    .line 113
    .line 114
    .line 115
    :cond_5
    return-void
.end method

.method public final zzh(I)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-ltz p1, :cond_2

    .line 3
    .line 4
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbsu;->zzc:I

    .line 5
    .line 6
    sub-int v1, p1, v1

    .line 7
    .line 8
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbsu;->zzc:I

    .line 9
    .line 10
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbsu;->zza:Lcom/google/android/libraries/places/internal/zzbsr;

    .line 11
    .line 12
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbsr;->zzV()[Lcom/google/android/libraries/places/internal/zzbsq;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    array-length p1, p0

    .line 17
    move v2, v0

    .line 18
    :goto_0
    if-ge v2, p1, :cond_0

    .line 19
    .line 20
    aget-object v3, p0, v2

    .line 21
    .line 22
    invoke-virtual {v3, v1}, Lcom/google/android/libraries/places/internal/zzbsq;->zzb(I)I

    .line 23
    .line 24
    .line 25
    add-int/lit8 v2, v2, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    if-lez v1, :cond_1

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_1
    return v0

    .line 33
    :cond_2
    const-string p0, "Invalid initial window size: "

    .line 34
    .line 35
    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 36
    .line 37
    .line 38
    return v0
.end method
