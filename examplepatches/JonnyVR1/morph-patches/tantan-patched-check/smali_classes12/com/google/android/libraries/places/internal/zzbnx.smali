.class final Lcom/google/android/libraries/places/internal/zzbnx;
.super Lcom/google/android/libraries/places/internal/zzbeg;
.source "SourceFile"


# instance fields
.field zza:I

.field final zzb:I

.field final zzc:[B

.field zzd:I


# direct methods
.method public constructor <init>([BII)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbeg;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zzd:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x1

    .line 9
    if-ltz p2, :cond_0

    .line 10
    .line 11
    move v2, v1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v2, v0

    .line 14
    :goto_0
    const-string v3, "offset must be >= 0"

    .line 15
    .line 16
    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzmt;->zzf(ZLjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    if-ltz p3, :cond_1

    .line 20
    .line 21
    move v2, v1

    .line 22
    goto :goto_1

    .line 23
    :cond_1
    move v2, v0

    .line 24
    :goto_1
    const-string v3, "length must be >= 0"

    .line 25
    .line 26
    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzmt;->zzf(ZLjava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    add-int/2addr p3, p2

    .line 30
    if-gtz p3, :cond_2

    .line 31
    .line 32
    move v0, v1

    .line 33
    :cond_2
    const-string v1, "offset + length exceeds array boundary"

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/google/android/libraries/places/internal/zzmt;->zzf(ZLjava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zzc:[B

    .line 39
    .line 40
    iput p2, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zza:I

    .line 41
    .line 42
    iput p3, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zzb:I

    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public final zzb()V
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zza:I

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zzd:I

    return-void
.end method

.method public final zzc()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zzd:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zza:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p0, Ljava/nio/InvalidMarkException;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/nio/InvalidMarkException;-><init>()V

    .line 12
    .line 13
    .line 14
    throw p0
.end method

.method public final zzd()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public final zze()I
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzbeg;->zza(I)V

    .line 3
    .line 4
    .line 5
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zza:I

    .line 6
    .line 7
    add-int/lit8 v1, v0, 0x1

    .line 8
    .line 9
    iput v1, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zza:I

    .line 10
    .line 11
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zzc:[B

    .line 12
    .line 13
    aget-byte p0, p0, v0

    .line 14
    .line 15
    and-int/lit16 p0, p0, 0xff

    .line 16
    .line 17
    return p0
.end method

.method public final zzf()I
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zzb:I

    iget p0, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zza:I

    sub-int/2addr v0, p0

    return v0
.end method

.method public final bridge synthetic zzg(I)Lcom/google/android/libraries/places/internal/zzbnv;
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzbeg;->zza(I)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zza:I

    .line 5
    .line 6
    add-int v1, v0, p1

    .line 7
    .line 8
    iput v1, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zza:I

    .line 9
    .line 10
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbnx;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zzc:[B

    .line 13
    .line 14
    invoke-direct {v1, p0, v0, p1}, Lcom/google/android/libraries/places/internal/zzbnx;-><init>([BII)V

    .line 15
    .line 16
    .line 17
    return-object v1
.end method

.method public final zzi(Ljava/nio/ByteBuffer;)V
    .locals 3

    .line 1
    const-string v0, "dest"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzbeg;->zza(I)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zzc:[B

    .line 14
    .line 15
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zza:I

    .line 16
    .line 17
    invoke-virtual {p1, v1, v2, v0}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    .line 20
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zza:I

    .line 21
    .line 22
    add-int/2addr p1, v0

    .line 23
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zza:I

    .line 24
    .line 25
    return-void
.end method

.method public final zzj(Ljava/io/OutputStream;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Lcom/google/android/libraries/places/internal/zzbeg;->zza(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zzc:[B

    .line 5
    .line 6
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zza:I

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1, p2}, Ljava/io/OutputStream;->write([BII)V

    .line 9
    .line 10
    .line 11
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zza:I

    .line 12
    .line 13
    add-int/2addr p1, p2

    .line 14
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zza:I

    .line 15
    .line 16
    return-void
.end method

.method public final zzk([BII)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zzc:[B

    .line 2
    .line 3
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zza:I

    .line 4
    .line 5
    invoke-static {v0, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 6
    .line 7
    .line 8
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zza:I

    .line 9
    .line 10
    add-int/2addr p1, p3

    .line 11
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zza:I

    .line 12
    .line 13
    return-void
.end method

.method public final zzl(I)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzbeg;->zza(I)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zza:I

    .line 5
    .line 6
    add-int/2addr v0, p1

    .line 7
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbnx;->zza:I

    .line 8
    .line 9
    return-void
.end method
