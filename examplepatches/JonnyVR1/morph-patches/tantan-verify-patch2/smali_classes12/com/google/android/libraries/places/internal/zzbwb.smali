.class public final Lcom/google/android/libraries/places/internal/zzbwb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/nio/channels/ByteChannel;
.implements Lcom/google/android/libraries/places/internal/zzbwd;
.implements Lcom/google/android/libraries/places/internal/zzbwc;


# annotations
.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public zza:Lcom/google/android/libraries/places/internal/zzbwn;
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private zzb:J


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final synthetic clone()Ljava/lang/Object;
    .locals 6

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbwb;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzbwb;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    cmp-long v1, v1, v3

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbwn;->zzc()Lcom/google/android/libraries/places/internal/zzbwn;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iput-object v2, v0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 25
    .line 26
    iput-object v2, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 27
    .line 28
    iput-object v2, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 29
    .line 30
    iget-object v3, v1, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 31
    .line 32
    :goto_0
    if-eq v3, v1, :cond_1

    .line 33
    .line 34
    iget-object v4, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 35
    .line 36
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzbwn;->zzc()Lcom/google/android/libraries/places/internal/zzbwn;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-virtual {v4, v5}, Lcom/google/android/libraries/places/internal/zzbwn;->zzb(Lcom/google/android/libraries/places/internal/zzbwn;)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 47
    .line 48
    .line 49
    iget-object v3, v3, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    iget-wide v1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 53
    .line 54
    iput-wide v1, v0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 55
    .line 56
    return-object v0
.end method

.method public final close()V
    .locals 0

    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 18
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    return v2

    .line 9
    :cond_0
    instance-of v3, v1, Lcom/google/android/libraries/places/internal/zzbwb;

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    if-nez v3, :cond_1

    .line 13
    .line 14
    return v4

    .line 15
    :cond_1
    iget-wide v5, v0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 16
    .line 17
    check-cast v1, Lcom/google/android/libraries/places/internal/zzbwb;

    .line 18
    .line 19
    iget-wide v7, v1, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 20
    .line 21
    cmp-long v3, v5, v7

    .line 22
    .line 23
    if-eqz v3, :cond_2

    .line 24
    .line 25
    return v4

    .line 26
    :cond_2
    const-wide/16 v7, 0x0

    .line 27
    .line 28
    cmp-long v3, v5, v7

    .line 29
    .line 30
    if-nez v3, :cond_3

    .line 31
    .line 32
    return v2

    .line 33
    :cond_3
    iget-object v3, v0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 34
    .line 35
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    iget-object v1, v1, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    iget v5, v3, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 44
    .line 45
    iget v6, v1, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 46
    .line 47
    move-wide v9, v7

    .line 48
    :goto_0
    iget-wide v11, v0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 49
    .line 50
    cmp-long v11, v9, v11

    .line 51
    .line 52
    if-gez v11, :cond_8

    .line 53
    .line 54
    iget v11, v3, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 55
    .line 56
    sub-int/2addr v11, v5

    .line 57
    iget v12, v1, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 58
    .line 59
    sub-int/2addr v12, v6

    .line 60
    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    .line 61
    .line 62
    .line 63
    move-result v11

    .line 64
    int-to-long v11, v11

    .line 65
    move-wide v13, v7

    .line 66
    :goto_1
    cmp-long v15, v13, v11

    .line 67
    .line 68
    if-gez v15, :cond_5

    .line 69
    .line 70
    iget-object v15, v3, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 71
    .line 72
    add-int/lit8 v16, v5, 0x1

    .line 73
    .line 74
    aget-byte v5, v15, v5

    .line 75
    .line 76
    iget-object v15, v1, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 77
    .line 78
    add-int/lit8 v17, v6, 0x1

    .line 79
    .line 80
    aget-byte v6, v15, v6

    .line 81
    .line 82
    if-eq v5, v6, :cond_4

    .line 83
    .line 84
    return v4

    .line 85
    :cond_4
    const-wide/16 v5, 0x1

    .line 86
    .line 87
    add-long/2addr v13, v5

    .line 88
    move/from16 v5, v16

    .line 89
    .line 90
    move/from16 v6, v17

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_5
    iget v13, v3, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 94
    .line 95
    if-ne v5, v13, :cond_6

    .line 96
    .line 97
    iget-object v3, v3, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 98
    .line 99
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 100
    .line 101
    .line 102
    iget v5, v3, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 103
    .line 104
    :cond_6
    iget v13, v1, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 105
    .line 106
    if-ne v6, v13, :cond_7

    .line 107
    .line 108
    iget-object v1, v1, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 111
    .line 112
    .line 113
    iget v6, v1, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 114
    .line 115
    :cond_7
    add-long/2addr v9, v11

    .line 116
    goto :goto_0

    .line 117
    :cond_8
    return v2
.end method

.method public final flush()V
    .locals 0

    return-void
.end method

.method public final hashCode()I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 v1, 0x1

    .line 8
    :cond_1
    iget v2, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 9
    .line 10
    iget v3, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 11
    .line 12
    :goto_0
    if-ge v2, v3, :cond_2

    .line 13
    .line 14
    mul-int/lit8 v1, v1, 0x1f

    .line 15
    .line 16
    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 17
    .line 18
    aget-byte v4, v4, v2

    .line 19
    .line 20
    add-int/2addr v1, v4

    .line 21
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_2
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 30
    .line 31
    if-ne v0, v2, :cond_1

    .line 32
    .line 33
    return v1
.end method

.method public final isOpen()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public final read(Ljava/nio/ByteBuffer;)I
    .locals 6
    .param p1    # Ljava/nio/ByteBuffer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 p0, -0x1

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iget v2, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 15
    .line 16
    iget v3, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 17
    .line 18
    sub-int/2addr v2, v3

    .line 19
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iget-object v2, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 24
    .line 25
    iget v3, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 26
    .line 27
    invoke-virtual {p1, v2, v3, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    .line 30
    iget p1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 31
    .line 32
    add-int/2addr p1, v1

    .line 33
    iput p1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 34
    .line 35
    iget-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 36
    .line 37
    int-to-long v4, v1

    .line 38
    sub-long/2addr v2, v4

    .line 39
    iput-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 40
    .line 41
    iget v2, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 42
    .line 43
    if-ne p1, v2, :cond_1

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbwn;->zza()Lcom/google/android/libraries/places/internal/zzbwn;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 50
    .line 51
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbwo;->zzb(Lcom/google/android/libraries/places/internal/zzbwn;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return v1
.end method

.method public final toString()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwb;->zzz()Lcom/google/android/libraries/places/internal/zzbwf;

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

.method public final write(Ljava/nio/ByteBuffer;)I
    .locals 6
    .param p1    # Ljava/nio/ByteBuffer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    move v1, v0

    .line 9
    :goto_0
    if-lez v1, :cond_0

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {p0, v2}, Lcom/google/android/libraries/places/internal/zzbwb;->zzB(I)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iget v3, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 17
    .line 18
    rsub-int v3, v3, 0x2000

    .line 19
    .line 20
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    iget-object v4, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 25
    .line 26
    iget v5, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 27
    .line 28
    invoke-virtual {p1, v4, v5, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    .line 31
    sub-int/2addr v1, v3

    .line 32
    iget v4, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 33
    .line 34
    add-int/2addr v4, v3

    .line 35
    iput v4, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-wide v1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 39
    .line 40
    int-to-long v3, v0

    .line 41
    add-long/2addr v1, v3

    .line 42
    iput-wide v1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 43
    .line 44
    return v0
.end method

.method public final zzA(I)Lcom/google/android/libraries/places/internal/zzbwf;
    .locals 7
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/google/android/libraries/places/internal/zzbwf;->zzb:Lcom/google/android/libraries/places/internal/zzbwf;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    int-to-long v4, p1

    .line 11
    invoke-static/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzbvv;->zzb(JJJ)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    move v2, v1

    .line 18
    move v3, v2

    .line 19
    :goto_0
    if-ge v2, p1, :cond_2

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    iget v4, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 25
    .line 26
    iget v5, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 27
    .line 28
    if-eq v4, v5, :cond_1

    .line 29
    .line 30
    sub-int/2addr v4, v5

    .line 31
    add-int/2addr v2, v4

    .line 32
    add-int/lit8 v3, v3, 0x1

    .line 33
    .line 34
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const-string p0, "s.limit == s.pos"

    .line 38
    .line 39
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    return-object p0

    .line 44
    :cond_2
    new-array v0, v3, [[B

    .line 45
    .line 46
    add-int v2, v3, v3

    .line 47
    .line 48
    new-array v2, v2, [I

    .line 49
    .line 50
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 51
    .line 52
    move v4, v1

    .line 53
    :goto_1
    if-ge v1, p1, :cond_3

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 59
    .line 60
    aput-object v5, v0, v4

    .line 61
    .line 62
    iget v5, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 63
    .line 64
    iget v6, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 65
    .line 66
    sub-int/2addr v5, v6

    .line 67
    add-int/2addr v1, v5

    .line 68
    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    aput v5, v2, v4

    .line 73
    .line 74
    add-int v5, v4, v3

    .line 75
    .line 76
    iget v6, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 77
    .line 78
    aput v6, v2, v5

    .line 79
    .line 80
    const/4 v5, 0x1

    .line 81
    iput-boolean v5, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zze:Z

    .line 82
    .line 83
    add-int/2addr v4, v5

    .line 84
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_3
    new-instance p0, Lcom/google/android/libraries/places/internal/zzbwp;

    .line 88
    .line 89
    invoke-direct {p0, v0, v2}, Lcom/google/android/libraries/places/internal/zzbwp;-><init>([[B[I)V

    .line 90
    .line 91
    .line 92
    return-object p0
.end method

.method public final zzB(I)Lcom/google/android/libraries/places/internal/zzbwn;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    if-lez p1, :cond_3

    .line 2
    .line 3
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbwo;->zza()Lcom/google/android/libraries/places/internal/zzbwn;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 12
    .line 13
    iput-object p1, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 14
    .line 15
    iput-object p1, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 16
    .line 17
    return-object p1

    .line 18
    :cond_0
    iget-object p0, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 24
    .line 25
    add-int/2addr v0, p1

    .line 26
    const/16 p1, 0x2000

    .line 27
    .line 28
    if-gt v0, p1, :cond_2

    .line 29
    .line 30
    iget-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzf:Z

    .line 31
    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-object p0

    .line 36
    :cond_2
    :goto_0
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbwo;->zza()Lcom/google/android/libraries/places/internal/zzbwn;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzbwn;->zzb(Lcom/google/android/libraries/places/internal/zzbwn;)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 41
    .line 42
    .line 43
    return-object p1

    .line 44
    :cond_3
    const-string p0, "unexpected capacity"

    .line 45
    .line 46
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method

.method public final zzC()S
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 2
    .line 3
    const-wide/16 v2, 0x2

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-ltz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    iget v1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 15
    .line 16
    iget v2, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 17
    .line 18
    sub-int v3, v2, v1

    .line 19
    .line 20
    const/4 v4, 0x2

    .line 21
    if-ge v3, v4, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwb;->zzc()B

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    and-int/lit16 v0, v0, 0xff

    .line 28
    .line 29
    shl-int/lit8 v0, v0, 0x8

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwb;->zzc()B

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    and-int/lit16 p0, p0, 0xff

    .line 36
    .line 37
    or-int/2addr p0, v0

    .line 38
    :goto_0
    int-to-short p0, p0

    .line 39
    return p0

    .line 40
    :cond_0
    iget-object v3, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 41
    .line 42
    add-int/lit8 v5, v1, 0x1

    .line 43
    .line 44
    aget-byte v6, v3, v1

    .line 45
    .line 46
    and-int/lit16 v6, v6, 0xff

    .line 47
    .line 48
    shl-int/lit8 v6, v6, 0x8

    .line 49
    .line 50
    aget-byte v3, v3, v5

    .line 51
    .line 52
    and-int/lit16 v3, v3, 0xff

    .line 53
    .line 54
    iget-wide v7, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 55
    .line 56
    const-wide/16 v9, -0x2

    .line 57
    .line 58
    add-long/2addr v7, v9

    .line 59
    iput-wide v7, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 60
    .line 61
    add-int/2addr v1, v4

    .line 62
    if-ne v1, v2, :cond_1

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbwn;->zza()Lcom/google/android/libraries/places/internal/zzbwn;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 69
    .line 70
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbwo;->zzb(Lcom/google/android/libraries/places/internal/zzbwn;)V

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    iput v1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 75
    .line 76
    :goto_1
    or-int p0, v6, v3

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    new-instance p0, Ljava/io/EOFException;

    .line 80
    .line 81
    const/4 v0, 0x0

    .line 82
    invoke-direct {p0, v0}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    throw p0
.end method

.method public final zzD(J)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    const/4 p0, 0x0

    throw p0
.end method

.method public final zzE(J)V
    .locals 0

    iput-wide p1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    return-void
.end method

.method public final zzF(J)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 1
    :cond_0
    :goto_0
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget v1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 12
    .line 13
    iget v2, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 14
    .line 15
    sub-int/2addr v1, v2

    .line 16
    int-to-long v1, v1

    .line 17
    invoke-static {p1, p2, v1, v2}, Ljava/lang/Math;->min(JJ)J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    long-to-int v1, v1

    .line 22
    iget-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 23
    .line 24
    int-to-long v4, v1

    .line 25
    sub-long/2addr v2, v4

    .line 26
    iput-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 27
    .line 28
    sub-long/2addr p1, v4

    .line 29
    iget v2, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 30
    .line 31
    add-int/2addr v2, v1

    .line 32
    iput v2, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 33
    .line 34
    iget v1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 35
    .line 36
    if-ne v2, v1, :cond_0

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbwn;->zza()Lcom/google/android/libraries/places/internal/zzbwn;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 43
    .line 44
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbwo;->zzb(Lcom/google/android/libraries/places/internal/zzbwn;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    new-instance p0, Ljava/io/EOFException;

    .line 49
    .line 50
    const/4 p1, 0x0

    .line 51
    invoke-direct {p0, p1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    throw p0

    .line 55
    :cond_2
    return-void
.end method

.method public final zzG()Z
    .locals 4

    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final zzH(J)[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_3

    .line 6
    .line 7
    const-wide/32 v0, 0x7fffffff

    .line 8
    .line 9
    .line 10
    cmp-long v0, p1, v0

    .line 11
    .line 12
    if-gtz v0, :cond_3

    .line 13
    .line 14
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 15
    .line 16
    cmp-long v0, v0, p1

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    if-ltz v0, :cond_2

    .line 20
    .line 21
    long-to-int p1, p1

    .line 22
    new-array p2, p1, [B

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    :goto_0
    if-ge v0, p1, :cond_1

    .line 26
    .line 27
    sub-int v2, p1, v0

    .line 28
    .line 29
    invoke-virtual {p0, p2, v0, v2}, Lcom/google/android/libraries/places/internal/zzbwb;->zzd([BII)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    const/4 v3, -0x1

    .line 34
    if-eq v2, v3, :cond_0

    .line 35
    .line 36
    add-int/2addr v0, v2

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    new-instance p0, Ljava/io/EOFException;

    .line 39
    .line 40
    invoke-direct {p0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    throw p0

    .line 44
    :cond_1
    return-object p2

    .line 45
    :cond_2
    new-instance p0, Ljava/io/EOFException;

    .line 46
    .line 47
    invoke-direct {p0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    throw p0

    .line 51
    :cond_3
    const-string p0, "byteCount: "

    .line 52
    .line 53
    invoke-static {p0, p1, p2}, Ll/mlk0;->a(Ljava/lang/String;J)V

    .line 54
    .line 55
    .line 56
    const/4 p0, 0x0

    .line 57
    return-object p0
.end method

.method public final zza(Lcom/google/android/libraries/places/internal/zzbwb;J)J
    .locals 4
    .param p1    # Lcom/google/android/libraries/places/internal/zzbwb;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long v2, p2, v0

    .line 7
    .line 8
    if-ltz v2, :cond_2

    .line 9
    .line 10
    iget-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 11
    .line 12
    cmp-long v0, v2, v0

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    cmp-long v0, p2, v2

    .line 17
    .line 18
    if-lez v0, :cond_0

    .line 19
    .line 20
    move-wide p2, v2

    .line 21
    :cond_0
    invoke-virtual {p1, p0, p2, p3}, Lcom/google/android/libraries/places/internal/zzbwb;->zzn(Lcom/google/android/libraries/places/internal/zzbwb;J)V

    .line 22
    .line 23
    .line 24
    return-wide p2

    .line 25
    :cond_1
    const-wide/16 p0, -0x1

    .line 26
    .line 27
    return-wide p0

    .line 28
    :cond_2
    const-string p0, "byteCount < 0: "

    .line 29
    .line 30
    invoke-static {p0, p2, p3}, Ll/mlk0;->a(Ljava/lang/String;J)V

    .line 31
    .line 32
    .line 33
    const-wide/16 p0, 0x0

    .line 34
    .line 35
    return-wide p0
.end method

.method public final zzb(J)B
    .locals 6
    .annotation build Lkotlin/jvm/JvmName;
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 2
    .line 3
    const-wide/16 v4, 0x1

    .line 4
    .line 5
    move-wide v2, p1

    .line 6
    invoke-static/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzbvv;->zzb(JJJ)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 15
    .line 16
    sub-long v4, v0, v2

    .line 17
    .line 18
    cmp-long p0, v4, v2

    .line 19
    .line 20
    if-gez p0, :cond_1

    .line 21
    .line 22
    :goto_0
    cmp-long p0, v0, v2

    .line 23
    .line 24
    if-lez p0, :cond_0

    .line 25
    .line 26
    iget-object p1, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    iget p0, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 32
    .line 33
    iget p2, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 34
    .line 35
    sub-int/2addr p0, p2

    .line 36
    int-to-long v4, p0

    .line 37
    sub-long/2addr v0, v4

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object p0, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 40
    .line 41
    iget p1, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 42
    .line 43
    int-to-long p1, p1

    .line 44
    add-long/2addr p1, v2

    .line 45
    sub-long/2addr p1, v0

    .line 46
    long-to-int p1, p1

    .line 47
    aget-byte p0, p0, p1

    .line 48
    .line 49
    return p0

    .line 50
    :cond_1
    const-wide/16 v0, 0x0

    .line 51
    .line 52
    :goto_1
    iget p0, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 53
    .line 54
    iget p2, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 55
    .line 56
    sub-int/2addr p0, p2

    .line 57
    int-to-long v4, p0

    .line 58
    add-long/2addr v4, v0

    .line 59
    cmp-long p0, v4, v2

    .line 60
    .line 61
    if-gtz p0, :cond_2

    .line 62
    .line 63
    iget-object p1, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 64
    .line 65
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    move-wide v0, v4

    .line 69
    goto :goto_1

    .line 70
    :cond_2
    iget-object p0, p1, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 71
    .line 72
    int-to-long p1, p2

    .line 73
    add-long/2addr p1, v2

    .line 74
    sub-long/2addr p1, v0

    .line 75
    long-to-int p1, p1

    .line 76
    aget-byte p0, p0, p1

    .line 77
    .line 78
    return p0
.end method

.method public final zzc()B
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    iget v1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 15
    .line 16
    iget v2, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 17
    .line 18
    iget-object v3, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 19
    .line 20
    add-int/lit8 v4, v1, 0x1

    .line 21
    .line 22
    aget-byte v1, v3, v1

    .line 23
    .line 24
    iget-wide v5, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 25
    .line 26
    const-wide/16 v7, -0x1

    .line 27
    .line 28
    add-long/2addr v5, v7

    .line 29
    iput-wide v5, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 30
    .line 31
    if-ne v4, v2, :cond_0

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbwn;->zza()Lcom/google/android/libraries/places/internal/zzbwn;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iput-object v2, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbwo;->zzb(Lcom/google/android/libraries/places/internal/zzbwn;)V

    .line 40
    .line 41
    .line 42
    return v1

    .line 43
    :cond_0
    iput v4, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 44
    .line 45
    return v1

    .line 46
    :cond_1
    new-instance p0, Ljava/io/EOFException;

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    invoke-direct {p0, v0}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    throw p0
.end method

.method public final zzd([BII)I
    .locals 7
    .param p1    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    array-length v0, p1

    .line 5
    int-to-long v1, v0

    .line 6
    int-to-long v3, p2

    .line 7
    int-to-long v5, p3

    .line 8
    invoke-static/range {v1 .. v6}, Lcom/google/android/libraries/places/internal/zzbvv;->zzb(JJJ)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 p0, -0x1

    .line 16
    return p0

    .line 17
    :cond_0
    iget v1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 18
    .line 19
    iget v2, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 20
    .line 21
    sub-int/2addr v1, v2

    .line 22
    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    iget v1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 27
    .line 28
    add-int v2, v1, p3

    .line 29
    .line 30
    iget-object v3, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 31
    .line 32
    invoke-static {v3, p1, p2, v1, v2}, Lkotlin/collections/ArraysKt;->copyInto([B[BIII)[B

    .line 33
    .line 34
    .line 35
    iget p1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 36
    .line 37
    add-int/2addr p1, p3

    .line 38
    iput p1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 39
    .line 40
    iget-wide v1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 41
    .line 42
    int-to-long v3, p3

    .line 43
    sub-long/2addr v1, v3

    .line 44
    iput-wide v1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 45
    .line 46
    iget p2, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 47
    .line 48
    if-eq p1, p2, :cond_1

    .line 49
    .line 50
    return p3

    .line 51
    :cond_1
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbwn;->zza()Lcom/google/android/libraries/places/internal/zzbwn;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 56
    .line 57
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbwo;->zzb(Lcom/google/android/libraries/places/internal/zzbwn;)V

    .line 58
    .line 59
    .line 60
    return p3
.end method

.method public final zze()I
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 2
    .line 3
    const-wide/16 v2, 0x4

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-ltz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    iget v1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 15
    .line 16
    iget v4, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 17
    .line 18
    sub-int v5, v4, v1

    .line 19
    .line 20
    int-to-long v5, v5

    .line 21
    cmp-long v2, v5, v2

    .line 22
    .line 23
    if-gez v2, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwb;->zzc()B

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    and-int/lit16 v0, v0, 0xff

    .line 30
    .line 31
    shl-int/lit8 v0, v0, 0x18

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwb;->zzc()B

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    and-int/lit16 v1, v1, 0xff

    .line 38
    .line 39
    shl-int/lit8 v1, v1, 0x10

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwb;->zzc()B

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    and-int/lit16 v2, v2, 0xff

    .line 46
    .line 47
    shl-int/lit8 v2, v2, 0x8

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwb;->zzc()B

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    and-int/lit16 p0, p0, 0xff

    .line 54
    .line 55
    or-int/2addr v0, v1

    .line 56
    or-int/2addr v0, v2

    .line 57
    or-int/2addr p0, v0

    .line 58
    return p0

    .line 59
    :cond_0
    iget-object v2, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 60
    .line 61
    add-int/lit8 v3, v1, 0x1

    .line 62
    .line 63
    aget-byte v5, v2, v1

    .line 64
    .line 65
    and-int/lit16 v5, v5, 0xff

    .line 66
    .line 67
    shl-int/lit8 v5, v5, 0x18

    .line 68
    .line 69
    aget-byte v3, v2, v3

    .line 70
    .line 71
    and-int/lit16 v3, v3, 0xff

    .line 72
    .line 73
    shl-int/lit8 v3, v3, 0x10

    .line 74
    .line 75
    add-int/lit8 v6, v1, 0x2

    .line 76
    .line 77
    aget-byte v6, v2, v6

    .line 78
    .line 79
    and-int/lit16 v6, v6, 0xff

    .line 80
    .line 81
    shl-int/lit8 v6, v6, 0x8

    .line 82
    .line 83
    add-int/lit8 v7, v1, 0x3

    .line 84
    .line 85
    aget-byte v2, v2, v7

    .line 86
    .line 87
    and-int/lit16 v2, v2, 0xff

    .line 88
    .line 89
    iget-wide v7, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 90
    .line 91
    const-wide/16 v9, -0x4

    .line 92
    .line 93
    add-long/2addr v7, v9

    .line 94
    iput-wide v7, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 95
    .line 96
    or-int/2addr v3, v5

    .line 97
    or-int/2addr v3, v6

    .line 98
    or-int/2addr v2, v3

    .line 99
    add-int/lit8 v1, v1, 0x4

    .line 100
    .line 101
    if-ne v1, v4, :cond_1

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbwn;->zza()Lcom/google/android/libraries/places/internal/zzbwn;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 108
    .line 109
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbwo;->zzb(Lcom/google/android/libraries/places/internal/zzbwn;)V

    .line 110
    .line 111
    .line 112
    return v2

    .line 113
    :cond_1
    iput v1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 114
    .line 115
    return v2

    .line 116
    :cond_2
    new-instance p0, Ljava/io/EOFException;

    .line 117
    .line 118
    const/4 v0, 0x0

    .line 119
    invoke-direct {p0, v0}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    throw p0
.end method

.method public final zzf()J
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-nez v4, :cond_0

    .line 8
    .line 9
    return-wide v2

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 21
    .line 22
    const/16 v3, 0x2000

    .line 23
    .line 24
    if-ge v2, v3, :cond_1

    .line 25
    .line 26
    iget-boolean v3, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzf:Z

    .line 27
    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    iget p0, p0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 31
    .line 32
    sub-int/2addr v2, p0

    .line 33
    int-to-long v2, v2

    .line 34
    sub-long/2addr v0, v2

    .line 35
    :cond_1
    return-wide v0
.end method

.method public final zzg()J
    .locals 2
    .annotation build Lkotlin/jvm/JvmName;
    .end annotation

    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    return-wide v0
.end method

.method public final zzh(JLjava/nio/charset/Charset;)Ljava/lang/String;
    .locals 7
    .param p3    # Ljava/nio/charset/Charset;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long v0, p1, v0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-ltz v0, :cond_4

    .line 10
    .line 11
    const-wide/32 v2, 0x7fffffff

    .line 12
    .line 13
    .line 14
    cmp-long v2, p1, v2

    .line 15
    .line 16
    if-gtz v2, :cond_4

    .line 17
    .line 18
    iget-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 19
    .line 20
    cmp-long v2, v2, p1

    .line 21
    .line 22
    if-ltz v2, :cond_3

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    const-string p0, ""

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    iget v1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 35
    .line 36
    int-to-long v2, v1

    .line 37
    iget v4, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 38
    .line 39
    int-to-long v5, v4

    .line 40
    add-long/2addr v2, p1

    .line 41
    cmp-long v2, v2, v5

    .line 42
    .line 43
    if-lez v2, :cond_1

    .line 44
    .line 45
    new-instance v0, Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzbwb;->zzH(J)[B

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-direct {v0, p0, p3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 52
    .line 53
    .line 54
    return-object v0

    .line 55
    :cond_1
    new-instance v2, Ljava/lang/String;

    .line 56
    .line 57
    iget-object v3, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 58
    .line 59
    long-to-int v5, p1

    .line 60
    invoke-direct {v2, v3, v1, v5, p3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 61
    .line 62
    .line 63
    add-int/2addr v1, v5

    .line 64
    iput v1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 65
    .line 66
    iget-wide v5, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 67
    .line 68
    sub-long/2addr v5, p1

    .line 69
    iput-wide v5, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 70
    .line 71
    if-ne v1, v4, :cond_2

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbwn;->zza()Lcom/google/android/libraries/places/internal/zzbwn;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 78
    .line 79
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbwo;->zzb(Lcom/google/android/libraries/places/internal/zzbwn;)V

    .line 80
    .line 81
    .line 82
    :cond_2
    return-object v2

    .line 83
    :cond_3
    invoke-static {}, Ll/vg3;->a()V

    .line 84
    .line 85
    .line 86
    return-object v1

    .line 87
    :cond_4
    const-string p0, "byteCount: "

    .line 88
    .line 89
    invoke-static {p0, p1, p2}, Ll/mlk0;->a(Ljava/lang/String;J)V

    .line 90
    .line 91
    .line 92
    return-object v1
.end method

.method public final zzi()Ljava/lang/String;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 2
    .line 3
    sget-object v2, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbwb;->zzh(JLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final zzj(J)Ljava/lang/String;
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v1, v0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 4
    .line 5
    const-wide v3, 0x7fffffffffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    cmp-long v5, v1, v3

    .line 11
    .line 12
    if-gez v5, :cond_0

    .line 13
    .line 14
    move-wide v5, v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move-wide v5, v3

    .line 17
    :goto_0
    const-wide/16 v7, 0x0

    .line 18
    .line 19
    cmp-long v9, v5, v7

    .line 20
    .line 21
    if-nez v9, :cond_1

    .line 22
    .line 23
    :goto_1
    move-wide/from16 p1, v7

    .line 24
    .line 25
    const-wide/16 v5, -0x1

    .line 26
    .line 27
    const-wide/16 v16, -0x1

    .line 28
    .line 29
    goto/16 :goto_9

    .line 30
    .line 31
    :cond_1
    iget-object v9, v0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 32
    .line 33
    if-nez v9, :cond_2

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_2
    cmp-long v12, v1, v7

    .line 37
    .line 38
    const/16 v13, 0xa

    .line 39
    .line 40
    if-gez v12, :cond_8

    .line 41
    .line 42
    :goto_2
    cmp-long v12, v1, v7

    .line 43
    .line 44
    if-lez v12, :cond_3

    .line 45
    .line 46
    iget-object v9, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 47
    .line 48
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    iget v12, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 52
    .line 53
    iget v14, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 54
    .line 55
    sub-int/2addr v12, v14

    .line 56
    int-to-long v14, v12

    .line 57
    sub-long/2addr v1, v14

    .line 58
    goto :goto_2

    .line 59
    :cond_3
    move-wide v14, v7

    .line 60
    :goto_3
    cmp-long v12, v1, v5

    .line 61
    .line 62
    if-gez v12, :cond_6

    .line 63
    .line 64
    iget-object v12, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 65
    .line 66
    move-wide/from16 p1, v7

    .line 67
    .line 68
    iget v7, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 69
    .line 70
    int-to-long v7, v7

    .line 71
    const-wide/16 v16, -0x1

    .line 72
    .line 73
    iget v10, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 74
    .line 75
    int-to-long v10, v10

    .line 76
    add-long/2addr v10, v5

    .line 77
    sub-long/2addr v10, v1

    .line 78
    invoke-static {v7, v8, v10, v11}, Ljava/lang/Math;->min(JJ)J

    .line 79
    .line 80
    .line 81
    move-result-wide v7

    .line 82
    long-to-int v7, v7

    .line 83
    iget v8, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 84
    .line 85
    int-to-long v10, v8

    .line 86
    add-long/2addr v10, v14

    .line 87
    sub-long/2addr v10, v1

    .line 88
    long-to-int v8, v10

    .line 89
    :goto_4
    if-ge v8, v7, :cond_5

    .line 90
    .line 91
    aget-byte v10, v12, v8

    .line 92
    .line 93
    if-ne v10, v13, :cond_4

    .line 94
    .line 95
    iget v5, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 96
    .line 97
    sub-int/2addr v8, v5

    .line 98
    int-to-long v5, v8

    .line 99
    :goto_5
    add-long/2addr v5, v1

    .line 100
    goto/16 :goto_9

    .line 101
    .line 102
    :cond_4
    add-int/lit8 v8, v8, 0x1

    .line 103
    .line 104
    goto :goto_4

    .line 105
    :cond_5
    iget v7, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 106
    .line 107
    iget v8, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 108
    .line 109
    sub-int/2addr v7, v8

    .line 110
    int-to-long v7, v7

    .line 111
    add-long v14, v1, v7

    .line 112
    .line 113
    iget-object v9, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 114
    .line 115
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 116
    .line 117
    .line 118
    move-wide/from16 v7, p1

    .line 119
    .line 120
    move-wide v1, v14

    .line 121
    goto :goto_3

    .line 122
    :cond_6
    move-wide/from16 p1, v7

    .line 123
    .line 124
    const-wide/16 v16, -0x1

    .line 125
    .line 126
    :cond_7
    move-wide/from16 v5, v16

    .line 127
    .line 128
    goto :goto_9

    .line 129
    :cond_8
    move-wide/from16 p1, v7

    .line 130
    .line 131
    const-wide/16 v16, -0x1

    .line 132
    .line 133
    move-wide/from16 v1, p1

    .line 134
    .line 135
    :goto_6
    iget v7, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 136
    .line 137
    iget v8, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 138
    .line 139
    sub-int/2addr v7, v8

    .line 140
    int-to-long v7, v7

    .line 141
    add-long/2addr v7, v1

    .line 142
    cmp-long v10, v7, p1

    .line 143
    .line 144
    if-gtz v10, :cond_9

    .line 145
    .line 146
    iget-object v9, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 147
    .line 148
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 149
    .line 150
    .line 151
    move-wide v1, v7

    .line 152
    goto :goto_6

    .line 153
    :cond_9
    move-wide/from16 v7, p1

    .line 154
    .line 155
    :goto_7
    cmp-long v10, v1, v5

    .line 156
    .line 157
    if-gez v10, :cond_7

    .line 158
    .line 159
    iget-object v10, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 160
    .line 161
    iget v11, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 162
    .line 163
    int-to-long v11, v11

    .line 164
    iget v14, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 165
    .line 166
    int-to-long v14, v14

    .line 167
    add-long/2addr v14, v5

    .line 168
    sub-long/2addr v14, v1

    .line 169
    invoke-static {v11, v12, v14, v15}, Ljava/lang/Math;->min(JJ)J

    .line 170
    .line 171
    .line 172
    move-result-wide v11

    .line 173
    long-to-int v11, v11

    .line 174
    iget v12, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 175
    .line 176
    int-to-long v14, v12

    .line 177
    add-long/2addr v14, v7

    .line 178
    sub-long/2addr v14, v1

    .line 179
    long-to-int v7, v14

    .line 180
    :goto_8
    if-ge v7, v11, :cond_b

    .line 181
    .line 182
    aget-byte v8, v10, v7

    .line 183
    .line 184
    if-ne v8, v13, :cond_a

    .line 185
    .line 186
    iget v5, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 187
    .line 188
    sub-int/2addr v7, v5

    .line 189
    int-to-long v5, v7

    .line 190
    goto :goto_5

    .line 191
    :cond_a
    add-int/lit8 v7, v7, 0x1

    .line 192
    .line 193
    goto :goto_8

    .line 194
    :cond_b
    iget v7, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 195
    .line 196
    iget v8, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 197
    .line 198
    sub-int/2addr v7, v8

    .line 199
    int-to-long v7, v7

    .line 200
    add-long/2addr v7, v1

    .line 201
    iget-object v9, v9, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 202
    .line 203
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 204
    .line 205
    .line 206
    move-wide v1, v7

    .line 207
    goto :goto_7

    .line 208
    :goto_9
    cmp-long v1, v5, v16

    .line 209
    .line 210
    if-eqz v1, :cond_d

    .line 211
    .line 212
    sget v1, Lcom/google/android/libraries/places/internal/zzbwx;->zza:I

    .line 213
    .line 214
    cmp-long v1, v5, p1

    .line 215
    .line 216
    if-lez v1, :cond_c

    .line 217
    .line 218
    add-long v10, v5, v16

    .line 219
    .line 220
    invoke-virtual {v0, v10, v11}, Lcom/google/android/libraries/places/internal/zzbwb;->zzb(J)B

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    const/16 v2, 0xd

    .line 225
    .line 226
    if-ne v1, v2, :cond_c

    .line 227
    .line 228
    sget-object v1, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 229
    .line 230
    invoke-virtual {v0, v10, v11, v1}, Lcom/google/android/libraries/places/internal/zzbwb;->zzh(JLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    const-wide/16 v2, 0x2

    .line 235
    .line 236
    invoke-virtual {v0, v2, v3}, Lcom/google/android/libraries/places/internal/zzbwb;->zzF(J)V

    .line 237
    .line 238
    .line 239
    return-object v1

    .line 240
    :cond_c
    sget-object v1, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 241
    .line 242
    invoke-virtual {v0, v5, v6, v1}, Lcom/google/android/libraries/places/internal/zzbwb;->zzh(JLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    const-wide/16 v2, 0x1

    .line 247
    .line 248
    invoke-virtual {v0, v2, v3}, Lcom/google/android/libraries/places/internal/zzbwb;->zzF(J)V

    .line 249
    .line 250
    .line 251
    return-object v1

    .line 252
    :cond_d
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbwb;

    .line 253
    .line 254
    invoke-direct {v1}, Lcom/google/android/libraries/places/internal/zzbwb;-><init>()V

    .line 255
    .line 256
    .line 257
    const-wide/16 v5, 0x20

    .line 258
    .line 259
    iget-wide v7, v0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 260
    .line 261
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(JJ)J

    .line 262
    .line 263
    .line 264
    move-result-wide v13

    .line 265
    iget-wide v9, v0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 266
    .line 267
    const-wide/16 v11, 0x0

    .line 268
    .line 269
    invoke-static/range {v9 .. v14}, Lcom/google/android/libraries/places/internal/zzbvv;->zzb(JJJ)V

    .line 270
    .line 271
    .line 272
    cmp-long v2, v13, p1

    .line 273
    .line 274
    if-eqz v2, :cond_10

    .line 275
    .line 276
    iget-wide v5, v1, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 277
    .line 278
    add-long/2addr v5, v13

    .line 279
    iput-wide v5, v1, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 280
    .line 281
    iget-object v2, v0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 282
    .line 283
    move-wide/from16 v5, p1

    .line 284
    .line 285
    :goto_a
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 286
    .line 287
    .line 288
    iget v7, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 289
    .line 290
    iget v8, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 291
    .line 292
    sub-int/2addr v7, v8

    .line 293
    int-to-long v7, v7

    .line 294
    cmp-long v9, v5, v7

    .line 295
    .line 296
    if-ltz v9, :cond_e

    .line 297
    .line 298
    iget-object v2, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 299
    .line 300
    sub-long/2addr v5, v7

    .line 301
    goto :goto_a

    .line 302
    :cond_e
    :goto_b
    cmp-long v7, v13, p1

    .line 303
    .line 304
    if-lez v7, :cond_10

    .line 305
    .line 306
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 307
    .line 308
    .line 309
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzbwn;->zzc()Lcom/google/android/libraries/places/internal/zzbwn;

    .line 310
    .line 311
    .line 312
    move-result-object v7

    .line 313
    iget v8, v7, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 314
    .line 315
    long-to-int v5, v5

    .line 316
    add-int/2addr v8, v5

    .line 317
    iput v8, v7, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 318
    .line 319
    iget v5, v7, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 320
    .line 321
    long-to-int v6, v13

    .line 322
    add-int/2addr v8, v6

    .line 323
    invoke-static {v8, v5}, Ljava/lang/Math;->min(II)I

    .line 324
    .line 325
    .line 326
    move-result v5

    .line 327
    iput v5, v7, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 328
    .line 329
    iget-object v5, v1, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 330
    .line 331
    if-nez v5, :cond_f

    .line 332
    .line 333
    iput-object v7, v7, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 334
    .line 335
    iput-object v7, v7, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 336
    .line 337
    iput-object v7, v1, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 338
    .line 339
    goto :goto_c

    .line 340
    :cond_f
    iget-object v5, v5, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 341
    .line 342
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 343
    .line 344
    .line 345
    invoke-virtual {v5, v7}, Lcom/google/android/libraries/places/internal/zzbwn;->zzb(Lcom/google/android/libraries/places/internal/zzbwn;)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 346
    .line 347
    .line 348
    :goto_c
    iget v5, v7, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 349
    .line 350
    iget v6, v7, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 351
    .line 352
    sub-int/2addr v5, v6

    .line 353
    int-to-long v5, v5

    .line 354
    sub-long/2addr v13, v5

    .line 355
    iget-object v2, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 356
    .line 357
    move-wide/from16 v5, p1

    .line 358
    .line 359
    goto :goto_b

    .line 360
    :cond_10
    new-instance v2, Ljava/io/EOFException;

    .line 361
    .line 362
    iget-wide v5, v0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 363
    .line 364
    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->min(JJ)J

    .line 365
    .line 366
    .line 367
    move-result-wide v3

    .line 368
    iget-wide v5, v1, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 369
    .line 370
    invoke-virtual {v1, v5, v6}, Lcom/google/android/libraries/places/internal/zzbwb;->zzy(J)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 371
    .line 372
    .line 373
    move-result-object v0

    .line 374
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbwf;->zze()Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object v0

    .line 378
    new-instance v1, Ljava/lang/StringBuilder;

    .line 379
    .line 380
    const-string v5, "\\n not found: limit="

    .line 381
    .line 382
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 383
    .line 384
    .line 385
    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 386
    .line 387
    .line 388
    const-string v3, " content="

    .line 389
    .line 390
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 391
    .line 392
    .line 393
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 394
    .line 395
    .line 396
    const-string v0, "\u2026"

    .line 397
    .line 398
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 399
    .line 400
    .line 401
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object v0

    .line 405
    invoke-direct {v2, v0}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 406
    .line 407
    .line 408
    throw v2
.end method

.method public final zzk(Lcom/google/android/libraries/places/internal/zzbwf;)Lcom/google/android/libraries/places/internal/zzbwb;
    .locals 2
    .param p1    # Lcom/google/android/libraries/places/internal/zzbwf;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbwf;->zzc()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p1, p0, v0, v1}, Lcom/google/android/libraries/places/internal/zzbwf;->zzj(Lcom/google/android/libraries/places/internal/zzbwb;II)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public final zzl([BII)Lcom/google/android/libraries/places/internal/zzbwb;
    .locals 8
    .param p1    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    array-length v0, p1

    .line 5
    int-to-long v1, v0

    .line 6
    int-to-long v3, p2

    .line 7
    int-to-long v5, p3

    .line 8
    invoke-static/range {v1 .. v6}, Lcom/google/android/libraries/places/internal/zzbvv;->zzb(JJJ)V

    .line 9
    .line 10
    .line 11
    move v0, p2

    .line 12
    :goto_0
    add-int v1, p2, p3

    .line 13
    .line 14
    if-ge v0, v1, :cond_0

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-virtual {p0, v2}, Lcom/google/android/libraries/places/internal/zzbwb;->zzB(I)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget v3, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 22
    .line 23
    rsub-int v3, v3, 0x2000

    .line 24
    .line 25
    sub-int/2addr v1, v0

    .line 26
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iget-object v3, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 31
    .line 32
    iget v4, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 33
    .line 34
    add-int v7, v0, v1

    .line 35
    .line 36
    invoke-static {p1, v3, v4, v0, v7}, Lkotlin/collections/ArraysKt;->copyInto([B[BIII)[B

    .line 37
    .line 38
    .line 39
    iget v0, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 40
    .line 41
    add-int/2addr v0, v1

    .line 42
    iput v0, v2, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 43
    .line 44
    move v0, v7

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-wide p1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 47
    .line 48
    add-long/2addr p1, v5

    .line 49
    iput-wide p1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 50
    .line 51
    return-object p0
.end method

.method public final zzm(I)Lcom/google/android/libraries/places/internal/zzbwb;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzbwb;->zzB(I)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-object v1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 7
    .line 8
    iget v2, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 9
    .line 10
    add-int/lit8 v3, v2, 0x1

    .line 11
    .line 12
    iput v3, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 13
    .line 14
    int-to-byte p1, p1

    .line 15
    aput-byte p1, v1, v2

    .line 16
    .line 17
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 18
    .line 19
    const-wide/16 v2, 0x1

    .line 20
    .line 21
    add-long/2addr v0, v2

    .line 22
    iput-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 23
    .line 24
    return-object p0
.end method

.method public final zzn(Lcom/google/android/libraries/places/internal/zzbwb;J)V
    .locals 7
    .param p1    # Lcom/google/android/libraries/places/internal/zzbwb;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eq p1, p0, :cond_a

    .line 5
    .line 6
    iget-wide v0, p1, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    move-wide v4, p2

    .line 11
    invoke-static/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzbvv;->zzb(JJJ)V

    .line 12
    .line 13
    .line 14
    :goto_0
    const-wide/16 v0, 0x0

    .line 15
    .line 16
    cmp-long v0, p2, v0

    .line 17
    .line 18
    if-lez v0, :cond_9

    .line 19
    .line 20
    iget-object v0, p1, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    iget v0, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 26
    .line 27
    iget-object v1, p1, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    iget v1, v1, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 33
    .line 34
    sub-int/2addr v0, v1

    .line 35
    int-to-long v0, v0

    .line 36
    cmp-long v0, p2, v0

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    if-gez v0, :cond_4

    .line 40
    .line 41
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 42
    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_0
    const/4 v0, 0x0

    .line 49
    :goto_1
    long-to-int v2, p2

    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    iget-boolean v3, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzf:Z

    .line 53
    .line 54
    if-eqz v3, :cond_3

    .line 55
    .line 56
    iget v3, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 57
    .line 58
    int-to-long v3, v3

    .line 59
    add-long/2addr v3, p2

    .line 60
    iget-boolean v5, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zze:Z

    .line 61
    .line 62
    if-eqz v5, :cond_1

    .line 63
    .line 64
    move v5, v1

    .line 65
    goto :goto_2

    .line 66
    :cond_1
    iget v5, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 67
    .line 68
    :goto_2
    int-to-long v5, v5

    .line 69
    sub-long/2addr v3, v5

    .line 70
    const-wide/16 v5, 0x2000

    .line 71
    .line 72
    cmp-long v3, v3, v5

    .line 73
    .line 74
    if-lez v3, :cond_2

    .line 75
    .line 76
    goto :goto_3

    .line 77
    :cond_2
    iget-object v1, p1, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbwn;->zze(Lcom/google/android/libraries/places/internal/zzbwn;I)V

    .line 83
    .line 84
    .line 85
    iget-wide v0, p1, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 86
    .line 87
    sub-long/2addr v0, p2

    .line 88
    iput-wide v0, p1, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 89
    .line 90
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 91
    .line 92
    add-long/2addr v0, p2

    .line 93
    iput-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 94
    .line 95
    return-void

    .line 96
    :cond_3
    :goto_3
    iget-object v0, p1, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/internal/zzbwn;->zzd(I)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iput-object v0, p1, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 106
    .line 107
    :cond_4
    iget-object v0, p1, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 110
    .line 111
    .line 112
    iget v2, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 113
    .line 114
    iget v3, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 115
    .line 116
    sub-int/2addr v2, v3

    .line 117
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbwn;->zza()Lcom/google/android/libraries/places/internal/zzbwn;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    iput-object v3, p1, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 122
    .line 123
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 124
    .line 125
    if-nez v3, :cond_5

    .line 126
    .line 127
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 128
    .line 129
    iput-object v0, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 130
    .line 131
    iput-object v0, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzg:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 132
    .line 133
    goto :goto_5

    .line 134
    :cond_5
    iget-object v3, v3, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 135
    .line 136
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v3, v0}, Lcom/google/android/libraries/places/internal/zzbwn;->zzb(Lcom/google/android/libraries/places/internal/zzbwn;)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 140
    .line 141
    .line 142
    iget-object v3, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 143
    .line 144
    if-eq v3, v0, :cond_8

    .line 145
    .line 146
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 147
    .line 148
    .line 149
    iget-boolean v3, v3, Lcom/google/android/libraries/places/internal/zzbwn;->zzf:Z

    .line 150
    .line 151
    if-eqz v3, :cond_7

    .line 152
    .line 153
    iget v3, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 154
    .line 155
    iget v4, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 156
    .line 157
    sub-int/2addr v3, v4

    .line 158
    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 159
    .line 160
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 161
    .line 162
    .line 163
    iget v4, v4, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 164
    .line 165
    rsub-int v4, v4, 0x2000

    .line 166
    .line 167
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 168
    .line 169
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 170
    .line 171
    .line 172
    iget-boolean v5, v5, Lcom/google/android/libraries/places/internal/zzbwn;->zze:Z

    .line 173
    .line 174
    if-eqz v5, :cond_6

    .line 175
    .line 176
    goto :goto_4

    .line 177
    :cond_6
    iget-object v1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 178
    .line 179
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 180
    .line 181
    .line 182
    iget v1, v1, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 183
    .line 184
    :goto_4
    add-int/2addr v4, v1

    .line 185
    if-gt v3, v4, :cond_7

    .line 186
    .line 187
    iget-object v1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzh:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 188
    .line 189
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0, v1, v3}, Lcom/google/android/libraries/places/internal/zzbwn;->zze(Lcom/google/android/libraries/places/internal/zzbwn;I)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbwn;->zza()Lcom/google/android/libraries/places/internal/zzbwn;

    .line 196
    .line 197
    .line 198
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbwo;->zzb(Lcom/google/android/libraries/places/internal/zzbwn;)V

    .line 199
    .line 200
    .line 201
    :cond_7
    :goto_5
    int-to-long v0, v2

    .line 202
    iget-wide v2, p1, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 203
    .line 204
    sub-long/2addr v2, v0

    .line 205
    iput-wide v2, p1, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 206
    .line 207
    iget-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 208
    .line 209
    add-long/2addr v2, v0

    .line 210
    iput-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 211
    .line 212
    sub-long/2addr p2, v0

    .line 213
    goto/16 :goto_0

    .line 214
    .line 215
    :cond_8
    const-string p0, "cannot compact"

    .line 216
    .line 217
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    :cond_9
    return-void

    .line 221
    :cond_a
    const-string p0, "source == this"

    .line 222
    .line 223
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    return-void
.end method

.method public final zzo(J)Lcom/google/android/libraries/places/internal/zzbwb;
    .locals 10
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/16 p1, 0x30

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzbwb;->zzm(I)Lcom/google/android/libraries/places/internal/zzbwb;

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    const/4 v0, 0x1

    .line 14
    ushr-long v1, p1, v0

    .line 15
    .line 16
    or-long/2addr v1, p1

    .line 17
    const/4 v3, 0x2

    .line 18
    ushr-long v4, v1, v3

    .line 19
    .line 20
    or-long/2addr v1, v4

    .line 21
    const/4 v4, 0x4

    .line 22
    ushr-long v5, v1, v4

    .line 23
    .line 24
    or-long/2addr v1, v5

    .line 25
    const/16 v5, 0x8

    .line 26
    .line 27
    ushr-long v6, v1, v5

    .line 28
    .line 29
    or-long/2addr v1, v6

    .line 30
    ushr-long v6, v1, v0

    .line 31
    .line 32
    const-wide v8, 0x5555555555555555L    # 1.1945305291614955E103

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    and-long/2addr v6, v8

    .line 38
    sub-long/2addr v1, v6

    .line 39
    ushr-long v6, v1, v3

    .line 40
    .line 41
    const-wide v8, 0x3333333333333333L    # 4.667261458395856E-62

    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    and-long/2addr v6, v8

    .line 47
    and-long v0, v1, v8

    .line 48
    .line 49
    add-long/2addr v6, v0

    .line 50
    ushr-long v0, v6, v4

    .line 51
    .line 52
    add-long/2addr v0, v6

    .line 53
    const-wide v6, 0xf0f0f0f0f0f0f0fL    # 3.815736827118017E-236

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    and-long/2addr v0, v6

    .line 59
    ushr-long v5, v0, v5

    .line 60
    .line 61
    add-long/2addr v0, v5

    .line 62
    const/16 v2, 0x10

    .line 63
    .line 64
    ushr-long v5, v0, v2

    .line 65
    .line 66
    add-long/2addr v0, v5

    .line 67
    const/16 v2, 0x20

    .line 68
    .line 69
    ushr-long v5, v0, v2

    .line 70
    .line 71
    const-wide/16 v7, 0x3f

    .line 72
    .line 73
    and-long/2addr v0, v7

    .line 74
    and-long/2addr v5, v7

    .line 75
    add-long/2addr v0, v5

    .line 76
    const-wide/16 v5, 0x3

    .line 77
    .line 78
    add-long/2addr v0, v5

    .line 79
    shr-long/2addr v0, v3

    .line 80
    long-to-int v0, v0

    .line 81
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzbwb;->zzB(I)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iget-object v2, v1, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 86
    .line 87
    iget v3, v1, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 88
    .line 89
    add-int v5, v3, v0

    .line 90
    .line 91
    :goto_0
    add-int/lit8 v5, v5, -0x1

    .line 92
    .line 93
    if-lt v5, v3, :cond_1

    .line 94
    .line 95
    const-wide/16 v6, 0xf

    .line 96
    .line 97
    and-long/2addr v6, p1

    .line 98
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbwx;->zza()[B

    .line 99
    .line 100
    .line 101
    move-result-object v8

    .line 102
    long-to-int v6, v6

    .line 103
    aget-byte v6, v8, v6

    .line 104
    .line 105
    aput-byte v6, v2, v5

    .line 106
    .line 107
    ushr-long/2addr p1, v4

    .line 108
    goto :goto_0

    .line 109
    :cond_1
    iget p1, v1, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 110
    .line 111
    add-int/2addr p1, v0

    .line 112
    iput p1, v1, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 113
    .line 114
    iget-wide p1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 115
    .line 116
    int-to-long v0, v0

    .line 117
    add-long/2addr p1, v0

    .line 118
    iput-wide p1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 119
    .line 120
    return-object p0
.end method

.method public final zzp(I)Lcom/google/android/libraries/places/internal/zzbwb;
    .locals 6
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzbwb;->zzB(I)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, v1, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 7
    .line 8
    iget v3, v1, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 9
    .line 10
    add-int/lit8 v4, v3, 0x1

    .line 11
    .line 12
    shr-int/lit8 v5, p1, 0x18

    .line 13
    .line 14
    int-to-byte v5, v5

    .line 15
    aput-byte v5, v2, v3

    .line 16
    .line 17
    ushr-int/lit8 v5, p1, 0x10

    .line 18
    .line 19
    and-int/lit16 v5, v5, 0xff

    .line 20
    .line 21
    int-to-byte v5, v5

    .line 22
    aput-byte v5, v2, v4

    .line 23
    .line 24
    ushr-int/lit8 v4, p1, 0x8

    .line 25
    .line 26
    and-int/lit16 v4, v4, 0xff

    .line 27
    .line 28
    add-int/lit8 v5, v3, 0x2

    .line 29
    .line 30
    int-to-byte v4, v4

    .line 31
    aput-byte v4, v2, v5

    .line 32
    .line 33
    and-int/lit16 p1, p1, 0xff

    .line 34
    .line 35
    add-int/lit8 v4, v3, 0x3

    .line 36
    .line 37
    int-to-byte p1, p1

    .line 38
    aput-byte p1, v2, v4

    .line 39
    .line 40
    add-int/2addr v3, v0

    .line 41
    iput v3, v1, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 42
    .line 43
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 44
    .line 45
    const-wide/16 v2, 0x4

    .line 46
    .line 47
    add-long/2addr v0, v2

    .line 48
    iput-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 49
    .line 50
    return-object p0
.end method

.method public final zzq(I)Lcom/google/android/libraries/places/internal/zzbwb;
    .locals 6
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzbwb;->zzB(I)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, v1, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 7
    .line 8
    iget v3, v1, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 9
    .line 10
    add-int/lit8 v4, v3, 0x1

    .line 11
    .line 12
    ushr-int/lit8 v5, p1, 0x8

    .line 13
    .line 14
    and-int/lit16 v5, v5, 0xff

    .line 15
    .line 16
    int-to-byte v5, v5

    .line 17
    aput-byte v5, v2, v3

    .line 18
    .line 19
    and-int/lit16 p1, p1, 0xff

    .line 20
    .line 21
    int-to-byte p1, p1

    .line 22
    aput-byte p1, v2, v4

    .line 23
    .line 24
    add-int/2addr v3, v0

    .line 25
    iput v3, v1, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 26
    .line 27
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 28
    .line 29
    const-wide/16 v2, 0x2

    .line 30
    .line 31
    add-long/2addr v0, v2

    .line 32
    iput-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 33
    .line 34
    return-object p0
.end method

.method public final zzr(Ljava/io/OutputStream;J)Lcom/google/android/libraries/places/internal/zzbwb;
    .locals 7
    .param p1    # Ljava/io/OutputStream;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 5
    .line 6
    const-wide/16 v2, 0x0

    .line 7
    .line 8
    move-wide v4, p2

    .line 9
    invoke-static/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzbvv;->zzb(JJJ)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 13
    .line 14
    move-object v0, p2

    .line 15
    move-wide p2, v4

    .line 16
    :cond_0
    :goto_0
    const-wide/16 v1, 0x0

    .line 17
    .line 18
    cmp-long v1, p2, v1

    .line 19
    .line 20
    if-lez v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    iget v1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 26
    .line 27
    iget v2, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 28
    .line 29
    sub-int/2addr v1, v2

    .line 30
    int-to-long v1, v1

    .line 31
    invoke-static {p2, p3, v1, v2}, Ljava/lang/Math;->min(JJ)J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    long-to-int v1, v1

    .line 36
    iget-object v2, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 37
    .line 38
    iget v3, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 39
    .line 40
    invoke-virtual {p1, v2, v3, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 41
    .line 42
    .line 43
    iget v2, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 44
    .line 45
    add-int/2addr v2, v1

    .line 46
    iput v2, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzc:I

    .line 47
    .line 48
    iget-wide v3, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 49
    .line 50
    int-to-long v5, v1

    .line 51
    sub-long/2addr v3, v5

    .line 52
    iput-wide v3, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 53
    .line 54
    iget v1, v0, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 55
    .line 56
    sub-long/2addr p2, v5

    .line 57
    if-ne v2, v1, :cond_0

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbwn;->zza()Lcom/google/android/libraries/places/internal/zzbwn;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zza:Lcom/google/android/libraries/places/internal/zzbwn;

    .line 64
    .line 65
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbwo;->zzb(Lcom/google/android/libraries/places/internal/zzbwn;)V

    .line 66
    .line 67
    .line 68
    move-object v0, v1

    .line 69
    goto :goto_0

    .line 70
    :cond_1
    return-object p0
.end method

.method public final zzs(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbwb;
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzbwb;->zzt(Ljava/lang/String;II)Lcom/google/android/libraries/places/internal/zzbwb;

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public final zzt(Ljava/lang/String;II)Lcom/google/android/libraries/places/internal/zzbwb;
    .locals 10
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    if-ltz p3, :cond_9

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-gt p3, v0, :cond_8

    .line 12
    .line 13
    const/4 p2, 0x0

    .line 14
    move v0, p2

    .line 15
    :goto_0
    if-ge v0, p3, :cond_7

    .line 16
    .line 17
    add-int/lit8 v1, v0, 0x1

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/16 v3, 0x80

    .line 24
    .line 25
    if-ge v2, v3, :cond_1

    .line 26
    .line 27
    int-to-byte v2, v2

    .line 28
    const/4 v4, 0x1

    .line 29
    invoke-virtual {p0, v4}, Lcom/google/android/libraries/places/internal/zzbwb;->zzB(I)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    iget-object v5, v4, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 34
    .line 35
    iget v6, v4, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 36
    .line 37
    sub-int/2addr v6, v0

    .line 38
    rsub-int v7, v6, 0x2000

    .line 39
    .line 40
    invoke-static {p3, v7}, Ljava/lang/Math;->min(II)I

    .line 41
    .line 42
    .line 43
    move-result v7

    .line 44
    add-int/2addr v0, v6

    .line 45
    aput-byte v2, v5, v0

    .line 46
    .line 47
    move v0, v1

    .line 48
    :goto_1
    if-ge v0, v7, :cond_0

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-ge v1, v3, :cond_0

    .line 55
    .line 56
    add-int/lit8 v2, v0, 0x1

    .line 57
    .line 58
    add-int/2addr v0, v6

    .line 59
    int-to-byte v1, v1

    .line 60
    aput-byte v1, v5, v0

    .line 61
    .line 62
    move v0, v2

    .line 63
    goto :goto_1

    .line 64
    :cond_0
    add-int/2addr v6, v0

    .line 65
    iget v1, v4, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 66
    .line 67
    sub-int/2addr v6, v1

    .line 68
    add-int/2addr v1, v6

    .line 69
    iput v1, v4, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 70
    .line 71
    iget-wide v1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 72
    .line 73
    int-to-long v3, v6

    .line 74
    add-long/2addr v1, v3

    .line 75
    iput-wide v1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    const/16 v4, 0x800

    .line 79
    .line 80
    if-ge v2, v4, :cond_2

    .line 81
    .line 82
    const/4 v0, 0x2

    .line 83
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzbwb;->zzB(I)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    iget-object v5, v4, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 88
    .line 89
    iget v6, v4, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 90
    .line 91
    shr-int/lit8 v7, v2, 0x6

    .line 92
    .line 93
    or-int/lit16 v7, v7, 0xc0

    .line 94
    .line 95
    int-to-byte v7, v7

    .line 96
    aput-byte v7, v5, v6

    .line 97
    .line 98
    add-int/lit8 v7, v6, 0x1

    .line 99
    .line 100
    and-int/lit8 v2, v2, 0x3f

    .line 101
    .line 102
    or-int/2addr v2, v3

    .line 103
    int-to-byte v2, v2

    .line 104
    aput-byte v2, v5, v7

    .line 105
    .line 106
    add-int/2addr v6, v0

    .line 107
    iput v6, v4, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 108
    .line 109
    iget-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 110
    .line 111
    const-wide/16 v4, 0x2

    .line 112
    .line 113
    add-long/2addr v2, v4

    .line 114
    iput-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 115
    .line 116
    goto/16 :goto_4

    .line 117
    .line 118
    :cond_2
    const v4, 0xd800

    .line 119
    .line 120
    .line 121
    const/16 v5, 0x3f

    .line 122
    .line 123
    if-lt v2, v4, :cond_6

    .line 124
    .line 125
    const v4, 0xdfff

    .line 126
    .line 127
    .line 128
    if-le v2, v4, :cond_3

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :cond_3
    if-ge v1, p3, :cond_4

    .line 132
    .line 133
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 134
    .line 135
    .line 136
    move-result v4

    .line 137
    goto :goto_2

    .line 138
    :cond_4
    move v4, p2

    .line 139
    :goto_2
    const v6, 0xdbff

    .line 140
    .line 141
    .line 142
    if-gt v2, v6, :cond_5

    .line 143
    .line 144
    const v6, 0xdc00

    .line 145
    .line 146
    .line 147
    if-lt v4, v6, :cond_5

    .line 148
    .line 149
    const v6, 0xe000

    .line 150
    .line 151
    .line 152
    if-ge v4, v6, :cond_5

    .line 153
    .line 154
    and-int/lit16 v1, v2, 0x3ff

    .line 155
    .line 156
    shl-int/lit8 v1, v1, 0xa

    .line 157
    .line 158
    and-int/lit16 v2, v4, 0x3ff

    .line 159
    .line 160
    const/4 v4, 0x4

    .line 161
    invoke-virtual {p0, v4}, Lcom/google/android/libraries/places/internal/zzbwb;->zzB(I)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 162
    .line 163
    .line 164
    move-result-object v6

    .line 165
    iget-object v7, v6, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 166
    .line 167
    iget v8, v6, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 168
    .line 169
    or-int/2addr v1, v2

    .line 170
    const/high16 v2, 0x10000

    .line 171
    .line 172
    add-int/2addr v1, v2

    .line 173
    shr-int/lit8 v2, v1, 0x12

    .line 174
    .line 175
    or-int/lit16 v2, v2, 0xf0

    .line 176
    .line 177
    int-to-byte v2, v2

    .line 178
    aput-byte v2, v7, v8

    .line 179
    .line 180
    add-int/lit8 v2, v8, 0x1

    .line 181
    .line 182
    shr-int/lit8 v9, v1, 0xc

    .line 183
    .line 184
    and-int/2addr v9, v5

    .line 185
    or-int/2addr v9, v3

    .line 186
    int-to-byte v9, v9

    .line 187
    aput-byte v9, v7, v2

    .line 188
    .line 189
    add-int/lit8 v2, v8, 0x2

    .line 190
    .line 191
    shr-int/lit8 v9, v1, 0x6

    .line 192
    .line 193
    and-int/2addr v9, v5

    .line 194
    or-int/2addr v9, v3

    .line 195
    int-to-byte v9, v9

    .line 196
    aput-byte v9, v7, v2

    .line 197
    .line 198
    add-int/lit8 v2, v8, 0x3

    .line 199
    .line 200
    and-int/2addr v1, v5

    .line 201
    or-int/2addr v1, v3

    .line 202
    int-to-byte v1, v1

    .line 203
    aput-byte v1, v7, v2

    .line 204
    .line 205
    add-int/2addr v8, v4

    .line 206
    iput v8, v6, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 207
    .line 208
    iget-wide v1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 209
    .line 210
    const-wide/16 v3, 0x4

    .line 211
    .line 212
    add-long/2addr v1, v3

    .line 213
    iput-wide v1, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 214
    .line 215
    add-int/lit8 v0, v0, 0x2

    .line 216
    .line 217
    goto/16 :goto_0

    .line 218
    .line 219
    :cond_5
    invoke-virtual {p0, v5}, Lcom/google/android/libraries/places/internal/zzbwb;->zzm(I)Lcom/google/android/libraries/places/internal/zzbwb;

    .line 220
    .line 221
    .line 222
    goto :goto_4

    .line 223
    :cond_6
    :goto_3
    const/4 v0, 0x3

    .line 224
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzbwb;->zzB(I)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 225
    .line 226
    .line 227
    move-result-object v4

    .line 228
    iget-object v6, v4, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 229
    .line 230
    iget v7, v4, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 231
    .line 232
    shr-int/lit8 v8, v2, 0xc

    .line 233
    .line 234
    or-int/lit16 v8, v8, 0xe0

    .line 235
    .line 236
    int-to-byte v8, v8

    .line 237
    aput-byte v8, v6, v7

    .line 238
    .line 239
    add-int/lit8 v8, v7, 0x1

    .line 240
    .line 241
    shr-int/lit8 v9, v2, 0x6

    .line 242
    .line 243
    and-int/2addr v5, v9

    .line 244
    or-int/2addr v5, v3

    .line 245
    int-to-byte v5, v5

    .line 246
    aput-byte v5, v6, v8

    .line 247
    .line 248
    add-int/lit8 v5, v7, 0x2

    .line 249
    .line 250
    and-int/lit8 v2, v2, 0x3f

    .line 251
    .line 252
    or-int/2addr v2, v3

    .line 253
    int-to-byte v2, v2

    .line 254
    aput-byte v2, v6, v5

    .line 255
    .line 256
    add-int/2addr v7, v0

    .line 257
    iput v7, v4, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 258
    .line 259
    iget-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 260
    .line 261
    const-wide/16 v4, 0x3

    .line 262
    .line 263
    add-long/2addr v2, v4

    .line 264
    iput-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 265
    .line 266
    :goto_4
    move v0, v1

    .line 267
    goto/16 :goto_0

    .line 268
    .line 269
    :cond_7
    return-object p0

    .line 270
    :cond_8
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 271
    .line 272
    .line 273
    move-result p0

    .line 274
    const-string p1, "endIndex > string.length: "

    .line 275
    .line 276
    const-string v0, " > "

    .line 277
    .line 278
    invoke-static {p1, p3, v0, p0}, Ll/dpq0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 279
    .line 280
    .line 281
    return-object p2

    .line 282
    :cond_9
    const-string p0, "endIndex < beginIndex: "

    .line 283
    .line 284
    const-string p1, " < 0"

    .line 285
    .line 286
    invoke-static {p0, p3, p1}, Ll/vic0;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 287
    .line 288
    .line 289
    return-object p2
.end method

.method public final zzu(I)Lcom/google/android/libraries/places/internal/zzbwb;
    .locals 8
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/16 v0, 0x80

    .line 2
    .line 3
    if-ge p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzbwb;->zzm(I)Lcom/google/android/libraries/places/internal/zzbwb;

    .line 6
    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    const/16 v1, 0x800

    .line 10
    .line 11
    const/16 v2, 0x3f

    .line 12
    .line 13
    if-ge p1, v1, :cond_1

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    invoke-virtual {p0, v1}, Lcom/google/android/libraries/places/internal/zzbwb;->zzB(I)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    iget-object v4, v3, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 21
    .line 22
    iget v5, v3, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 23
    .line 24
    shr-int/lit8 v6, p1, 0x6

    .line 25
    .line 26
    or-int/lit16 v6, v6, 0xc0

    .line 27
    .line 28
    int-to-byte v6, v6

    .line 29
    aput-byte v6, v4, v5

    .line 30
    .line 31
    add-int/lit8 v6, v5, 0x1

    .line 32
    .line 33
    and-int/2addr p1, v2

    .line 34
    or-int/2addr p1, v0

    .line 35
    int-to-byte p1, p1

    .line 36
    aput-byte p1, v4, v6

    .line 37
    .line 38
    add-int/2addr v5, v1

    .line 39
    iput v5, v3, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 40
    .line 41
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 42
    .line 43
    const-wide/16 v2, 0x2

    .line 44
    .line 45
    add-long/2addr v0, v2

    .line 46
    iput-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_1
    const v1, 0xd800

    .line 50
    .line 51
    .line 52
    if-lt p1, v1, :cond_2

    .line 53
    .line 54
    const v1, 0xe000

    .line 55
    .line 56
    .line 57
    if-ge p1, v1, :cond_2

    .line 58
    .line 59
    invoke-virtual {p0, v2}, Lcom/google/android/libraries/places/internal/zzbwb;->zzm(I)Lcom/google/android/libraries/places/internal/zzbwb;

    .line 60
    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_2
    const/high16 v1, 0x10000

    .line 64
    .line 65
    if-ge p1, v1, :cond_3

    .line 66
    .line 67
    const/4 v1, 0x3

    .line 68
    invoke-virtual {p0, v1}, Lcom/google/android/libraries/places/internal/zzbwb;->zzB(I)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    iget-object v4, v3, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 73
    .line 74
    iget v5, v3, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 75
    .line 76
    shr-int/lit8 v6, p1, 0xc

    .line 77
    .line 78
    or-int/lit16 v6, v6, 0xe0

    .line 79
    .line 80
    int-to-byte v6, v6

    .line 81
    aput-byte v6, v4, v5

    .line 82
    .line 83
    add-int/lit8 v6, v5, 0x1

    .line 84
    .line 85
    shr-int/lit8 v7, p1, 0x6

    .line 86
    .line 87
    and-int/2addr v7, v2

    .line 88
    or-int/2addr v7, v0

    .line 89
    int-to-byte v7, v7

    .line 90
    aput-byte v7, v4, v6

    .line 91
    .line 92
    add-int/lit8 v6, v5, 0x2

    .line 93
    .line 94
    and-int/2addr p1, v2

    .line 95
    or-int/2addr p1, v0

    .line 96
    int-to-byte p1, p1

    .line 97
    aput-byte p1, v4, v6

    .line 98
    .line 99
    add-int/2addr v5, v1

    .line 100
    iput v5, v3, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 101
    .line 102
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 103
    .line 104
    const-wide/16 v2, 0x3

    .line 105
    .line 106
    add-long/2addr v0, v2

    .line 107
    iput-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 108
    .line 109
    return-object p0

    .line 110
    :cond_3
    const v1, 0x10ffff

    .line 111
    .line 112
    .line 113
    if-gt p1, v1, :cond_4

    .line 114
    .line 115
    const/4 v1, 0x4

    .line 116
    invoke-virtual {p0, v1}, Lcom/google/android/libraries/places/internal/zzbwb;->zzB(I)Lcom/google/android/libraries/places/internal/zzbwn;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    iget-object v4, v3, Lcom/google/android/libraries/places/internal/zzbwn;->zzb:[B

    .line 121
    .line 122
    iget v5, v3, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 123
    .line 124
    shr-int/lit8 v6, p1, 0x12

    .line 125
    .line 126
    or-int/lit16 v6, v6, 0xf0

    .line 127
    .line 128
    int-to-byte v6, v6

    .line 129
    aput-byte v6, v4, v5

    .line 130
    .line 131
    add-int/lit8 v6, v5, 0x1

    .line 132
    .line 133
    shr-int/lit8 v7, p1, 0xc

    .line 134
    .line 135
    and-int/2addr v7, v2

    .line 136
    or-int/2addr v7, v0

    .line 137
    int-to-byte v7, v7

    .line 138
    aput-byte v7, v4, v6

    .line 139
    .line 140
    add-int/lit8 v6, v5, 0x2

    .line 141
    .line 142
    shr-int/lit8 v7, p1, 0x6

    .line 143
    .line 144
    and-int/2addr v7, v2

    .line 145
    or-int/2addr v7, v0

    .line 146
    int-to-byte v7, v7

    .line 147
    aput-byte v7, v4, v6

    .line 148
    .line 149
    add-int/lit8 v6, v5, 0x3

    .line 150
    .line 151
    and-int/2addr p1, v2

    .line 152
    or-int/2addr p1, v0

    .line 153
    int-to-byte p1, p1

    .line 154
    aput-byte p1, v4, v6

    .line 155
    .line 156
    add-int/2addr v5, v1

    .line 157
    iput v5, v3, Lcom/google/android/libraries/places/internal/zzbwn;->zzd:I

    .line 158
    .line 159
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 160
    .line 161
    const-wide/16 v2, 0x4

    .line 162
    .line 163
    add-long/2addr v0, v2

    .line 164
    iput-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 165
    .line 166
    return-object p0

    .line 167
    :cond_4
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbvv;->zza(I)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    const-string p1, "Unexpected code point: 0x"

    .line 176
    .line 177
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    const/4 p0, 0x0

    .line 185
    return-object p0
.end method

.method public final bridge synthetic zzv(I)Lcom/google/android/libraries/places/internal/zzbwc;
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method public final bridge synthetic zzw(I)Lcom/google/android/libraries/places/internal/zzbwc;
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method public final bridge synthetic zzx(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbwc;
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method public final zzy(J)Lcom/google/android/libraries/places/internal/zzbwf;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_2

    .line 6
    .line 7
    const-wide/32 v0, 0x7fffffff

    .line 8
    .line 9
    .line 10
    cmp-long v0, p1, v0

    .line 11
    .line 12
    if-gtz v0, :cond_2

    .line 13
    .line 14
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 15
    .line 16
    cmp-long v0, v0, p1

    .line 17
    .line 18
    if-ltz v0, :cond_1

    .line 19
    .line 20
    const-wide/16 v0, 0x1000

    .line 21
    .line 22
    cmp-long v0, p1, v0

    .line 23
    .line 24
    if-ltz v0, :cond_0

    .line 25
    .line 26
    long-to-int v0, p1

    .line 27
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzbwb;->zzA(I)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzbwb;->zzF(J)V

    .line 32
    .line 33
    .line 34
    return-object v0

    .line 35
    :cond_0
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbwf;

    .line 36
    .line 37
    invoke-virtual {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzbwb;->zzH(J)[B

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-direct {v0, p0}, Lcom/google/android/libraries/places/internal/zzbwf;-><init>([B)V

    .line 42
    .line 43
    .line 44
    return-object v0

    .line 45
    :cond_1
    new-instance p0, Ljava/io/EOFException;

    .line 46
    .line 47
    const/4 p1, 0x0

    .line 48
    invoke-direct {p0, p1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    throw p0

    .line 52
    :cond_2
    const-string p0, "byteCount: "

    .line 53
    .line 54
    invoke-static {p0, p1, p2}, Ll/mlk0;->a(Ljava/lang/String;J)V

    .line 55
    .line 56
    .line 57
    const/4 p0, 0x0

    .line 58
    return-object p0
.end method

.method public final zzz()Lcom/google/android/libraries/places/internal/zzbwf;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbwb;->zzb:J

    .line 2
    .line 3
    const-wide/32 v2, 0x7fffffff

    .line 4
    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-gtz v2, :cond_0

    .line 9
    .line 10
    long-to-int v0, v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzbwb;->zzA(I)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v2, "size > Int.MAX_VALUE: "

    .line 19
    .line 20
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    throw v0
.end method
