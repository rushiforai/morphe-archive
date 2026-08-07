.class final Lcom/google/android/libraries/places/internal/zzbkr;
.super Lcom/google/android/libraries/places/internal/zzbpo;
.source "SourceFile"


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzbcl;

.field final synthetic zzb:Lcom/google/android/libraries/places/internal/zzbcf;

.field final synthetic zzc:Lcom/google/android/libraries/places/internal/zzayj;

.field final synthetic zzd:Lcom/google/android/libraries/places/internal/zzbpp;

.field final synthetic zze:Lcom/google/android/libraries/places/internal/zzbje;

.field final synthetic zzf:Lcom/google/android/libraries/places/internal/zzazj;

.field final synthetic zzg:Lcom/google/android/libraries/places/internal/zzbkt;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbkt;Lcom/google/android/libraries/places/internal/zzbcl;Lcom/google/android/libraries/places/internal/zzbcf;Lcom/google/android/libraries/places/internal/zzayj;Lcom/google/android/libraries/places/internal/zzbpp;Lcom/google/android/libraries/places/internal/zzbje;Lcom/google/android/libraries/places/internal/zzazj;)V
    .locals 15

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p4

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iput-object v2, p0, Lcom/google/android/libraries/places/internal/zzbkr;->zza:Lcom/google/android/libraries/places/internal/zzbcl;

    .line 8
    .line 9
    move-object/from16 v3, p3

    .line 10
    .line 11
    iput-object v3, p0, Lcom/google/android/libraries/places/internal/zzbkr;->zzb:Lcom/google/android/libraries/places/internal/zzbcf;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbkr;->zzc:Lcom/google/android/libraries/places/internal/zzayj;

    .line 14
    .line 15
    move-object/from16 v10, p5

    .line 16
    .line 17
    iput-object v10, p0, Lcom/google/android/libraries/places/internal/zzbkr;->zzd:Lcom/google/android/libraries/places/internal/zzbpp;

    .line 18
    .line 19
    move-object/from16 v11, p6

    .line 20
    .line 21
    iput-object v11, p0, Lcom/google/android/libraries/places/internal/zzbkr;->zze:Lcom/google/android/libraries/places/internal/zzbje;

    .line 22
    .line 23
    move-object/from16 v4, p7

    .line 24
    .line 25
    iput-object v4, p0, Lcom/google/android/libraries/places/internal/zzbkr;->zzf:Lcom/google/android/libraries/places/internal/zzazj;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbkr;->zzg:Lcom/google/android/libraries/places/internal/zzbkt;

    .line 28
    .line 29
    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbkt;->zzb:Lcom/google/android/libraries/places/internal/zzbma;

    .line 30
    .line 31
    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbma;->zzC(Lcom/google/android/libraries/places/internal/zzbma;)Lcom/google/android/libraries/places/internal/zzbox;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbma;->zze(Lcom/google/android/libraries/places/internal/zzbma;)J

    .line 36
    .line 37
    .line 38
    move-result-wide v5

    .line 39
    move-wide v8, v5

    .line 40
    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbma;->zzd(Lcom/google/android/libraries/places/internal/zzbma;)J

    .line 41
    .line 42
    .line 43
    move-result-wide v6

    .line 44
    invoke-static {v4, v1}, Lcom/google/android/libraries/places/internal/zzbma;->zzJ(Lcom/google/android/libraries/places/internal/zzbma;Lcom/google/android/libraries/places/internal/zzayj;)Ljava/util/concurrent/Executor;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbkt;->zzb:Lcom/google/android/libraries/places/internal/zzbma;

    .line 49
    .line 50
    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbma;->zzs(Lcom/google/android/libraries/places/internal/zzbma;)Lcom/google/android/libraries/places/internal/zzbfw;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-interface {v4}, Lcom/google/android/libraries/places/internal/zzbfw;->zzb()Ljava/util/concurrent/ScheduledExecutorService;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    iget-object v12, v0, Lcom/google/android/libraries/places/internal/zzbkt;->zza:Lcom/google/android/libraries/places/internal/zzbpn;

    .line 59
    .line 60
    move-wide v13, v8

    .line 61
    move-object v9, v4

    .line 62
    move-wide v4, v13

    .line 63
    move-object v0, p0

    .line 64
    move-object v8, v1

    .line 65
    move-object v1, v2

    .line 66
    move-object/from16 v2, p3

    .line 67
    .line 68
    invoke-direct/range {v0 .. v12}, Lcom/google/android/libraries/places/internal/zzbpo;-><init>(Lcom/google/android/libraries/places/internal/zzbcl;Lcom/google/android/libraries/places/internal/zzbcf;Lcom/google/android/libraries/places/internal/zzbox;JJLjava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;Lcom/google/android/libraries/places/internal/zzbpp;Lcom/google/android/libraries/places/internal/zzbje;Lcom/google/android/libraries/places/internal/zzbpn;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method


# virtual methods
.method public final zza()Lcom/google/android/libraries/places/internal/zzbdo;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbkr;->zzg:Lcom/google/android/libraries/places/internal/zzbkt;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbkt;->zzb:Lcom/google/android/libraries/places/internal/zzbma;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbma;->zzz(Lcom/google/android/libraries/places/internal/zzbma;)Lcom/google/android/libraries/places/internal/zzblz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, v0, Lcom/google/android/libraries/places/internal/zzblz;->zza:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter v1

    .line 12
    :try_start_0
    iget-object v2, v0, Lcom/google/android/libraries/places/internal/zzblz;->zzc:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    monitor-exit v1

    .line 17
    return-object v2

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzblz;->zzb:Ljava/util/Collection;

    .line 21
    .line 22
    invoke-interface {v0, p0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    monitor-exit v1

    .line 26
    const/4 p0, 0x0

    .line 27
    return-object p0

    .line 28
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw p0
.end method

.method public final zzb(Lcom/google/android/libraries/places/internal/zzbcf;Lcom/google/android/libraries/places/internal/zzayu;IZ)Lcom/google/android/libraries/places/internal/zzbfr;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbkr;->zzc:Lcom/google/android/libraries/places/internal/zzayj;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Lcom/google/android/libraries/places/internal/zzayj;->zzf(Lcom/google/android/libraries/places/internal/zzayu;)Lcom/google/android/libraries/places/internal/zzayj;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p2, p1, p3, p4}, Lcom/google/android/libraries/places/internal/zzbjd;->zzk(Lcom/google/android/libraries/places/internal/zzayj;Lcom/google/android/libraries/places/internal/zzbcf;IZ)[Lcom/google/android/libraries/places/internal/zzayx;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    new-instance p4, Lcom/google/android/libraries/places/internal/zzbnr;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbkr;->zza:Lcom/google/android/libraries/places/internal/zzbcl;

    .line 14
    .line 15
    invoke-direct {p4, v0, p1, p2}, Lcom/google/android/libraries/places/internal/zzbnr;-><init>(Lcom/google/android/libraries/places/internal/zzbcl;Lcom/google/android/libraries/places/internal/zzbcf;Lcom/google/android/libraries/places/internal/zzayj;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbkr;->zzg:Lcom/google/android/libraries/places/internal/zzbkt;

    .line 19
    .line 20
    invoke-static {v0, p4}, Lcom/google/android/libraries/places/internal/zzbkt;->zzb(Lcom/google/android/libraries/places/internal/zzbkt;Lcom/google/android/libraries/places/internal/zzbbf;)Lcom/google/android/libraries/places/internal/zzbfu;

    .line 21
    .line 22
    .line 23
    move-result-object p4

    .line 24
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbkr;->zzf:Lcom/google/android/libraries/places/internal/zzazj;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzazj;->zza()Lcom/google/android/libraries/places/internal/zzazj;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    :try_start_0
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbkr;->zza:Lcom/google/android/libraries/places/internal/zzbcl;

    .line 31
    .line 32
    invoke-interface {p4, v1, p1, p2, p3}, Lcom/google/android/libraries/places/internal/zzbfu;->zza(Lcom/google/android/libraries/places/internal/zzbcl;Lcom/google/android/libraries/places/internal/zzbcf;Lcom/google/android/libraries/places/internal/zzayj;[Lcom/google/android/libraries/places/internal/zzayx;)Lcom/google/android/libraries/places/internal/zzbfr;

    .line 33
    .line 34
    .line 35
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbkr;->zzf:Lcom/google/android/libraries/places/internal/zzazj;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzazj;->zze(Lcom/google/android/libraries/places/internal/zzazj;)V

    .line 39
    .line 40
    .line 41
    return-object p1

    .line 42
    :catchall_0
    move-exception p1

    .line 43
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbkr;->zzf:Lcom/google/android/libraries/places/internal/zzazj;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzazj;->zze(Lcom/google/android/libraries/places/internal/zzazj;)V

    .line 46
    .line 47
    .line 48
    throw p1
.end method

.method public final zzc()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbkr;->zzg:Lcom/google/android/libraries/places/internal/zzbkt;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbkt;->zzb:Lcom/google/android/libraries/places/internal/zzbma;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbma;->zzz(Lcom/google/android/libraries/places/internal/zzbma;)Lcom/google/android/libraries/places/internal/zzblz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, v0, Lcom/google/android/libraries/places/internal/zzblz;->zza:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter v1

    .line 12
    :try_start_0
    iget-object v2, v0, Lcom/google/android/libraries/places/internal/zzblz;->zzb:Ljava/util/Collection;

    .line 13
    .line 14
    invoke-interface {v2, p0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    iget-object p0, v0, Lcom/google/android/libraries/places/internal/zzblz;->zzb:Ljava/util/Collection;

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p0, v0, Lcom/google/android/libraries/places/internal/zzblz;->zzc:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 26
    .line 27
    new-instance v2, Ljava/util/HashSet;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v2, v0, Lcom/google/android/libraries/places/internal/zzblz;->zzb:Ljava/util/Collection;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    if-eqz p0, :cond_1

    .line 40
    .line 41
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzblz;->zzd:Lcom/google/android/libraries/places/internal/zzbma;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbma;->zzu(Lcom/google/android/libraries/places/internal/zzbma;)Lcom/google/android/libraries/places/internal/zzbhg;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0, p0}, Lcom/google/android/libraries/places/internal/zzbhg;->zzd(Lcom/google/android/libraries/places/internal/zzbdo;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void

    .line 51
    :goto_1
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    throw p0
.end method
