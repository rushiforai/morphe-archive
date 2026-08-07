.class final Lcom/google/android/libraries/places/internal/zzboh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Ljava/util/Collection;

.field final synthetic zzb:Lcom/google/android/libraries/places/internal/zzbpm;

.field final synthetic zzc:Ljava/util/concurrent/Future;

.field final synthetic zzd:Z

.field final synthetic zze:Ljava/util/concurrent/Future;

.field final synthetic zzf:Lcom/google/android/libraries/places/internal/zzbpo;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbpo;Ljava/util/Collection;Lcom/google/android/libraries/places/internal/zzbpm;Ljava/util/concurrent/Future;ZLjava/util/concurrent/Future;)V
    .locals 0

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzboh;->zza:Ljava/util/Collection;

    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzboh;->zzb:Lcom/google/android/libraries/places/internal/zzbpm;

    iput-object p4, p0, Lcom/google/android/libraries/places/internal/zzboh;->zzc:Ljava/util/concurrent/Future;

    iput-boolean p5, p0, Lcom/google/android/libraries/places/internal/zzboh;->zzd:Z

    iput-object p6, p0, Lcom/google/android/libraries/places/internal/zzboh;->zze:Ljava/util/concurrent/Future;

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzboh;->zzf:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzboh;->zza:Ljava/util/Collection;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/google/android/libraries/places/internal/zzbpm;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzboh;->zzb:Lcom/google/android/libraries/places/internal/zzbpm;

    .line 20
    .line 21
    if-eq v1, v2, :cond_0

    .line 22
    .line 23
    iget-object v1, v1, Lcom/google/android/libraries/places/internal/zzbpm;->zza:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 24
    .line 25
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbpo;->zzx()Lcom/google/android/libraries/places/internal/zzbdo;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-interface {v1, v2}, Lcom/google/android/libraries/places/internal/zzbfr;->zzh(Lcom/google/android/libraries/places/internal/zzbdo;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzboh;->zzc:Ljava/util/concurrent/Future;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 39
    .line 40
    .line 41
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzboh;->zzd:Z

    .line 42
    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzboh;->zzf:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbpo;->zzO(Lcom/google/android/libraries/places/internal/zzbpo;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    const/high16 v2, -0x80000000

    .line 56
    .line 57
    if-ne v0, v2, :cond_2

    .line 58
    .line 59
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzboh;->zzf:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 60
    .line 61
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbpo;->zzL(Lcom/google/android/libraries/places/internal/zzbpo;)Ljava/util/concurrent/Executor;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbog;

    .line 66
    .line 67
    invoke-direct {v2, p0}, Lcom/google/android/libraries/places/internal/zzbog;-><init>(Lcom/google/android/libraries/places/internal/zzboh;)V

    .line 68
    .line 69
    .line 70
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbdw;

    .line 71
    .line 72
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/internal/zzbdw;->zzc(Ljava/lang/Runnable;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbdw;->zzb()V

    .line 76
    .line 77
    .line 78
    :cond_2
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzboh;->zze:Ljava/util/concurrent/Future;

    .line 79
    .line 80
    if-eqz v0, :cond_3

    .line 81
    .line 82
    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 83
    .line 84
    .line 85
    :cond_3
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzboh;->zzf:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbpo;->zzc()V

    .line 88
    .line 89
    .line 90
    return-void
.end method
