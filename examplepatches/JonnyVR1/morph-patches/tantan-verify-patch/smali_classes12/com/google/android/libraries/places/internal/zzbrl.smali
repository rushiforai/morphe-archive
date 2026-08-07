.class Lcom/google/android/libraries/places/internal/zzbrl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzbts;


# instance fields
.field private final zza:Lcom/google/android/libraries/places/internal/zzbts;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbts;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbrl;->zza:Lcom/google/android/libraries/places/internal/zzbts;

    return-void
.end method


# virtual methods
.method public final close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbrl;->zza:Lcom/google/android/libraries/places/internal/zzbts;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/io/Closeable;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public zza(Lcom/google/android/libraries/places/internal/zzbue;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbrl;->zza:Lcom/google/android/libraries/places/internal/zzbts;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/google/android/libraries/places/internal/zzbts;->zza(Lcom/google/android/libraries/places/internal/zzbue;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public zzb(ZII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbrl;->zza:Lcom/google/android/libraries/places/internal/zzbts;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Lcom/google/android/libraries/places/internal/zzbts;->zzb(ZII)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public zzc(ILcom/google/android/libraries/places/internal/zzbtp;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbrl;->zza:Lcom/google/android/libraries/places/internal/zzbts;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzbts;->zzc(ILcom/google/android/libraries/places/internal/zzbtp;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zzd()I
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbrl;->zza:Lcom/google/android/libraries/places/internal/zzbts;

    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbts;->zzd()I

    move-result p0

    return p0
.end method

.method public final zze()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbrl;->zza:Lcom/google/android/libraries/places/internal/zzbts;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbts;->zze()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zzf(ZILcom/google/android/libraries/places/internal/zzbwb;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbrl;->zza:Lcom/google/android/libraries/places/internal/zzbts;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/google/android/libraries/places/internal/zzbts;->zzf(ZILcom/google/android/libraries/places/internal/zzbwb;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zzg()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbrl;->zza:Lcom/google/android/libraries/places/internal/zzbts;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbts;->zzg()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zzh(ILcom/google/android/libraries/places/internal/zzbtp;[B)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbrl;->zza:Lcom/google/android/libraries/places/internal/zzbts;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-interface {p0, p1, p2, p3}, Lcom/google/android/libraries/places/internal/zzbts;->zzh(ILcom/google/android/libraries/places/internal/zzbtp;[B)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final zzi(Lcom/google/android/libraries/places/internal/zzbue;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbrl;->zza:Lcom/google/android/libraries/places/internal/zzbts;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/google/android/libraries/places/internal/zzbts;->zzi(Lcom/google/android/libraries/places/internal/zzbue;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zzj(ZZIILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbrl;->zza:Lcom/google/android/libraries/places/internal/zzbts;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    const/4 p4, 0x0

    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-interface/range {p0 .. p5}, Lcom/google/android/libraries/places/internal/zzbts;->zzj(ZZIILjava/util/List;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final zzk(IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbrl;->zza:Lcom/google/android/libraries/places/internal/zzbts;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Lcom/google/android/libraries/places/internal/zzbts;->zzk(IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
