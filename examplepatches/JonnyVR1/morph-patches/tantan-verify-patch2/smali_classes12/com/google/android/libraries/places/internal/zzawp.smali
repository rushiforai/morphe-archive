.class final Lcom/google/android/libraries/places/internal/zzawp;
.super Lcom/google/android/libraries/places/internal/zzawn;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzawn;-><init>()V

    return-void
.end method


# virtual methods
.method public final synthetic zza(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/libraries/places/internal/zzawo;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzawo;->zza()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic zzb(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/libraries/places/internal/zzawo;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzawo;->zzb()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final bridge synthetic zzc(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    check-cast p1, Lcom/google/android/libraries/places/internal/zzatu;

    .line 2
    .line 3
    iget-object p0, p1, Lcom/google/android/libraries/places/internal/zzatu;->zzc:Lcom/google/android/libraries/places/internal/zzawo;

    .line 4
    .line 5
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzawo;->zzc()Lcom/google/android/libraries/places/internal/zzawo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzawo;->zzf()Lcom/google/android/libraries/places/internal/zzawo;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iput-object p0, p1, Lcom/google/android/libraries/places/internal/zzatu;->zzc:Lcom/google/android/libraries/places/internal/zzawo;

    .line 16
    .line 17
    :cond_0
    return-object p0
.end method

.method public final synthetic zzd(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/libraries/places/internal/zzatu;

    .line 2
    .line 3
    iget-object p0, p1, Lcom/google/android/libraries/places/internal/zzatu;->zzc:Lcom/google/android/libraries/places/internal/zzawo;

    .line 4
    .line 5
    return-object p0
.end method

.method public final bridge synthetic zze(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzawo;->zzc()Lcom/google/android/libraries/places/internal/zzawo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p2}, Lcom/google/android/libraries/places/internal/zzawo;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzawo;->zzc()Lcom/google/android/libraries/places/internal/zzawo;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzawo;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    check-cast p2, Lcom/google/android/libraries/places/internal/zzawo;

    .line 22
    .line 23
    check-cast p1, Lcom/google/android/libraries/places/internal/zzawo;

    .line 24
    .line 25
    invoke-static {p1, p2}, Lcom/google/android/libraries/places/internal/zzawo;->zze(Lcom/google/android/libraries/places/internal/zzawo;Lcom/google/android/libraries/places/internal/zzawo;)Lcom/google/android/libraries/places/internal/zzawo;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    check-cast p2, Lcom/google/android/libraries/places/internal/zzawo;

    .line 31
    .line 32
    move-object p0, p1

    .line 33
    check-cast p0, Lcom/google/android/libraries/places/internal/zzawo;

    .line 34
    .line 35
    invoke-virtual {p0, p2}, Lcom/google/android/libraries/places/internal/zzawo;->zzd(Lcom/google/android/libraries/places/internal/zzawo;)Lcom/google/android/libraries/places/internal/zzawo;

    .line 36
    .line 37
    .line 38
    :cond_1
    return-object p1
.end method

.method public final synthetic zzf()Ljava/lang/Object;
    .locals 0

    invoke-static {}, Lcom/google/android/libraries/places/internal/zzawo;->zzf()Lcom/google/android/libraries/places/internal/zzawo;

    move-result-object p0

    return-object p0
.end method

.method public final synthetic zzg(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    move-object p0, p1

    .line 2
    check-cast p0, Lcom/google/android/libraries/places/internal/zzawo;

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzawo;->zzh()V

    .line 5
    .line 6
    .line 7
    return-object p1
.end method

.method public final bridge synthetic zzh(Ljava/lang/Object;II)V
    .locals 0

    .line 1
    shl-int/lit8 p0, p2, 0x3

    .line 2
    .line 3
    or-int/lit8 p0, p0, 0x5

    .line 4
    .line 5
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    check-cast p1, Lcom/google/android/libraries/places/internal/zzawo;

    .line 10
    .line 11
    invoke-virtual {p1, p0, p2}, Lcom/google/android/libraries/places/internal/zzawo;->zzj(ILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final bridge synthetic zzi(Ljava/lang/Object;IJ)V
    .locals 0

    .line 1
    shl-int/lit8 p0, p2, 0x3

    .line 2
    .line 3
    or-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    check-cast p1, Lcom/google/android/libraries/places/internal/zzawo;

    .line 10
    .line 11
    invoke-virtual {p1, p0, p2}, Lcom/google/android/libraries/places/internal/zzawo;->zzj(ILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final bridge synthetic zzj(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 0

    .line 1
    shl-int/lit8 p0, p2, 0x3

    .line 2
    .line 3
    check-cast p1, Lcom/google/android/libraries/places/internal/zzawo;

    .line 4
    .line 5
    or-int/lit8 p0, p0, 0x3

    .line 6
    .line 7
    invoke-virtual {p1, p0, p3}, Lcom/google/android/libraries/places/internal/zzawo;->zzj(ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final bridge synthetic zzk(Ljava/lang/Object;ILcom/google/android/libraries/places/internal/zzask;)V
    .locals 0

    .line 1
    shl-int/lit8 p0, p2, 0x3

    .line 2
    .line 3
    check-cast p1, Lcom/google/android/libraries/places/internal/zzawo;

    .line 4
    .line 5
    or-int/lit8 p0, p0, 0x2

    .line 6
    .line 7
    invoke-virtual {p1, p0, p3}, Lcom/google/android/libraries/places/internal/zzawo;->zzj(ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final bridge synthetic zzl(Ljava/lang/Object;IJ)V
    .locals 0

    .line 1
    shl-int/lit8 p0, p2, 0x3

    .line 2
    .line 3
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p1, Lcom/google/android/libraries/places/internal/zzawo;

    .line 8
    .line 9
    invoke-virtual {p1, p0, p2}, Lcom/google/android/libraries/places/internal/zzawo;->zzj(ILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final zzm(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/libraries/places/internal/zzatu;

    .line 2
    .line 3
    iget-object p0, p1, Lcom/google/android/libraries/places/internal/zzatu;->zzc:Lcom/google/android/libraries/places/internal/zzawo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzawo;->zzh()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic zzn(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/libraries/places/internal/zzatu;

    .line 2
    .line 3
    check-cast p2, Lcom/google/android/libraries/places/internal/zzawo;

    .line 4
    .line 5
    iput-object p2, p1, Lcom/google/android/libraries/places/internal/zzatu;->zzc:Lcom/google/android/libraries/places/internal/zzawo;

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic zzo(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/libraries/places/internal/zzatu;

    .line 2
    .line 3
    check-cast p2, Lcom/google/android/libraries/places/internal/zzawo;

    .line 4
    .line 5
    iput-object p2, p1, Lcom/google/android/libraries/places/internal/zzatu;->zzc:Lcom/google/android/libraries/places/internal/zzawo;

    .line 6
    .line 7
    return-void
.end method

.method public final zzq(Lcom/google/android/libraries/places/internal/zzavs;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final synthetic zzr(Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzasy;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/android/libraries/places/internal/zzawo;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/google/android/libraries/places/internal/zzawo;->zzk(Lcom/google/android/libraries/places/internal/zzasy;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic zzs(Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzasy;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/android/libraries/places/internal/zzawo;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/google/android/libraries/places/internal/zzawo;->zzl(Lcom/google/android/libraries/places/internal/zzasy;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
