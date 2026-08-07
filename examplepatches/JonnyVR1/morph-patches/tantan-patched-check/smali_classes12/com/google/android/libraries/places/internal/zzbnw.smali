.class final Lcom/google/android/libraries/places/internal/zzbnw;
.super Ljava/io/InputStream;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzbav;


# instance fields
.field private final zza:Lcom/google/android/libraries/places/internal/zzbnv;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbnv;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "buffer"

    .line 5
    .line 6
    invoke-static {p1, v0}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnw;->zza:Lcom/google/android/libraries/places/internal/zzbnv;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final available()I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnw;->zza:Lcom/google/android/libraries/places/internal/zzbnv;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzf()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnw;->zza:Lcom/google/android/libraries/places/internal/zzbnv;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbnv;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final mark(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnw;->zza:Lcom/google/android/libraries/places/internal/zzbnv;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzb()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final markSupported()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnw;->zza:Lcom/google/android/libraries/places/internal/zzbnv;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzd()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final read()I
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnw;->zza:Lcom/google/android/libraries/places/internal/zzbnv;

    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzf()I

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, -0x1

    return p0

    :cond_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnw;->zza:Lcom/google/android/libraries/places/internal/zzbnv;

    .line 28
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbnv;->zze()I

    move-result p0

    return p0
.end method

.method public final read([BII)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnw;->zza:Lcom/google/android/libraries/places/internal/zzbnv;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzf()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, -0x1

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnw;->zza:Lcom/google/android/libraries/places/internal/zzbnv;

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzf()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnw;->zza:Lcom/google/android/libraries/places/internal/zzbnv;

    .line 22
    .line 23
    invoke-interface {p0, p1, p2, p3}, Lcom/google/android/libraries/places/internal/zzbnv;->zzk([BII)V

    .line 24
    .line 25
    .line 26
    return p3
.end method

.method public final reset()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnw;->zza:Lcom/google/android/libraries/places/internal/zzbnv;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzc()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final skip(J)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnw;->zza:Lcom/google/android/libraries/places/internal/zzbnv;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzf()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-long v0, v0

    .line 8
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->min(JJ)J

    .line 9
    .line 10
    .line 11
    move-result-wide p1

    .line 12
    long-to-int p1, p1

    .line 13
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnw;->zza:Lcom/google/android/libraries/places/internal/zzbnv;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Lcom/google/android/libraries/places/internal/zzbnv;->zzl(I)V

    .line 16
    .line 17
    .line 18
    int-to-long p0, p1

    .line 19
    return-wide p0
.end method
