.class final Lcom/google/android/libraries/places/internal/zzbpd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field final zza:Z

.field final zzb:Ljava/util/List;

.field final zzc:Ljava/util/Collection;

.field final zzd:Ljava/util/Collection;

.field final zze:I

.field final zzf:Lcom/google/android/libraries/places/internal/zzbpm;

.field final zzg:Z

.field final zzh:Z


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/Collection;Ljava/util/Collection;Lcom/google/android/libraries/places/internal/zzbpm;ZZZI)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzb:Ljava/util/List;

    .line 5
    .line 6
    const-string v0, "drainedSubstreams"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzc:Ljava/util/Collection;

    .line 12
    .line 13
    iput-object p4, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzf:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 14
    .line 15
    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzd:Ljava/util/Collection;

    .line 16
    .line 17
    iput-boolean p5, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzg:Z

    .line 18
    .line 19
    iput-boolean p6, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zza:Z

    .line 20
    .line 21
    iput-boolean p7, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzh:Z

    .line 22
    .line 23
    iput p8, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zze:I

    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    const/4 p3, 0x1

    .line 27
    if-eqz p6, :cond_0

    .line 28
    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    :cond_0
    move p1, p3

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    move p1, p0

    .line 34
    :goto_0
    const-string p7, "passThrough should imply buffer is null"

    .line 35
    .line 36
    invoke-static {p1, p7}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    if-eqz p6, :cond_2

    .line 40
    .line 41
    if-eqz p4, :cond_3

    .line 42
    .line 43
    :cond_2
    move p1, p3

    .line 44
    goto :goto_1

    .line 45
    :cond_3
    move p1, p0

    .line 46
    :goto_1
    const-string p7, "passThrough should imply winningSubstream != null"

    .line 47
    .line 48
    invoke-static {p1, p7}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    if-eqz p6, :cond_4

    .line 52
    .line 53
    invoke-interface {p2}, Ljava/util/Collection;->size()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-ne p1, p3, :cond_5

    .line 58
    .line 59
    invoke-interface {p2, p4}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-nez p1, :cond_4

    .line 64
    .line 65
    goto :goto_3

    .line 66
    :cond_4
    :goto_2
    move p1, p3

    .line 67
    goto :goto_4

    .line 68
    :cond_5
    :goto_3
    invoke-interface {p2}, Ljava/util/Collection;->size()I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-nez p1, :cond_6

    .line 73
    .line 74
    iget-boolean p1, p4, Lcom/google/android/libraries/places/internal/zzbpm;->zzb:Z

    .line 75
    .line 76
    if-eqz p1, :cond_6

    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_6
    move p1, p0

    .line 80
    :goto_4
    const-string p2, "passThrough should imply winningSubstream is drained"

    .line 81
    .line 82
    invoke-static {p1, p2}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    if-eqz p5, :cond_7

    .line 86
    .line 87
    if-eqz p4, :cond_8

    .line 88
    .line 89
    :cond_7
    move p0, p3

    .line 90
    :cond_8
    const-string p1, "cancelled should imply committed"

    .line 91
    .line 92
    invoke-static {p0, p1}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/libraries/places/internal/zzbpm;)Lcom/google/android/libraries/places/internal/zzbpd;
    .locals 11

    .line 1
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzh:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    xor-int/2addr v0, v1

    .line 5
    const-string v2, "hedging frozen"

    .line 6
    .line 7
    invoke-static {v0, v2}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzf:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    move v0, v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    const-string v2, "already committed"

    .line 18
    .line 19
    invoke-static {v0, v2}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzd:Ljava/util/Collection;

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    invoke-static {p1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    :goto_1
    move-object v5, p1

    .line 31
    goto :goto_2

    .line 32
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {v2, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    goto :goto_1

    .line 45
    :goto_2
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zze:I

    .line 46
    .line 47
    add-int/lit8 v10, p1, 0x1

    .line 48
    .line 49
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzb:Ljava/util/List;

    .line 50
    .line 51
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzc:Ljava/util/Collection;

    .line 52
    .line 53
    iget-object v6, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzf:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 54
    .line 55
    iget-boolean v7, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzg:Z

    .line 56
    .line 57
    iget-boolean v8, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zza:Z

    .line 58
    .line 59
    iget-boolean v9, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzh:Z

    .line 60
    .line 61
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbpd;

    .line 62
    .line 63
    invoke-direct/range {v2 .. v10}, Lcom/google/android/libraries/places/internal/zzbpd;-><init>(Ljava/util/List;Ljava/util/Collection;Ljava/util/Collection;Lcom/google/android/libraries/places/internal/zzbpm;ZZZI)V

    .line 64
    .line 65
    .line 66
    return-object v2
.end method

.method public final zzb()Lcom/google/android/libraries/places/internal/zzbpd;
    .locals 10

    .line 1
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzh:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzb:Ljava/util/List;

    .line 7
    .line 8
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzc:Ljava/util/Collection;

    .line 9
    .line 10
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzd:Ljava/util/Collection;

    .line 11
    .line 12
    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzf:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 13
    .line 14
    iget-boolean v6, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzg:Z

    .line 15
    .line 16
    iget-boolean v7, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zza:Z

    .line 17
    .line 18
    iget v9, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zze:I

    .line 19
    .line 20
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbpd;

    .line 21
    .line 22
    const/4 v8, 0x1

    .line 23
    invoke-direct/range {v1 .. v9}, Lcom/google/android/libraries/places/internal/zzbpd;-><init>(Ljava/util/List;Ljava/util/Collection;Ljava/util/Collection;Lcom/google/android/libraries/places/internal/zzbpm;ZZZI)V

    .line 24
    .line 25
    .line 26
    return-object v1
.end method

.method public final zzc(Lcom/google/android/libraries/places/internal/zzbpm;)Lcom/google/android/libraries/places/internal/zzbpd;
    .locals 12

    .line 1
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zza:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    xor-int/2addr v0, v1

    .line 5
    const-string v2, "Already passThrough"

    .line 6
    .line 7
    invoke-static {v0, v2}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-boolean v0, p1, Lcom/google/android/libraries/places/internal/zzbpm;->zzb:Z

    .line 11
    .line 12
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzc:Ljava/util/Collection;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    :goto_0
    move-object v5, v2

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzc:Ljava/util/Collection;

    .line 30
    .line 31
    new-instance v2, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {v2, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    goto :goto_0

    .line 44
    :goto_1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzf:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    move v9, v1

    .line 50
    goto :goto_2

    .line 51
    :cond_2
    move v9, v2

    .line 52
    :goto_2
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzb:Ljava/util/List;

    .line 53
    .line 54
    if-eqz v9, :cond_4

    .line 55
    .line 56
    if-ne v0, p1, :cond_3

    .line 57
    .line 58
    goto :goto_3

    .line 59
    :cond_3
    move v1, v2

    .line 60
    :goto_3
    const-string p1, "Another RPC attempt has already committed"

    .line 61
    .line 62
    invoke-static {v1, p1}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    const/4 v3, 0x0

    .line 66
    :cond_4
    move-object v4, v3

    .line 67
    iget-object v6, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzd:Ljava/util/Collection;

    .line 68
    .line 69
    iget-object v7, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzf:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 70
    .line 71
    iget-boolean v8, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzg:Z

    .line 72
    .line 73
    iget-boolean v10, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zzh:Z

    .line 74
    .line 75
    iget v11, p0, Lcom/google/android/libraries/places/internal/zzbpd;->zze:I

    .line 76
    .line 77
    new-instance v3, Lcom/google/android/libraries/places/internal/zzbpd;

    .line 78
    .line 79
    invoke-direct/range {v3 .. v11}, Lcom/google/android/libraries/places/internal/zzbpd;-><init>(Ljava/util/List;Ljava/util/Collection;Ljava/util/Collection;Lcom/google/android/libraries/places/internal/zzbpm;ZZZI)V

    .line 80
    .line 81
    .line 82
    return-object v3
.end method
