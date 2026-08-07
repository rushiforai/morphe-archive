.class final Lcom/google/android/libraries/places/internal/zzbhf;
.super Lcom/google/android/libraries/places/internal/zzbhy;
.source "SourceFile"


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzbhg;

.field private final zzb:Lcom/google/android/libraries/places/internal/zzbbf;

.field private final zzc:Lcom/google/android/libraries/places/internal/zzazj;

.field private final zzd:[Lcom/google/android/libraries/places/internal/zzayx;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzbhg;Lcom/google/android/libraries/places/internal/zzbbf;[Lcom/google/android/libraries/places/internal/zzayx;Lcom/google/android/libraries/places/internal/zzbhe;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbhf;->zza:Lcom/google/android/libraries/places/internal/zzbhg;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbhy;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzazj;->zzb()Lcom/google/android/libraries/places/internal/zzazj;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbhf;->zzc:Lcom/google/android/libraries/places/internal/zzazj;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbhf;->zzb:Lcom/google/android/libraries/places/internal/zzbbf;

    .line 13
    .line 14
    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzbhf;->zzd:[Lcom/google/android/libraries/places/internal/zzayx;

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic zza(Lcom/google/android/libraries/places/internal/zzbhf;)Lcom/google/android/libraries/places/internal/zzbbf;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbhf;->zzb:Lcom/google/android/libraries/places/internal/zzbbf;

    return-object p0
.end method

.method public static bridge synthetic zzb(Lcom/google/android/libraries/places/internal/zzbhf;Lcom/google/android/libraries/places/internal/zzbfu;)Ljava/lang/Runnable;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbhf;->zzc:Lcom/google/android/libraries/places/internal/zzazj;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzazj;->zza()Lcom/google/android/libraries/places/internal/zzazj;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :try_start_0
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbhf;->zzb:Lcom/google/android/libraries/places/internal/zzbbf;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbbf;->zzc()Lcom/google/android/libraries/places/internal/zzbcl;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbbf;->zzb()Lcom/google/android/libraries/places/internal/zzbcf;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbbf;->zza()Lcom/google/android/libraries/places/internal/zzayj;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbhf;->zzd:[Lcom/google/android/libraries/places/internal/zzayx;

    .line 22
    .line 23
    invoke-interface {p1, v2, v3, v1, v4}, Lcom/google/android/libraries/places/internal/zzbfu;->zza(Lcom/google/android/libraries/places/internal/zzbcl;Lcom/google/android/libraries/places/internal/zzbcf;Lcom/google/android/libraries/places/internal/zzayj;[Lcom/google/android/libraries/places/internal/zzayx;)Lcom/google/android/libraries/places/internal/zzbfr;

    .line 24
    .line 25
    .line 26
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbhf;->zzc:Lcom/google/android/libraries/places/internal/zzazj;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzazj;->zze(Lcom/google/android/libraries/places/internal/zzazj;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzbhy;->zze(Lcom/google/android/libraries/places/internal/zzbfr;)Ljava/lang/Runnable;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :catchall_0
    move-exception p1

    .line 38
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbhf;->zzc:Lcom/google/android/libraries/places/internal/zzazj;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzazj;->zze(Lcom/google/android/libraries/places/internal/zzazj;)V

    .line 41
    .line 42
    .line 43
    throw p1
.end method


# virtual methods
.method public final zzc(Lcom/google/android/libraries/places/internal/zzbdo;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    :goto_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbhf;->zzd:[Lcom/google/android/libraries/places/internal/zzayx;

    .line 3
    .line 4
    array-length v1, v0

    .line 5
    if-ge p1, v1, :cond_0

    .line 6
    .line 7
    aget-object v0, v0, p1

    .line 8
    .line 9
    add-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void
.end method

.method public final zzg(Lcom/google/android/libraries/places/internal/zzbjj;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbhf;->zzb:Lcom/google/android/libraries/places/internal/zzbbf;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbbf;->zza()Lcom/google/android/libraries/places/internal/zzayj;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzayj;->zzo()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string v0, "wait_for_ready"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lcom/google/android/libraries/places/internal/zzbjj;->zza(Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzbjj;

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-super {p0, p1}, Lcom/google/android/libraries/places/internal/zzbhy;->zzg(Lcom/google/android/libraries/places/internal/zzbjj;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final zzh(Lcom/google/android/libraries/places/internal/zzbdo;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/libraries/places/internal/zzbhy;->zzh(Lcom/google/android/libraries/places/internal/zzbdo;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbhf;->zza:Lcom/google/android/libraries/places/internal/zzbhg;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbhg;->zzg(Lcom/google/android/libraries/places/internal/zzbhg;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    monitor-enter p1

    .line 11
    :try_start_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbhf;->zza:Lcom/google/android/libraries/places/internal/zzbhg;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbhg;->zzi(Lcom/google/android/libraries/places/internal/zzbhg;)Ljava/lang/Runnable;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbhg;->zzk(Lcom/google/android/libraries/places/internal/zzbhg;)Ljava/util/Collection;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0, p0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbhf;->zza:Lcom/google/android/libraries/places/internal/zzbhg;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbhg;->zzn()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_0

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbhf;->zza:Lcom/google/android/libraries/places/internal/zzbhg;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbhg;->zze(Lcom/google/android/libraries/places/internal/zzbhg;)Lcom/google/android/libraries/places/internal/zzbdw;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbhg;->zzh(Lcom/google/android/libraries/places/internal/zzbhg;)Ljava/lang/Runnable;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzbdw;->zzc(Ljava/lang/Runnable;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbhf;->zza:Lcom/google/android/libraries/places/internal/zzbhg;

    .line 51
    .line 52
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbhg;->zzb(Lcom/google/android/libraries/places/internal/zzbhg;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbhg;->zze(Lcom/google/android/libraries/places/internal/zzbhg;)Lcom/google/android/libraries/places/internal/zzbdw;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbhg;->zzi(Lcom/google/android/libraries/places/internal/zzbhg;)Ljava/lang/Runnable;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzbdw;->zzc(Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbhf;->zza:Lcom/google/android/libraries/places/internal/zzbhg;

    .line 70
    .line 71
    const/4 v1, 0x0

    .line 72
    invoke-static {v0, v1}, Lcom/google/android/libraries/places/internal/zzbhg;->zzl(Lcom/google/android/libraries/places/internal/zzbhg;Ljava/lang/Runnable;)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :catchall_0
    move-exception p0

    .line 77
    goto :goto_1

    .line 78
    :cond_0
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbhf;->zza:Lcom/google/android/libraries/places/internal/zzbhg;

    .line 80
    .line 81
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbhg;->zze(Lcom/google/android/libraries/places/internal/zzbhg;)Lcom/google/android/libraries/places/internal/zzbdw;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbdw;->zzb()V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :goto_1
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 90
    throw p0
.end method
