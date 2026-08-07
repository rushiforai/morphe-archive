.class final Lcom/google/android/libraries/places/internal/zzajw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final zza:Ljava/util/concurrent/Future;

.field final zzb:Lcom/google/android/libraries/places/internal/zzajv;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Future;Lcom/google/android/libraries/places/internal/zzajv;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzajw;->zza:Ljava/util/concurrent/Future;

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzajw;->zzb:Lcom/google/android/libraries/places/internal/zzajv;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzajw;->zza:Ljava/util/concurrent/Future;

    .line 2
    .line 3
    check-cast v0, Lcom/google/android/libraries/places/internal/zzake;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzakf;->zza(Lcom/google/android/libraries/places/internal/zzake;)Ljava/lang/Throwable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    :try_start_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzajw;->zza:Ljava/util/concurrent/Future;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/concurrent/Future;->isDone()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const-string v2, "Future was expected to be done: %s"

    .line 18
    .line 19
    invoke-static {v1, v2, v0}, Lcom/google/android/libraries/places/internal/zzmt;->zzr(ZLjava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    :goto_0
    :try_start_1
    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V
    :try_end_2
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :catchall_0
    move-exception v0

    .line 38
    goto :goto_3

    .line 39
    :catch_0
    move-exception v0

    .line 40
    goto :goto_4

    .line 41
    :cond_0
    :goto_1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzajw;->zzb:Lcom/google/android/libraries/places/internal/zzajv;

    .line 42
    .line 43
    invoke-interface {p0, v0}, Lcom/google/android/libraries/places/internal/zzajv;->zzb(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :catchall_1
    move-exception v0

    .line 48
    if-nez v1, :cond_1

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_1
    :try_start_3
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 56
    .line 57
    .line 58
    :goto_2
    throw v0
    :try_end_3
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 59
    :catch_1
    const/4 v1, 0x1

    .line 60
    goto :goto_0

    .line 61
    :goto_3
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzajw;->zzb:Lcom/google/android/libraries/places/internal/zzajv;

    .line 62
    .line 63
    invoke-interface {p0, v0}, Lcom/google/android/libraries/places/internal/zzajv;->zza(Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :goto_4
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzajw;->zzb:Lcom/google/android/libraries/places/internal/zzajv;

    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-interface {p0, v0}, Lcom/google/android/libraries/places/internal/zzajv;->zza(Ljava/lang/Throwable;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_2
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzajw;->zzb:Lcom/google/android/libraries/places/internal/zzajv;

    .line 78
    .line 79
    invoke-interface {p0, v0}, Lcom/google/android/libraries/places/internal/zzajv;->zza(Ljava/lang/Throwable;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzmn;->zzb(Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzmm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzajw;->zzb:Lcom/google/android/libraries/places/internal/zzajv;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/google/android/libraries/places/internal/zzmm;->zzf(Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzmm;

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzmm;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method
