.class public final Lcom/google/android/libraries/places/internal/zzbmw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzbis;


# instance fields
.field private final zza:Lcom/google/android/libraries/places/internal/zzbmv;

.field private zzb:I

.field private zzc:Lcom/google/android/libraries/places/internal/zzbra;

.field private zzd:Lcom/google/android/libraries/places/internal/zzazc;

.field private final zze:Lcom/google/android/libraries/places/internal/zzbmu;

.field private final zzf:Ljava/nio/ByteBuffer;

.field private final zzg:Lcom/google/android/libraries/places/internal/zzbrb;

.field private final zzh:Lcom/google/android/libraries/places/internal/zzbqo;

.field private zzi:Z

.field private zzj:I

.field private zzk:I

.field private zzl:J


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbmv;Lcom/google/android/libraries/places/internal/zzbrb;Lcom/google/android/libraries/places/internal/zzbqo;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzb:I

    .line 6
    .line 7
    sget-object v1, Lcom/google/android/libraries/places/internal/zzaza;->zza:Lcom/google/android/libraries/places/internal/zzazb;

    .line 8
    .line 9
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzd:Lcom/google/android/libraries/places/internal/zzazc;

    .line 10
    .line 11
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbmu;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-direct {v1, p0, v2}, Lcom/google/android/libraries/places/internal/zzbmu;-><init>(Lcom/google/android/libraries/places/internal/zzbmw;Lcom/google/android/libraries/places/internal/zzbmt;)V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zze:Lcom/google/android/libraries/places/internal/zzbmu;

    .line 18
    .line 19
    const/4 v1, 0x5

    .line 20
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzf:Ljava/nio/ByteBuffer;

    .line 25
    .line 26
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzk:I

    .line 27
    .line 28
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zza:Lcom/google/android/libraries/places/internal/zzbmv;

    .line 29
    .line 30
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzg:Lcom/google/android/libraries/places/internal/zzbrb;

    .line 31
    .line 32
    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzh:Lcom/google/android/libraries/places/internal/zzbqo;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic zzg(Lcom/google/android/libraries/places/internal/zzbmw;)Lcom/google/android/libraries/places/internal/zzbrb;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzg:Lcom/google/android/libraries/places/internal/zzbrb;

    return-object p0
.end method

.method public static bridge synthetic zzh(Lcom/google/android/libraries/places/internal/zzbmw;[BII)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/libraries/places/internal/zzbmw;->zzk([BII)V

    return-void
.end method

.method private final zzi(ZZ)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    .line 5
    .line 6
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzj:I

    .line 7
    .line 8
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zza:Lcom/google/android/libraries/places/internal/zzbmv;

    .line 9
    .line 10
    invoke-interface {v2, v0, p1, p2, v1}, Lcom/google/android/libraries/places/internal/zzbmv;->zzi(Lcom/google/android/libraries/places/internal/zzbra;ZZI)V

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzj:I

    .line 15
    .line 16
    return-void
.end method

.method private final zzj(Lcom/google/android/libraries/places/internal/zzbms;Z)V
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbms;->zza(Lcom/google/android/libraries/places/internal/zzbms;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzb:I

    .line 6
    .line 7
    if-ltz v1, :cond_1

    .line 8
    .line 9
    if-gt v0, v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget-object p1, Lcom/google/android/libraries/places/internal/zzbdo;->zzj:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 13
    .line 14
    sget-object p2, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 15
    .line 16
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget p0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzb:I

    .line 21
    .line 22
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v0, "message too large %d > %d"

    .line 31
    .line 32
    invoke-static {p2, v0, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, p0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance p1, Lcom/google/android/libraries/places/internal/zzbdq;

    .line 41
    .line 42
    const/4 p2, 0x0

    .line 43
    invoke-direct {p1, p0, p2}, Lcom/google/android/libraries/places/internal/zzbdq;-><init>(Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbcf;)V

    .line 44
    .line 45
    .line 46
    throw p1

    .line 47
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzf:Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzf:Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    invoke-virtual {v1, p2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 59
    .line 60
    .line 61
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzg:Lcom/google/android/libraries/places/internal/zzbrb;

    .line 62
    .line 63
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzf:Ljava/nio/ByteBuffer;

    .line 64
    .line 65
    const/4 v2, 0x5

    .line 66
    invoke-interface {p2, v2}, Lcom/google/android/libraries/places/internal/zzbrb;->zza(I)Lcom/google/android/libraries/places/internal/zzbra;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v1}, Ljava/nio/Buffer;->position()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    const/4 v3, 0x0

    .line 79
    invoke-interface {p2, v2, v3, v1}, Lcom/google/android/libraries/places/internal/zzbra;->zzd([BII)V

    .line 80
    .line 81
    .line 82
    if-nez v0, :cond_2

    .line 83
    .line 84
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zza:Lcom/google/android/libraries/places/internal/zzbmv;

    .line 88
    .line 89
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzj:I

    .line 90
    .line 91
    add-int/lit8 v2, v2, -0x1

    .line 92
    .line 93
    invoke-interface {v1, p2, v3, v3, v2}, Lcom/google/android/libraries/places/internal/zzbmv;->zzi(Lcom/google/android/libraries/places/internal/zzbra;ZZI)V

    .line 94
    .line 95
    .line 96
    const/4 p2, 0x1

    .line 97
    iput p2, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzj:I

    .line 98
    .line 99
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbms;->zzb(Lcom/google/android/libraries/places/internal/zzbms;)Ljava/util/List;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    move p2, v3

    .line 104
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    add-int/lit8 v1, v1, -0x1

    .line 109
    .line 110
    if-ge p2, v1, :cond_3

    .line 111
    .line 112
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zza:Lcom/google/android/libraries/places/internal/zzbmv;

    .line 113
    .line 114
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    check-cast v2, Lcom/google/android/libraries/places/internal/zzbra;

    .line 119
    .line 120
    invoke-interface {v1, v2, v3, v3, v3}, Lcom/google/android/libraries/places/internal/zzbmv;->zzi(Lcom/google/android/libraries/places/internal/zzbra;ZZI)V

    .line 121
    .line 122
    .line 123
    add-int/lit8 p2, p2, 0x1

    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 127
    .line 128
    .line 129
    move-result p2

    .line 130
    add-int/lit8 p2, p2, -0x1

    .line 131
    .line 132
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    check-cast p1, Lcom/google/android/libraries/places/internal/zzbra;

    .line 137
    .line 138
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    .line 139
    .line 140
    int-to-long p1, v0

    .line 141
    iput-wide p1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzl:J

    .line 142
    .line 143
    return-void
.end method

.method private final zzk([BII)V
    .locals 2

    .line 1
    :goto_0
    if-lez p3, :cond_2

    .line 2
    .line 3
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbra;->zzb()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-direct {p0, v0, v0}, Lcom/google/android/libraries/places/internal/zzbmw;->zzi(ZZ)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzg:Lcom/google/android/libraries/places/internal/zzbrb;

    .line 22
    .line 23
    invoke-interface {v0, p3}, Lcom/google/android/libraries/places/internal/zzbrb;->zza(I)Lcom/google/android/libraries/places/internal/zzbra;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    .line 30
    .line 31
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbra;->zzb()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    .line 40
    .line 41
    invoke-interface {v1, p1, p2, v0}, Lcom/google/android/libraries/places/internal/zzbra;->zzd([BII)V

    .line 42
    .line 43
    .line 44
    add-int/2addr p2, v0

    .line 45
    sub-int/2addr p3, v0

    .line 46
    goto :goto_0

    .line 47
    :cond_2
    return-void
.end method


# virtual methods
.method public final synthetic zza(Lcom/google/android/libraries/places/internal/zzazc;)Lcom/google/android/libraries/places/internal/zzbis;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzd:Lcom/google/android/libraries/places/internal/zzazc;

    return-object p0
.end method

.method public final zzb()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzi:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzi:Z

    .line 7
    .line 8
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-interface {v1}, Lcom/google/android/libraries/places/internal/zzbra;->zza()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    .line 20
    .line 21
    :cond_0
    invoke-direct {p0, v0, v0}, Lcom/google/android/libraries/places/internal/zzbmw;->zzi(ZZ)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public final zzc()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbra;->zza()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-direct {p0, v0, v1}, Lcom/google/android/libraries/places/internal/zzbmw;->zzi(ZZ)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final zzd(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzb:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    const-string v1, "max size already set"

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzb:I

    .line 15
    .line 16
    return-void
.end method

.method public final zze(Ljava/io/InputStream;)V
    .locals 8

    .line 1
    const-string v1, "Failed to frame message"

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzi:Z

    .line 4
    .line 5
    if-nez v0, :cond_9

    .line 6
    .line 7
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzj:I

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    add-int/2addr v0, v2

    .line 11
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzj:I

    .line 12
    .line 13
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzk:I

    .line 14
    .line 15
    add-int/2addr v0, v2

    .line 16
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzk:I

    .line 17
    .line 18
    const-wide/16 v3, 0x0

    .line 19
    .line 20
    iput-wide v3, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzl:J

    .line 21
    .line 22
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzh:Lcom/google/android/libraries/places/internal/zzbqo;

    .line 23
    .line 24
    invoke-virtual {v3, v0}, Lcom/google/android/libraries/places/internal/zzbqo;->zzi(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzd:Lcom/google/android/libraries/places/internal/zzazc;

    .line 28
    .line 29
    sget-object v3, Lcom/google/android/libraries/places/internal/zzaza;->zza:Lcom/google/android/libraries/places/internal/zzazb;

    .line 30
    .line 31
    const/4 v4, 0x0

    .line 32
    :try_start_0
    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    .line 33
    .line 34
    .line 35
    move-result v5
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/google/android/libraries/places/internal/zzbdq; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    const/4 v6, -0x1

    .line 37
    const-string v7, "message too large %d > %d"

    .line 38
    .line 39
    if-eqz v5, :cond_2

    .line 40
    .line 41
    if-eq v0, v3, :cond_2

    .line 42
    .line 43
    :try_start_1
    new-instance v3, Lcom/google/android/libraries/places/internal/zzbms;

    .line 44
    .line 45
    invoke-direct {v3, p0, v4}, Lcom/google/android/libraries/places/internal/zzbms;-><init>(Lcom/google/android/libraries/places/internal/zzbmw;Lcom/google/android/libraries/places/internal/zzbmr;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lcom/google/android/libraries/places/internal/zzbdq; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 46
    .line 47
    .line 48
    :try_start_2
    invoke-interface {p1, v3}, Lcom/google/android/libraries/places/internal/zzazr;->zza(Ljava/io/OutputStream;)I

    .line 49
    .line 50
    .line 51
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 52
    :try_start_3
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 53
    .line 54
    .line 55
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzb:I

    .line 56
    .line 57
    if-ltz v0, :cond_1

    .line 58
    .line 59
    if-gt p1, v0, :cond_0

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbdo;->zzj:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 63
    .line 64
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 65
    .line 66
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iget p0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzb:I

    .line 71
    .line 72
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-static {v2, v7, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {v0, p0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    new-instance p1, Lcom/google/android/libraries/places/internal/zzbdq;

    .line 89
    .line 90
    invoke-direct {p1, p0, v4}, Lcom/google/android/libraries/places/internal/zzbdq;-><init>(Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbcf;)V

    .line 91
    .line 92
    .line 93
    throw p1

    .line 94
    :catch_0
    move-exception v0

    .line 95
    move-object p0, v0

    .line 96
    goto/16 :goto_4

    .line 97
    .line 98
    :catch_1
    move-exception v0

    .line 99
    move-object p0, v0

    .line 100
    goto/16 :goto_5

    .line 101
    .line 102
    :cond_1
    :goto_0
    invoke-direct {p0, v3, v2}, Lcom/google/android/libraries/places/internal/zzbmw;->zzj(Lcom/google/android/libraries/places/internal/zzbms;Z)V

    .line 103
    .line 104
    .line 105
    goto/16 :goto_2

    .line 106
    .line 107
    :catchall_0
    move-exception v0

    .line 108
    move-object p0, v0

    .line 109
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 110
    .line 111
    .line 112
    throw p0

    .line 113
    :cond_2
    const/4 v0, 0x0

    .line 114
    if-eq v5, v6, :cond_6

    .line 115
    .line 116
    int-to-long v2, v5

    .line 117
    iput-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzl:J

    .line 118
    .line 119
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzb:I

    .line 120
    .line 121
    if-ltz v2, :cond_4

    .line 122
    .line 123
    if-gt v5, v2, :cond_3

    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_3
    sget-object p1, Lcom/google/android/libraries/places/internal/zzbdo;->zzj:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 127
    .line 128
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 129
    .line 130
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    iget p0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzb:I

    .line 135
    .line 136
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    filled-new-array {v2, p0}, [Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-static {v0, v7, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-virtual {p1, p0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    new-instance p1, Lcom/google/android/libraries/places/internal/zzbdq;

    .line 153
    .line 154
    invoke-direct {p1, p0, v4}, Lcom/google/android/libraries/places/internal/zzbdq;-><init>(Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbcf;)V

    .line 155
    .line 156
    .line 157
    throw p1

    .line 158
    :cond_4
    :goto_1
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzf:Ljava/nio/ByteBuffer;

    .line 159
    .line 160
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 161
    .line 162
    .line 163
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzf:Ljava/nio/ByteBuffer;

    .line 164
    .line 165
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 170
    .line 171
    .line 172
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    .line 173
    .line 174
    if-nez v2, :cond_5

    .line 175
    .line 176
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzg:Lcom/google/android/libraries/places/internal/zzbrb;

    .line 177
    .line 178
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzf:Ljava/nio/ByteBuffer;

    .line 179
    .line 180
    invoke-virtual {v3}, Ljava/nio/Buffer;->position()I

    .line 181
    .line 182
    .line 183
    move-result v3

    .line 184
    add-int/2addr v3, v5

    .line 185
    invoke-interface {v2, v3}, Lcom/google/android/libraries/places/internal/zzbrb;->zza(I)Lcom/google/android/libraries/places/internal/zzbra;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    iput-object v2, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    .line 190
    .line 191
    :cond_5
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzf:Ljava/nio/ByteBuffer;

    .line 192
    .line 193
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzf:Ljava/nio/ByteBuffer;

    .line 198
    .line 199
    invoke-virtual {v3}, Ljava/nio/Buffer;->position()I

    .line 200
    .line 201
    .line 202
    move-result v3

    .line 203
    invoke-direct {p0, v2, v0, v3}, Lcom/google/android/libraries/places/internal/zzbmw;->zzk([BII)V

    .line 204
    .line 205
    .line 206
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zze:Lcom/google/android/libraries/places/internal/zzbmu;

    .line 207
    .line 208
    invoke-interface {p1, v0}, Lcom/google/android/libraries/places/internal/zzazr;->zza(Ljava/io/OutputStream;)I

    .line 209
    .line 210
    .line 211
    move-result p1

    .line 212
    goto :goto_2

    .line 213
    :cond_6
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbms;

    .line 214
    .line 215
    invoke-direct {v2, p0, v4}, Lcom/google/android/libraries/places/internal/zzbms;-><init>(Lcom/google/android/libraries/places/internal/zzbmw;Lcom/google/android/libraries/places/internal/zzbmr;)V

    .line 216
    .line 217
    .line 218
    invoke-interface {p1, v2}, Lcom/google/android/libraries/places/internal/zzazr;->zza(Ljava/io/OutputStream;)I

    .line 219
    .line 220
    .line 221
    move-result p1

    .line 222
    invoke-direct {p0, v2, v0}, Lcom/google/android/libraries/places/internal/zzbmw;->zzj(Lcom/google/android/libraries/places/internal/zzbms;Z)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lcom/google/android/libraries/places/internal/zzbdq; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_0

    .line 223
    .line 224
    .line 225
    :goto_2
    if-eq v5, v6, :cond_8

    .line 226
    .line 227
    if-ne p1, v5, :cond_7

    .line 228
    .line 229
    goto :goto_3

    .line 230
    :cond_7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    const-string p1, "Message length inaccurate %s != %s"

    .line 243
    .line 244
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    sget-object p1, Lcom/google/android/libraries/places/internal/zzbdo;->zzo:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 249
    .line 250
    invoke-virtual {p1, p0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 251
    .line 252
    .line 253
    move-result-object p0

    .line 254
    new-instance p1, Lcom/google/android/libraries/places/internal/zzbdq;

    .line 255
    .line 256
    invoke-direct {p1, p0, v4}, Lcom/google/android/libraries/places/internal/zzbdq;-><init>(Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbcf;)V

    .line 257
    .line 258
    .line 259
    throw p1

    .line 260
    :cond_8
    :goto_3
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzh:Lcom/google/android/libraries/places/internal/zzbqo;

    .line 261
    .line 262
    int-to-long v5, p1

    .line 263
    invoke-virtual {v0, v5, v6}, Lcom/google/android/libraries/places/internal/zzbqo;->zzk(J)V

    .line 264
    .line 265
    .line 266
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzh:Lcom/google/android/libraries/places/internal/zzbqo;

    .line 267
    .line 268
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzl:J

    .line 269
    .line 270
    invoke-virtual {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzbqo;->zzl(J)V

    .line 271
    .line 272
    .line 273
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzh:Lcom/google/android/libraries/places/internal/zzbqo;

    .line 274
    .line 275
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzk:I

    .line 276
    .line 277
    iget-wide v3, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzl:J

    .line 278
    .line 279
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/libraries/places/internal/zzbqo;->zzj(IJJ)V

    .line 280
    .line 281
    .line 282
    return-void

    .line 283
    :goto_4
    sget-object p1, Lcom/google/android/libraries/places/internal/zzbdo;->zzo:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 284
    .line 285
    invoke-virtual {p1, v1}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    invoke-virtual {p1, p0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzf(Ljava/lang/Throwable;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 290
    .line 291
    .line 292
    move-result-object p0

    .line 293
    new-instance p1, Lcom/google/android/libraries/places/internal/zzbdq;

    .line 294
    .line 295
    invoke-direct {p1, p0, v4}, Lcom/google/android/libraries/places/internal/zzbdq;-><init>(Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbcf;)V

    .line 296
    .line 297
    .line 298
    throw p1

    .line 299
    :catch_2
    move-exception v0

    .line 300
    move-object p0, v0

    .line 301
    throw p0

    .line 302
    :goto_5
    sget-object p1, Lcom/google/android/libraries/places/internal/zzbdo;->zzo:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 303
    .line 304
    invoke-virtual {p1, v1}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 305
    .line 306
    .line 307
    move-result-object p1

    .line 308
    invoke-virtual {p1, p0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzf(Ljava/lang/Throwable;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 309
    .line 310
    .line 311
    move-result-object p0

    .line 312
    new-instance p1, Lcom/google/android/libraries/places/internal/zzbdq;

    .line 313
    .line 314
    invoke-direct {p1, p0, v4}, Lcom/google/android/libraries/places/internal/zzbdq;-><init>(Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbcf;)V

    .line 315
    .line 316
    .line 317
    throw p1

    .line 318
    :cond_9
    const-string p0, "Framer already closed"

    .line 319
    .line 320
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    return-void
.end method

.method public final zzf()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/libraries/places/internal/zzbmw;->zzi:Z

    return p0
.end method
