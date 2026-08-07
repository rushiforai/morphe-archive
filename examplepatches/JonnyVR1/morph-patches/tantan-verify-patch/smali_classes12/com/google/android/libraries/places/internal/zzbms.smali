.class final Lcom/google/android/libraries/places/internal/zzbms;
.super Ljava/io/OutputStream;
.source "SourceFile"


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzbmw;

.field private final zzb:Ljava/util/List;

.field private zzc:Lcom/google/android/libraries/places/internal/zzbra;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzbmw;Lcom/google/android/libraries/places/internal/zzbmr;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbms;->zza:Lcom/google/android/libraries/places/internal/zzbmw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbms;->zzb:Ljava/util/List;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic zza(Lcom/google/android/libraries/places/internal/zzbms;)I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbms;->zzb:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lcom/google/android/libraries/places/internal/zzbra;

    .line 19
    .line 20
    invoke-interface {v1}, Lcom/google/android/libraries/places/internal/zzbra;->zza()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    add-int/2addr v0, v1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return v0
.end method

.method public static bridge synthetic zzb(Lcom/google/android/libraries/places/internal/zzbms;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbms;->zzb:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public final write(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbms;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    int-to-byte p1, p1

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbra;->zzb()I

    move-result v1

    if-lez v1, :cond_0

    invoke-interface {v0, p1}, Lcom/google/android/libraries/places/internal/zzbra;->zzc(B)V

    return-void

    :cond_0
    const/4 v0, 0x1

    new-array v1, v0, [B

    const/4 v2, 0x0

    aput-byte p1, v1, v2

    .line 73
    invoke-virtual {p0, v1, v2, v0}, Lcom/google/android/libraries/places/internal/zzbms;->write([BII)V

    return-void
.end method

.method public final write([BII)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbms;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbms;->zza:Lcom/google/android/libraries/places/internal/zzbmw;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbmw;->zzg(Lcom/google/android/libraries/places/internal/zzbmw;)Lcom/google/android/libraries/places/internal/zzbrb;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0, p3}, Lcom/google/android/libraries/places/internal/zzbrb;->zza(I)Lcom/google/android/libraries/places/internal/zzbra;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbms;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbms;->zzb:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    :goto_0
    if-lez p3, :cond_2

    .line 23
    .line 24
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbms;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    .line 25
    .line 26
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbra;->zzb()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbms;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    .line 35
    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    invoke-interface {v1}, Lcom/google/android/libraries/places/internal/zzbra;->zza()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    add-int/2addr v0, v0

    .line 43
    invoke-static {p3, v0}, Ljava/lang/Math;->max(II)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbms;->zza:Lcom/google/android/libraries/places/internal/zzbmw;

    .line 48
    .line 49
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbmw;->zzg(Lcom/google/android/libraries/places/internal/zzbmw;)Lcom/google/android/libraries/places/internal/zzbrb;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-interface {v1, v0}, Lcom/google/android/libraries/places/internal/zzbrb;->zza(I)Lcom/google/android/libraries/places/internal/zzbra;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbms;->zzc:Lcom/google/android/libraries/places/internal/zzbra;

    .line 58
    .line 59
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbms;->zzb:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    invoke-interface {v1, p1, p2, v0}, Lcom/google/android/libraries/places/internal/zzbra;->zzd([BII)V

    .line 66
    .line 67
    .line 68
    add-int/2addr p2, v0

    .line 69
    sub-int/2addr p3, v0

    .line 70
    goto :goto_0

    .line 71
    :cond_2
    return-void
.end method
