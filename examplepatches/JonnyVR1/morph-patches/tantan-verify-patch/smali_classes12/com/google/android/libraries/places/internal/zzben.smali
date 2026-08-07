.class public final Lcom/google/android/libraries/places/internal/zzben;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzbeo;

.field private final zzb:J


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzbeo;JLcom/google/android/libraries/places/internal/zzbem;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzben;->zza:Lcom/google/android/libraries/places/internal/zzbeo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p2, p0, Lcom/google/android/libraries/places/internal/zzben;->zzb:J

    return-void
.end method


# virtual methods
.method public final zza()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzben;->zza:Lcom/google/android/libraries/places/internal/zzbeo;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/google/android/libraries/places/internal/zzben;->zzb:J

    .line 4
    .line 5
    add-long v3, v1, v1

    .line 6
    .line 7
    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->max(JJ)J

    .line 8
    .line 9
    .line 10
    move-result-wide v3

    .line 11
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbeo;->zzc(Lcom/google/android/libraries/places/internal/zzbeo;)Ljava/util/concurrent/atomic/AtomicLong;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, v1, v2, v3, v4}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzben;->zza:Lcom/google/android/libraries/places/internal/zzbeo;

    .line 22
    .line 23
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbeo;->zzd()Ljava/util/logging/Logger;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    sget-object v6, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 28
    .line 29
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbeo;->zzb(Lcom/google/android/libraries/places/internal/zzbeo;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    filled-new-array {p0, v0}, [Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v10

    .line 41
    const-string v8, "backoff"

    .line 42
    .line 43
    const-string v9, "Increased {0} to {1}"

    .line 44
    .line 45
    const-string v7, "io.grpc.internal.AtomicBackoff$State"

    .line 46
    .line 47
    invoke-virtual/range {v5 .. v10}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method
