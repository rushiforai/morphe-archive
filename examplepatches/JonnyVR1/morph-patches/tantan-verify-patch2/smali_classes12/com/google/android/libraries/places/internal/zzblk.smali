.class final Lcom/google/android/libraries/places/internal/zzblk;
.super Lcom/google/android/libraries/places/internal/zzayk;
.source "SourceFile"


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzbls;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbls;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzblk;->zza:Lcom/google/android/libraries/places/internal/zzbls;

    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzayk;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/libraries/places/internal/zzbcl;Lcom/google/android/libraries/places/internal/zzayj;)Lcom/google/android/libraries/places/internal/zzayo;
    .locals 8

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbfq;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzblk;->zza:Lcom/google/android/libraries/places/internal/zzbls;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/google/android/libraries/places/internal/zzbls;->zza:Lcom/google/android/libraries/places/internal/zzbma;

    .line 6
    .line 7
    invoke-static {v1, p2}, Lcom/google/android/libraries/places/internal/zzbma;->zzJ(Lcom/google/android/libraries/places/internal/zzbma;Lcom/google/android/libraries/places/internal/zzayj;)Ljava/util/concurrent/Executor;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbma;->zzv(Lcom/google/android/libraries/places/internal/zzbma;)Lcom/google/android/libraries/places/internal/zzbkt;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbma;->zzaa(Lcom/google/android/libraries/places/internal/zzbma;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    :goto_0
    move-object v5, v1

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzblk;->zza:Lcom/google/android/libraries/places/internal/zzbls;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/google/android/libraries/places/internal/zzbls;->zza:Lcom/google/android/libraries/places/internal/zzbma;

    .line 27
    .line 28
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbma;->zzs(Lcom/google/android/libraries/places/internal/zzbma;)Lcom/google/android/libraries/places/internal/zzbfw;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {v1}, Lcom/google/android/libraries/places/internal/zzbfw;->zzb()Ljava/util/concurrent/ScheduledExecutorService;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    goto :goto_0

    .line 37
    :goto_1
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzblk;->zza:Lcom/google/android/libraries/places/internal/zzbls;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/google/android/libraries/places/internal/zzbls;->zza:Lcom/google/android/libraries/places/internal/zzbma;

    .line 40
    .line 41
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbma;->zzq(Lcom/google/android/libraries/places/internal/zzbma;)Lcom/google/android/libraries/places/internal/zzbfg;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    const/4 v7, 0x0

    .line 46
    move-object v1, p1

    .line 47
    move-object v3, p2

    .line 48
    invoke-direct/range {v0 .. v7}, Lcom/google/android/libraries/places/internal/zzbfq;-><init>(Lcom/google/android/libraries/places/internal/zzbcl;Ljava/util/concurrent/Executor;Lcom/google/android/libraries/places/internal/zzayj;Lcom/google/android/libraries/places/internal/zzbfp;Ljava/util/concurrent/ScheduledExecutorService;Lcom/google/android/libraries/places/internal/zzbfg;Lcom/google/android/libraries/places/internal/zzbam;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzblk;->zza:Lcom/google/android/libraries/places/internal/zzbls;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/google/android/libraries/places/internal/zzbls;->zza:Lcom/google/android/libraries/places/internal/zzbma;

    .line 54
    .line 55
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbma;->zzj(Lcom/google/android/libraries/places/internal/zzbma;)Lcom/google/android/libraries/places/internal/zzazq;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzbfq;->zzn(Lcom/google/android/libraries/places/internal/zzazq;)Lcom/google/android/libraries/places/internal/zzbfq;

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzblk;->zza:Lcom/google/android/libraries/places/internal/zzbls;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbls;->zza:Lcom/google/android/libraries/places/internal/zzbma;

    .line 65
    .line 66
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbma;->zzi(Lcom/google/android/libraries/places/internal/zzbma;)Lcom/google/android/libraries/places/internal/zzazd;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v0, p0}, Lcom/google/android/libraries/places/internal/zzbfq;->zzm(Lcom/google/android/libraries/places/internal/zzazd;)Lcom/google/android/libraries/places/internal/zzbfq;

    .line 71
    .line 72
    .line 73
    return-object v0
.end method

.method public final zzb()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzblk;->zza:Lcom/google/android/libraries/places/internal/zzbls;

    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbls;->zzd(Lcom/google/android/libraries/places/internal/zzbls;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
