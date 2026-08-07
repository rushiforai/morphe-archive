.class final Lcom/google/android/libraries/places/internal/zzbpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzbft;


# instance fields
.field final zza:Lcom/google/android/libraries/places/internal/zzbpm;

.field final synthetic zzb:Lcom/google/android/libraries/places/internal/zzbpo;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbpo;Lcom/google/android/libraries/places/internal/zzbpm;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbpl;->zza:Lcom/google/android/libraries/places/internal/zzbpm;

    return-void
.end method

.method private static final zza(Lcom/google/android/libraries/places/internal/zzbcf;)Ljava/lang/Integer;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbpo;->zzi:Lcom/google/android/libraries/places/internal/zzbca;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzbcf;->zzb(Lcom/google/android/libraries/places/internal/zzbca;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    return-object p0

    .line 16
    :catch_0
    const/4 p0, -0x1

    .line 17
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method


# virtual methods
.method public final zzd(Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbfs;Lcom/google/android/libraries/places/internal/zzbcf;)V
    .locals 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    .line 1
    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zzH(Lcom/google/android/libraries/places/internal/zzbpo;)Ljava/lang/Object;

    move-result-object v4

    monitor-enter v4

    :try_start_0
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzbpo;->zzD(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpd;

    move-result-object v6

    iget-object v7, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zza:Lcom/google/android/libraries/places/internal/zzbpm;

    const/4 v8, 0x1

    .line 2
    iput-boolean v8, v7, Lcom/google/android/libraries/places/internal/zzbpm;->zzb:Z

    iget-object v9, v6, Lcom/google/android/libraries/places/internal/zzbpd;->zzc:Ljava/util/Collection;

    .line 3
    invoke-interface {v9, v7}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    new-instance v9, Ljava/util/ArrayList;

    iget-object v10, v6, Lcom/google/android/libraries/places/internal/zzbpd;->zzc:Ljava/util/Collection;

    .line 4
    invoke-direct {v9, v10}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 5
    invoke-interface {v9, v7}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 6
    invoke-static {v9}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v13

    new-instance v11, Lcom/google/android/libraries/places/internal/zzbpd;

    iget-object v12, v6, Lcom/google/android/libraries/places/internal/zzbpd;->zzb:Ljava/util/List;

    iget-object v14, v6, Lcom/google/android/libraries/places/internal/zzbpd;->zzd:Ljava/util/Collection;

    iget-object v15, v6, Lcom/google/android/libraries/places/internal/zzbpd;->zzf:Lcom/google/android/libraries/places/internal/zzbpm;

    iget-boolean v7, v6, Lcom/google/android/libraries/places/internal/zzbpd;->zzg:Z

    iget-boolean v9, v6, Lcom/google/android/libraries/places/internal/zzbpd;->zza:Z

    iget-boolean v10, v6, Lcom/google/android/libraries/places/internal/zzbpd;->zzh:Z

    iget v6, v6, Lcom/google/android/libraries/places/internal/zzbpd;->zze:I

    move/from16 v19, v6

    move/from16 v16, v7

    move/from16 v17, v9

    move/from16 v18, v10

    .line 7
    invoke-direct/range {v11 .. v19}, Lcom/google/android/libraries/places/internal/zzbpd;-><init>(Ljava/util/List;Ljava/util/Collection;Ljava/util/Collection;Lcom/google/android/libraries/places/internal/zzbpm;ZZZI)V

    move-object v6, v11

    goto :goto_0

    :catchall_0
    move-exception v0

    goto/16 :goto_d

    .line 8
    :cond_0
    :goto_0
    invoke-static {v5, v6}, Lcom/google/android/libraries/places/internal/zzbpo;->zzV(Lcom/google/android/libraries/places/internal/zzbpo;Lcom/google/android/libraries/places/internal/zzbpd;)V

    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzbpo;->zzA(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbjj;

    move-result-object v5

    .line 9
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbdo;->zza()Lcom/google/android/libraries/places/internal/zzbdj;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/android/libraries/places/internal/zzbjj;->zza(Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzbjj;

    .line 10
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zzO(Lcom/google/android/libraries/places/internal/zzbpo;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    .line 11
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v4

    const/high16 v5, -0x80000000

    if-ne v4, v5, :cond_1

    iget-object v1, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbpo;->zzL(Lcom/google/android/libraries/places/internal/zzbpo;)Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/google/android/libraries/places/internal/zzbph;

    invoke-direct {v2, v0}, Lcom/google/android/libraries/places/internal/zzbph;-><init>(Lcom/google/android/libraries/places/internal/zzbpl;)V

    check-cast v1, Lcom/google/android/libraries/places/internal/zzbdw;

    .line 12
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/internal/zzbdw;->zzc(Ljava/lang/Runnable;)V

    .line 13
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbdw;->zzb()V

    return-void

    :cond_1
    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zza:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 14
    iget-boolean v5, v4, Lcom/google/android/libraries/places/internal/zzbpm;->zzc:Z

    if-eqz v5, :cond_2

    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 15
    invoke-static {v5, v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zzW(Lcom/google/android/libraries/places/internal/zzbpo;Lcom/google/android/libraries/places/internal/zzbpm;)V

    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 16
    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zzD(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpd;

    move-result-object v4

    iget-object v4, v4, Lcom/google/android/libraries/places/internal/zzbpd;->zzf:Lcom/google/android/libraries/places/internal/zzbpm;

    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zza:Lcom/google/android/libraries/places/internal/zzbpm;

    if-ne v4, v5, :cond_16

    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 17
    invoke-static {v0, v1, v2, v3}, Lcom/google/android/libraries/places/internal/zzbpo;->zzaa(Lcom/google/android/libraries/places/internal/zzbpo;Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbfs;Lcom/google/android/libraries/places/internal/zzbcf;)V

    return-void

    .line 18
    :cond_2
    sget-object v4, Lcom/google/android/libraries/places/internal/zzbfs;->zzd:Lcom/google/android/libraries/places/internal/zzbfs;

    if-ne v2, v4, :cond_3

    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzbpo;->zzP(Lcom/google/android/libraries/places/internal/zzbpo;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v5

    .line 19
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v5

    const/16 v6, 0x3e8

    if-le v5, v6, :cond_3

    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zza:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 20
    invoke-static {v4, v5}, Lcom/google/android/libraries/places/internal/zzbpo;->zzW(Lcom/google/android/libraries/places/internal/zzbpo;Lcom/google/android/libraries/places/internal/zzbpm;)V

    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 21
    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zzD(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpd;

    move-result-object v4

    iget-object v4, v4, Lcom/google/android/libraries/places/internal/zzbpd;->zzf:Lcom/google/android/libraries/places/internal/zzbpm;

    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zza:Lcom/google/android/libraries/places/internal/zzbpm;

    if-ne v4, v5, :cond_16

    sget-object v4, Lcom/google/android/libraries/places/internal/zzbdo;->zzo:Lcom/google/android/libraries/places/internal/zzbdo;

    const-string v5, "Too many transparent retries. Might be a bug in gRPC"

    .line 22
    invoke-virtual {v4, v5}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    move-result-object v4

    new-instance v5, Lcom/google/android/libraries/places/internal/zzbdq;

    const/4 v6, 0x0

    .line 23
    invoke-direct {v5, v1, v6}, Lcom/google/android/libraries/places/internal/zzbdq;-><init>(Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbcf;)V

    .line 24
    invoke-virtual {v4, v5}, Lcom/google/android/libraries/places/internal/zzbdo;->zzf(Ljava/lang/Throwable;)Lcom/google/android/libraries/places/internal/zzbdo;

    move-result-object v1

    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 25
    invoke-static {v0, v1, v2, v3}, Lcom/google/android/libraries/places/internal/zzbpo;->zzaa(Lcom/google/android/libraries/places/internal/zzbpo;Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbfs;Lcom/google/android/libraries/places/internal/zzbcf;)V

    return-void

    :cond_3
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 26
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzbpo;->zzD(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpd;

    move-result-object v5

    iget-object v5, v5, Lcom/google/android/libraries/places/internal/zzbpd;->zzf:Lcom/google/android/libraries/places/internal/zzbpm;

    if-nez v5, :cond_15

    if-eq v2, v4, :cond_13

    sget-object v4, Lcom/google/android/libraries/places/internal/zzbfs;->zzb:Lcom/google/android/libraries/places/internal/zzbfs;

    const/4 v5, 0x0

    if-ne v2, v4, :cond_4

    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zzN(Lcom/google/android/libraries/places/internal/zzbpo;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v4

    .line 27
    invoke-virtual {v4, v5, v8}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v4

    if-eqz v4, :cond_4

    goto/16 :goto_a

    .line 28
    :cond_4
    sget-object v4, Lcom/google/android/libraries/places/internal/zzbfs;->zzc:Lcom/google/android/libraries/places/internal/zzbfs;

    .line 29
    iget-object v6, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    if-ne v2, v4, :cond_5

    .line 30
    invoke-static {v6}, Lcom/google/android/libraries/places/internal/zzbpo;->zzad(Lcom/google/android/libraries/places/internal/zzbpo;)Z

    move-result v4

    if-eqz v4, :cond_15

    .line 31
    invoke-static {v6}, Lcom/google/android/libraries/places/internal/zzbpo;->zzY(Lcom/google/android/libraries/places/internal/zzbpo;)V

    goto/16 :goto_c

    .line 32
    :cond_5
    invoke-static {v6}, Lcom/google/android/libraries/places/internal/zzbpo;->zzN(Lcom/google/android/libraries/places/internal/zzbpo;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v4

    .line 33
    invoke-virtual {v4, v8}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zzad(Lcom/google/android/libraries/places/internal/zzbpo;)Z

    move-result v6

    if-eqz v6, :cond_d

    .line 34
    invoke-static {v3}, Lcom/google/android/libraries/places/internal/zzbpl;->zza(Lcom/google/android/libraries/places/internal/zzbcf;)Ljava/lang/Integer;

    move-result-object v4

    iget-object v6, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v6}, Lcom/google/android/libraries/places/internal/zzbpo;->zzz(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbje;

    move-result-object v6

    .line 35
    iget-object v6, v6, Lcom/google/android/libraries/places/internal/zzbje;->zzc:Ljava/util/Set;

    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbdo;->zza()Lcom/google/android/libraries/places/internal/zzbdj;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    iget-object v7, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v7}, Lcom/google/android/libraries/places/internal/zzbpo;->zzF(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpn;

    move-result-object v7

    if-eqz v7, :cond_6

    if-nez v6, :cond_7

    if-eqz v4, :cond_6

    .line 36
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-gez v7, :cond_6

    goto :goto_1

    :cond_6
    move v7, v5

    goto :goto_2

    :cond_7
    :goto_1
    iget-object v7, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v7}, Lcom/google/android/libraries/places/internal/zzbpo;->zzF(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpn;

    move-result-object v7

    .line 37
    invoke-virtual {v7}, Lcom/google/android/libraries/places/internal/zzbpn;->zzb()Z

    move-result v7

    xor-int/2addr v7, v8

    :goto_2
    if-eqz v6, :cond_8

    if-nez v7, :cond_8

    .line 38
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbdo;->zzl()Z

    move-result v9

    if-nez v9, :cond_8

    if-eqz v4, :cond_8

    .line 39
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-lez v9, :cond_8

    .line 40
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    :cond_8
    if-eqz v6, :cond_9

    if-nez v7, :cond_9

    goto :goto_3

    :cond_9
    move v8, v5

    :goto_3
    if-eqz v8, :cond_a

    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 41
    invoke-static {v5, v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zzZ(Lcom/google/android/libraries/places/internal/zzbpo;Ljava/lang/Integer;)V

    :cond_a
    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zzH(Lcom/google/android/libraries/places/internal/zzbpo;)Ljava/lang/Object;

    move-result-object v6

    monitor-enter v6

    :try_start_1
    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 42
    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zzD(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpd;

    move-result-object v5

    iget-object v7, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zza:Lcom/google/android/libraries/places/internal/zzbpm;

    new-instance v9, Ljava/util/ArrayList;

    iget-object v10, v5, Lcom/google/android/libraries/places/internal/zzbpd;->zzd:Ljava/util/Collection;

    .line 43
    invoke-direct {v9, v10}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 44
    invoke-interface {v9, v7}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 45
    invoke-static {v9}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v14

    new-instance v11, Lcom/google/android/libraries/places/internal/zzbpd;

    iget-object v12, v5, Lcom/google/android/libraries/places/internal/zzbpd;->zzb:Ljava/util/List;

    iget-object v13, v5, Lcom/google/android/libraries/places/internal/zzbpd;->zzc:Ljava/util/Collection;

    iget-object v15, v5, Lcom/google/android/libraries/places/internal/zzbpd;->zzf:Lcom/google/android/libraries/places/internal/zzbpm;

    iget-boolean v7, v5, Lcom/google/android/libraries/places/internal/zzbpd;->zzg:Z

    iget-boolean v9, v5, Lcom/google/android/libraries/places/internal/zzbpd;->zza:Z

    iget-boolean v10, v5, Lcom/google/android/libraries/places/internal/zzbpd;->zzh:Z

    iget v5, v5, Lcom/google/android/libraries/places/internal/zzbpd;->zze:I

    move/from16 v19, v5

    move/from16 v16, v7

    move/from16 v17, v9

    move/from16 v18, v10

    .line 46
    invoke-direct/range {v11 .. v19}, Lcom/google/android/libraries/places/internal/zzbpd;-><init>(Ljava/util/List;Ljava/util/Collection;Ljava/util/Collection;Lcom/google/android/libraries/places/internal/zzbpm;ZZZI)V

    .line 47
    invoke-static {v4, v11}, Lcom/google/android/libraries/places/internal/zzbpo;->zzV(Lcom/google/android/libraries/places/internal/zzbpo;Lcom/google/android/libraries/places/internal/zzbpd;)V

    if-eqz v8, :cond_c

    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 48
    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zzD(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpd;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/google/android/libraries/places/internal/zzbpo;->zzae(Lcom/google/android/libraries/places/internal/zzbpo;Lcom/google/android/libraries/places/internal/zzbpd;)Z

    move-result v4

    if-nez v4, :cond_b

    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zzD(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpd;

    move-result-object v4

    iget-object v4, v4, Lcom/google/android/libraries/places/internal/zzbpd;->zzd:Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_c

    goto :goto_4

    :catchall_1
    move-exception v0

    goto :goto_5

    .line 49
    :cond_b
    :goto_4
    monitor-exit v6

    return-void

    .line 50
    :cond_c
    monitor-exit v6

    goto/16 :goto_c

    :goto_5
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v0

    :cond_d
    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zzG(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpp;

    move-result-object v6

    const-wide/16 v9, 0x0

    if-nez v6, :cond_f

    :cond_e
    move v4, v5

    goto/16 :goto_9

    .line 51
    :cond_f
    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zzG(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpp;

    move-result-object v4

    .line 52
    iget-object v4, v4, Lcom/google/android/libraries/places/internal/zzbpp;->zzf:Ljava/util/Set;

    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbdo;->zza()Lcom/google/android/libraries/places/internal/zzbdj;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    .line 53
    invoke-static {v3}, Lcom/google/android/libraries/places/internal/zzbpl;->zza(Lcom/google/android/libraries/places/internal/zzbcf;)Ljava/lang/Integer;

    move-result-object v6

    iget-object v7, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v7}, Lcom/google/android/libraries/places/internal/zzbpo;->zzF(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpn;

    move-result-object v7

    if-eqz v7, :cond_10

    if-nez v4, :cond_11

    if-eqz v6, :cond_10

    .line 54
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-gez v7, :cond_10

    goto :goto_6

    :cond_10
    move v7, v5

    goto :goto_7

    :cond_11
    :goto_6
    iget-object v7, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v7}, Lcom/google/android/libraries/places/internal/zzbpo;->zzF(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpn;

    move-result-object v7

    .line 55
    invoke-virtual {v7}, Lcom/google/android/libraries/places/internal/zzbpn;->zzb()Z

    move-result v7

    xor-int/2addr v7, v8

    :goto_7
    iget-object v11, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v11}, Lcom/google/android/libraries/places/internal/zzbpo;->zzG(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpp;

    move-result-object v12

    .line 56
    iget v12, v12, Lcom/google/android/libraries/places/internal/zzbpp;->zza:I

    iget-object v13, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zza:Lcom/google/android/libraries/places/internal/zzbpm;

    iget v13, v13, Lcom/google/android/libraries/places/internal/zzbpm;->zzd:I

    add-int/2addr v13, v8

    if-le v12, v13, :cond_e

    if-nez v7, :cond_e

    if-nez v6, :cond_12

    if-eqz v4, :cond_e

    invoke-static {v11}, Lcom/google/android/libraries/places/internal/zzbpo;->zze(Lcom/google/android/libraries/places/internal/zzbpo;)J

    move-result-wide v6

    long-to-double v6, v6

    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbpo;->zzJ()Ljava/util/Random;

    move-result-object v4

    .line 57
    invoke-virtual {v4}, Ljava/util/Random;->nextDouble()D

    move-result-wide v9

    mul-double/2addr v6, v9

    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zze(Lcom/google/android/libraries/places/internal/zzbpo;)J

    move-result-wide v9

    long-to-double v9, v9

    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zzG(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpp;

    move-result-object v11

    .line 58
    iget-wide v11, v11, Lcom/google/android/libraries/places/internal/zzbpp;->zzd:D

    mul-double/2addr v9, v11

    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zzG(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpp;

    move-result-object v11

    iget-wide v11, v11, Lcom/google/android/libraries/places/internal/zzbpp;->zzc:J

    double-to-long v9, v9

    invoke-static {v9, v10, v11, v12}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v9

    invoke-static {v4, v9, v10}, Lcom/google/android/libraries/places/internal/zzbpo;->zzR(Lcom/google/android/libraries/places/internal/zzbpo;J)V

    double-to-long v9, v6

    :goto_8
    move v4, v8

    goto :goto_9

    .line 59
    :cond_12
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ltz v4, :cond_e

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 60
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual {v4, v6, v7}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v9

    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zzG(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpp;

    move-result-object v6

    .line 61
    iget-wide v6, v6, Lcom/google/android/libraries/places/internal/zzbpp;->zzb:J

    invoke-static {v4, v6, v7}, Lcom/google/android/libraries/places/internal/zzbpo;->zzR(Lcom/google/android/libraries/places/internal/zzbpo;J)V

    goto :goto_8

    :goto_9
    if-eqz v4, :cond_15

    .line 62
    iget-object v1, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    iget-object v2, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zza:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 63
    iget v2, v2, Lcom/google/android/libraries/places/internal/zzbpm;->zzd:I

    add-int/2addr v2, v8

    invoke-static {v1, v2, v5}, Lcom/google/android/libraries/places/internal/zzbpo;->zzE(Lcom/google/android/libraries/places/internal/zzbpo;IZ)Lcom/google/android/libraries/places/internal/zzbpm;

    move-result-object v1

    if-eqz v1, :cond_16

    iget-object v2, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzbpo;->zzH(Lcom/google/android/libraries/places/internal/zzbpo;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    :try_start_2
    iget-object v3, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    new-instance v4, Lcom/google/android/libraries/places/internal/zzboy;

    invoke-static {v3}, Lcom/google/android/libraries/places/internal/zzbpo;->zzH(Lcom/google/android/libraries/places/internal/zzbpo;)Ljava/lang/Object;

    move-result-object v5

    .line 64
    invoke-direct {v4, v5}, Lcom/google/android/libraries/places/internal/zzboy;-><init>(Ljava/lang/Object;)V

    invoke-static {v3, v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zzU(Lcom/google/android/libraries/places/internal/zzbpo;Lcom/google/android/libraries/places/internal/zzboy;)V

    .line 65
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    iget-object v2, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzbpo;->zzM(Lcom/google/android/libraries/places/internal/zzbpo;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    new-instance v3, Lcom/google/android/libraries/places/internal/zzbpg;

    invoke-direct {v3, v0, v4, v1}, Lcom/google/android/libraries/places/internal/zzbpg;-><init>(Lcom/google/android/libraries/places/internal/zzbpl;Lcom/google/android/libraries/places/internal/zzboy;Lcom/google/android/libraries/places/internal/zzbpm;)V

    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 66
    invoke-interface {v2, v3, v9, v10, v0}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    .line 67
    invoke-virtual {v4, v0}, Lcom/google/android/libraries/places/internal/zzboy;->zzb(Ljava/util/concurrent/Future;)V

    return-void

    :catchall_2
    move-exception v0

    .line 68
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0

    .line 69
    :cond_13
    :goto_a
    iget-object v1, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    iget-object v2, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zza:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 70
    iget v2, v2, Lcom/google/android/libraries/places/internal/zzbpm;->zzd:I

    invoke-static {v1, v2, v8}, Lcom/google/android/libraries/places/internal/zzbpo;->zzE(Lcom/google/android/libraries/places/internal/zzbpo;IZ)Lcom/google/android/libraries/places/internal/zzbpm;

    move-result-object v1

    if-eqz v1, :cond_16

    iget-object v2, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzbpo;->zzad(Lcom/google/android/libraries/places/internal/zzbpo;)Z

    move-result v3

    if-eqz v3, :cond_14

    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzbpo;->zzH(Lcom/google/android/libraries/places/internal/zzbpo;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    :try_start_4
    iget-object v3, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 71
    invoke-static {v3}, Lcom/google/android/libraries/places/internal/zzbpo;->zzD(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpd;

    move-result-object v4

    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zza:Lcom/google/android/libraries/places/internal/zzbpm;

    new-instance v6, Ljava/util/ArrayList;

    iget-object v7, v4, Lcom/google/android/libraries/places/internal/zzbpd;->zzd:Ljava/util/Collection;

    .line 72
    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 73
    invoke-interface {v6, v5}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 74
    invoke-interface {v6, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 75
    invoke-static {v6}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v11

    new-instance v8, Lcom/google/android/libraries/places/internal/zzbpd;

    iget-object v9, v4, Lcom/google/android/libraries/places/internal/zzbpd;->zzb:Ljava/util/List;

    iget-object v10, v4, Lcom/google/android/libraries/places/internal/zzbpd;->zzc:Ljava/util/Collection;

    iget-object v12, v4, Lcom/google/android/libraries/places/internal/zzbpd;->zzf:Lcom/google/android/libraries/places/internal/zzbpm;

    iget-boolean v13, v4, Lcom/google/android/libraries/places/internal/zzbpd;->zzg:Z

    iget-boolean v14, v4, Lcom/google/android/libraries/places/internal/zzbpd;->zza:Z

    iget-boolean v15, v4, Lcom/google/android/libraries/places/internal/zzbpd;->zzh:Z

    iget v4, v4, Lcom/google/android/libraries/places/internal/zzbpd;->zze:I

    move/from16 v16, v4

    .line 76
    invoke-direct/range {v8 .. v16}, Lcom/google/android/libraries/places/internal/zzbpd;-><init>(Ljava/util/List;Ljava/util/Collection;Ljava/util/Collection;Lcom/google/android/libraries/places/internal/zzbpm;ZZZI)V

    .line 77
    invoke-static {v3, v8}, Lcom/google/android/libraries/places/internal/zzbpo;->zzV(Lcom/google/android/libraries/places/internal/zzbpo;Lcom/google/android/libraries/places/internal/zzbpd;)V

    .line 78
    monitor-exit v2

    goto :goto_b

    :catchall_3
    move-exception v0

    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    throw v0

    :cond_14
    :goto_b
    iget-object v2, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzbpo;->zzK(Lcom/google/android/libraries/places/internal/zzbpo;)Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Lcom/google/android/libraries/places/internal/zzbpi;

    invoke-direct {v3, v0, v1}, Lcom/google/android/libraries/places/internal/zzbpi;-><init>(Lcom/google/android/libraries/places/internal/zzbpl;Lcom/google/android/libraries/places/internal/zzbpm;)V

    .line 79
    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    .line 80
    :cond_15
    :goto_c
    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zza:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 81
    invoke-static {v4, v5}, Lcom/google/android/libraries/places/internal/zzbpo;->zzW(Lcom/google/android/libraries/places/internal/zzbpo;Lcom/google/android/libraries/places/internal/zzbpm;)V

    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 82
    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbpo;->zzD(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpd;

    move-result-object v4

    iget-object v4, v4, Lcom/google/android/libraries/places/internal/zzbpd;->zzf:Lcom/google/android/libraries/places/internal/zzbpm;

    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zza:Lcom/google/android/libraries/places/internal/zzbpm;

    if-ne v4, v5, :cond_16

    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 83
    invoke-static {v0, v1, v2, v3}, Lcom/google/android/libraries/places/internal/zzbpo;->zzaa(Lcom/google/android/libraries/places/internal/zzbpo;Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbfs;Lcom/google/android/libraries/places/internal/zzbcf;)V

    :cond_16
    return-void

    .line 84
    :goto_d
    :try_start_5
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v0
.end method

.method public final zze(Lcom/google/android/libraries/places/internal/zzbcf;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbpl;->zza:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 2
    .line 3
    iget v0, v0, Lcom/google/android/libraries/places/internal/zzbpm;->zzd:I

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbpo;->zzh:Lcom/google/android/libraries/places/internal/zzbca;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/google/android/libraries/places/internal/zzbcf;->zzd(Lcom/google/android/libraries/places/internal/zzbca;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbpl;->zza:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 13
    .line 14
    iget v1, v1, Lcom/google/android/libraries/places/internal/zzbpm;->zzd:I

    .line 15
    .line 16
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzbcf;->zzf(Lcom/google/android/libraries/places/internal/zzbca;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbpl;->zza:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/google/android/libraries/places/internal/zzbpo;->zzW(Lcom/google/android/libraries/places/internal/zzbpo;Lcom/google/android/libraries/places/internal/zzbpm;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbpo;->zzD(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpd;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbpd;->zzf:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbpl;->zza:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 39
    .line 40
    if-ne v0, v1, :cond_4

    .line 41
    .line 42
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 43
    .line 44
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbpo;->zzF(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpn;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    if-eqz v1, :cond_3

    .line 49
    .line 50
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbpo;->zzF(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpn;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    :cond_1
    iget-object v1, v0, Lcom/google/android/libraries/places/internal/zzbpn;->zzd:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    iget v2, v0, Lcom/google/android/libraries/places/internal/zzbpn;->zza:I

    .line 61
    .line 62
    if-ne v1, v2, :cond_2

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    iget v3, v0, Lcom/google/android/libraries/places/internal/zzbpn;->zzc:I

    .line 66
    .line 67
    add-int/2addr v3, v1

    .line 68
    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbpn;->zzd:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 69
    .line 70
    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    invoke-virtual {v4, v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_1

    .line 79
    .line 80
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 81
    .line 82
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbpo;->zzL(Lcom/google/android/libraries/places/internal/zzbpo;)Ljava/util/concurrent/Executor;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbpe;

    .line 87
    .line 88
    invoke-direct {v1, p0, p1}, Lcom/google/android/libraries/places/internal/zzbpe;-><init>(Lcom/google/android/libraries/places/internal/zzbpl;Lcom/google/android/libraries/places/internal/zzbcf;)V

    .line 89
    .line 90
    .line 91
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbdw;

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/internal/zzbdw;->zzc(Ljava/lang/Runnable;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbdw;->zzb()V

    .line 97
    .line 98
    .line 99
    :cond_4
    return-void
.end method

.method public final zzf(Lcom/google/android/libraries/places/internal/zzbqq;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbpo;->zzD(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpd;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, v0, Lcom/google/android/libraries/places/internal/zzbpd;->zzf:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v1, 0x0

    .line 14
    :goto_0
    const-string v2, "Headers should be received prior to messages."

    .line 15
    .line 16
    invoke-static {v1, v2}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbpd;->zzf:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbpl;->zza:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 22
    .line 23
    if-eq v0, v1, :cond_1

    .line 24
    .line 25
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbjd;->zzh(Lcom/google/android/libraries/places/internal/zzbqq;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbpo;->zzL(Lcom/google/android/libraries/places/internal/zzbpo;)Ljava/util/concurrent/Executor;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbpj;

    .line 36
    .line 37
    invoke-direct {v1, p0, p1}, Lcom/google/android/libraries/places/internal/zzbpj;-><init>(Lcom/google/android/libraries/places/internal/zzbpl;Lcom/google/android/libraries/places/internal/zzbqq;)V

    .line 38
    .line 39
    .line 40
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbdw;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/internal/zzbdw;->zzc(Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbdw;->zzb()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final zzg()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbpo;->zzp()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbpo;->zzL(Lcom/google/android/libraries/places/internal/zzbpo;)Ljava/util/concurrent/Executor;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbpk;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lcom/google/android/libraries/places/internal/zzbpk;-><init>(Lcom/google/android/libraries/places/internal/zzbpl;)V

    .line 19
    .line 20
    .line 21
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbdw;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/internal/zzbdw;->zzc(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbdw;->zzb()V

    .line 27
    .line 28
    .line 29
    return-void
.end method
