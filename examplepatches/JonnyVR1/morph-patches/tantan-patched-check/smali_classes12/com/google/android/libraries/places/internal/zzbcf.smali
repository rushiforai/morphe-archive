.class public final Lcom/google/android/libraries/places/internal/zzbcf;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final zza:Lcom/google/android/libraries/places/internal/zzbby;

.field public static final zzb:Lcom/google/android/libraries/places/internal/zzbbx;

.field static final zzc:Lcom/google/android/libraries/places/internal/zzsi;

.field private static final zzd:Ljava/util/logging/Logger;


# instance fields
.field private zze:[Ljava/lang/Object;

.field private zzf:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lcom/google/android/libraries/places/internal/zzbcf;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbcf;->zzd:Ljava/util/logging/Logger;

    .line 12
    .line 13
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbbt;

    .line 14
    .line 15
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzbbt;-><init>()V

    .line 16
    .line 17
    .line 18
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbcf;->zza:Lcom/google/android/libraries/places/internal/zzbby;

    .line 19
    .line 20
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbbu;

    .line 21
    .line 22
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzbbu;-><init>()V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbcf;->zzb:Lcom/google/android/libraries/places/internal/zzbbx;

    .line 26
    .line 27
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzsi;->zzj()Lcom/google/android/libraries/places/internal/zzsi;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzsi;->zzf()Lcom/google/android/libraries/places/internal/zzsi;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbcf;->zzc:Lcom/google/android/libraries/places/internal/zzsi;

    .line 36
    .line 37
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(I[Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zze:[Ljava/lang/Object;

    return-void
.end method

.method public static bridge synthetic zzc()Ljava/util/logging/Logger;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzbcf;->zzd:Ljava/util/logging/Logger;

    return-object v0
.end method

.method private final zzh()I
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zze:[Ljava/lang/Object;

    if-eqz p0, :cond_0

    array-length p0, p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private final zzi(I)Ljava/lang/Object;
    .locals 0

    .line 1
    add-int/2addr p1, p1

    .line 2
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zze:[Ljava/lang/Object;

    .line 3
    .line 4
    add-int/lit8 p1, p1, 0x1

    .line 5
    .line 6
    aget-object p0, p0, p1

    .line 7
    .line 8
    return-object p0
.end method

.method private final zzj(I)V
    .locals 3

    .line 1
    new-array p1, p1, [Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbcf;->zzk()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zze:[Ljava/lang/Object;

    .line 10
    .line 11
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 12
    .line 13
    add-int/2addr v1, v1

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-static {v0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zze:[Ljava/lang/Object;

    .line 19
    .line 20
    return-void
.end method

.method private final zzk()Z
    .locals 0

    iget p0, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private final zzl(I)[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zze:[Ljava/lang/Object;

    .line 2
    .line 3
    add-int/2addr p1, p1

    .line 4
    aget-object p0, p0, p1

    .line 5
    .line 6
    check-cast p0, [B

    .line 7
    .line 8
    return-object p0
.end method

.method private final zzm(I)[B
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/libraries/places/internal/zzbcf;->zzi(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p1, p0, [B

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    check-cast p0, [B

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    check-cast p0, Lcom/google/android/libraries/places/internal/zzbcb;

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    throw p0
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Metadata("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    move v2, v1

    .line 10
    :goto_0
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 11
    .line 12
    if-ge v2, v3, :cond_2

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    const/16 v3, 0x2c

    .line 17
    .line 18
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    :cond_0
    new-instance v3, Ljava/lang/String;

    .line 22
    .line 23
    invoke-direct {p0, v2}, Lcom/google/android/libraries/places/internal/zzbcf;->zzl(I)[B

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    sget-object v5, Lcom/google/android/libraries/places/internal/zzmb;->zza:Ljava/nio/charset/Charset;

    .line 28
    .line 29
    invoke-direct {v3, v4, v5}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const/16 v4, 0x3d

    .line 36
    .line 37
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v4, "-bin"

    .line 41
    .line 42
    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_1

    .line 47
    .line 48
    sget-object v3, Lcom/google/android/libraries/places/internal/zzbcf;->zzc:Lcom/google/android/libraries/places/internal/zzsi;

    .line 49
    .line 50
    invoke-direct {p0, v2}, Lcom/google/android/libraries/places/internal/zzbcf;->zzm(I)[B

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    array-length v5, v4

    .line 55
    invoke-virtual {v3, v4, v1, v5}, Lcom/google/android/libraries/places/internal/zzsi;->zzk([BII)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    new-instance v3, Ljava/lang/String;

    .line 64
    .line 65
    invoke-direct {p0, v2}, Lcom/google/android/libraries/places/internal/zzbcf;->zzm(I)[B

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-direct {v3, v4, v5}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    const/16 p0, 0x29

    .line 79
    .line 80
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0
.end method

.method public final zza()I
    .locals 0

    iget p0, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    return p0
.end method

.method public final zzb(Lcom/google/android/libraries/places/internal/zzbca;)Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 2
    .line 3
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-ltz v0, :cond_2

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbca;->zze()[B

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzbcf;->zzl(I)[B

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzbcf;->zzi(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    instance-of v0, p0, [B

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    check-cast p0, [B

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Lcom/google/android/libraries/places/internal/zzbca;->zza([B)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_1
    check-cast p0, Lcom/google/android/libraries/places/internal/zzbcb;

    .line 38
    .line 39
    throw v1

    .line 40
    :cond_2
    return-object v1
.end method

.method public final zzd(Lcom/google/android/libraries/places/internal/zzbca;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbcf;->zzk()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    move v1, v0

    .line 9
    :goto_0
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 10
    .line 11
    if-ge v0, v2, :cond_2

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbca;->zze()[B

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzbcf;->zzl(I)[B

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_1

    .line 26
    .line 27
    add-int v2, v1, v1

    .line 28
    .line 29
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzbcf;->zzl(I)[B

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zze:[Ljava/lang/Object;

    .line 34
    .line 35
    aput-object v3, v4, v2

    .line 36
    .line 37
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzbcf;->zzi(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zze:[Ljava/lang/Object;

    .line 42
    .line 43
    instance-of v4, v4, [[B

    .line 44
    .line 45
    if-eqz v4, :cond_0

    .line 46
    .line 47
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbcf;->zzh()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    invoke-direct {p0, v4}, Lcom/google/android/libraries/places/internal/zzbcf;->zzj(I)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zze:[Ljava/lang/Object;

    .line 55
    .line 56
    add-int/lit8 v2, v2, 0x1

    .line 57
    .line 58
    aput-object v3, v4, v2

    .line 59
    .line 60
    add-int/lit8 v1, v1, 0x1

    .line 61
    .line 62
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    add-int p1, v1, v1

    .line 66
    .line 67
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zze:[Ljava/lang/Object;

    .line 68
    .line 69
    add-int/2addr v2, v2

    .line 70
    const/4 v3, 0x0

    .line 71
    invoke-static {v0, p1, v2, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    iput v1, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 75
    .line 76
    :cond_3
    return-void
.end method

.method public final zze(Lcom/google/android/libraries/places/internal/zzbcf;)V
    .locals 5

    .line 1
    invoke-direct {p1}, Lcom/google/android/libraries/places/internal/zzbcf;->zzk()Z

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
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbcf;->zzh()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 13
    .line 14
    add-int/2addr v1, v1

    .line 15
    sub-int/2addr v0, v1

    .line 16
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbcf;->zzk()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-nez v2, :cond_1

    .line 21
    .line 22
    iget v2, p1, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 23
    .line 24
    add-int/2addr v2, v2

    .line 25
    if-ge v0, v2, :cond_2

    .line 26
    .line 27
    :cond_1
    iget v0, p1, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 28
    .line 29
    add-int/2addr v0, v0

    .line 30
    add-int/2addr v1, v0

    .line 31
    invoke-direct {p0, v1}, Lcom/google/android/libraries/places/internal/zzbcf;->zzj(I)V

    .line 32
    .line 33
    .line 34
    :cond_2
    iget-object v0, p1, Lcom/google/android/libraries/places/internal/zzbcf;->zze:[Ljava/lang/Object;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zze:[Ljava/lang/Object;

    .line 37
    .line 38
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 39
    .line 40
    add-int/2addr v2, v2

    .line 41
    iget v3, p1, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 42
    .line 43
    add-int/2addr v3, v3

    .line 44
    const/4 v4, 0x0

    .line 45
    invoke-static {v0, v4, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 46
    .line 47
    .line 48
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 49
    .line 50
    iget p1, p1, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 51
    .line 52
    add-int/2addr v0, p1

    .line 53
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 54
    .line 55
    return-void
.end method

.method public final zzf(Lcom/google/android/libraries/places/internal/zzbca;Ljava/lang/Object;)V
    .locals 3

    .line 1
    const-string v0, "key"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    const-string v0, "value"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 12
    .line 13
    add-int/2addr v0, v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbcf;->zzh()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-ne v0, v1, :cond_1

    .line 21
    .line 22
    :cond_0
    add-int/2addr v0, v0

    .line 23
    const/16 v1, 0x8

    .line 24
    .line 25
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzbcf;->zzj(I)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbca;->zze()[B

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zze:[Ljava/lang/Object;

    .line 39
    .line 40
    add-int/2addr v0, v0

    .line 41
    aput-object v1, v2, v0

    .line 42
    .line 43
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Lcom/google/android/libraries/places/internal/zzbca;->zzb(Ljava/lang/Object;)[B

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zze:[Ljava/lang/Object;

    .line 50
    .line 51
    add-int/2addr v0, v0

    .line 52
    add-int/lit8 v0, v0, 0x1

    .line 53
    .line 54
    aput-object p1, p2, v0

    .line 55
    .line 56
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 57
    .line 58
    add-int/lit8 p1, p1, 0x1

    .line 59
    .line 60
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 61
    .line 62
    return-void
.end method

.method public final zzg()[[B
    .locals 5

    .line 1
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 2
    .line 3
    add-int/2addr v0, v0

    .line 4
    new-array v1, v0, [[B

    .line 5
    .line 6
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zze:[Ljava/lang/Object;

    .line 7
    .line 8
    instance-of v3, v2, [[B

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    invoke-static {v2, v4, v1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 14
    .line 15
    .line 16
    return-object v1

    .line 17
    :cond_0
    :goto_0
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbcf;->zzf:I

    .line 18
    .line 19
    if-ge v4, v0, :cond_1

    .line 20
    .line 21
    invoke-direct {p0, v4}, Lcom/google/android/libraries/places/internal/zzbcf;->zzl(I)[B

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    add-int v2, v4, v4

    .line 26
    .line 27
    aput-object v0, v1, v2

    .line 28
    .line 29
    add-int/lit8 v2, v2, 0x1

    .line 30
    .line 31
    invoke-direct {p0, v4}, Lcom/google/android/libraries/places/internal/zzbcf;->zzm(I)[B

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    aput-object v0, v1, v2

    .line 36
    .line 37
    add-int/lit8 v4, v4, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return-object v1
.end method
