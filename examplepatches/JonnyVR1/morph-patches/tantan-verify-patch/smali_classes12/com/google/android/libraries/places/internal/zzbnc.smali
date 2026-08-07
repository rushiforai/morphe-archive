.class final Lcom/google/android/libraries/places/internal/zzbnc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzbbl;


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzbnj;

.field private zzb:Lcom/google/android/libraries/places/internal/zzazf;

.field private zzc:Lcom/google/android/libraries/places/internal/zzbni;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzbnj;Lcom/google/android/libraries/places/internal/zzbnb;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnc;->zza:Lcom/google/android/libraries/places/internal/zzbnj;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object p1, Lcom/google/android/libraries/places/internal/zzaze;->zzd:Lcom/google/android/libraries/places/internal/zzaze;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzazf;->zzb(Lcom/google/android/libraries/places/internal/zzaze;)Lcom/google/android/libraries/places/internal/zzazf;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnc;->zzb:Lcom/google/android/libraries/places/internal/zzazf;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic zzb(Lcom/google/android/libraries/places/internal/zzbnc;)Lcom/google/android/libraries/places/internal/zzazf;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnc;->zzb:Lcom/google/android/libraries/places/internal/zzazf;

    return-object p0
.end method

.method public static bridge synthetic zzc(Lcom/google/android/libraries/places/internal/zzbnc;Lcom/google/android/libraries/places/internal/zzazf;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnc;->zzb:Lcom/google/android/libraries/places/internal/zzazf;

    return-void
.end method

.method public static bridge synthetic zzd(Lcom/google/android/libraries/places/internal/zzbnc;Lcom/google/android/libraries/places/internal/zzbni;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnc;->zzc:Lcom/google/android/libraries/places/internal/zzbni;

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/libraries/places/internal/zzazf;)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbnj;->zzj()Ljava/util/logging/Logger;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbnc;->zzc:Lcom/google/android/libraries/places/internal/zzbni;

    .line 8
    .line 9
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzbni;->zzd(Lcom/google/android/libraries/places/internal/zzbni;)Lcom/google/android/libraries/places/internal/zzbbj;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    filled-new-array {p1, v2}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    const-string v3, "onSubchannelState"

    .line 18
    .line 19
    const-string v4, "Received health status {0} for subchannel {1}"

    .line 20
    .line 21
    const-string v2, "io.grpc.internal.PickFirstLeafLoadBalancer$HealthListener"

    .line 22
    .line 23
    invoke-virtual/range {v0 .. v5}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnc;->zzb:Lcom/google/android/libraries/places/internal/zzazf;

    .line 27
    .line 28
    :try_start_0
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnc;->zza:Lcom/google/android/libraries/places/internal/zzbnj;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbnj;->zzi(Lcom/google/android/libraries/places/internal/zzbnj;)Ljava/util/Map;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbnj;->zzh(Lcom/google/android/libraries/places/internal/zzbnj;)Lcom/google/android/libraries/places/internal/zzbnd;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbnd;->zzc()Ljava/net/SocketAddress;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Lcom/google/android/libraries/places/internal/zzbni;

    .line 47
    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbni;->zzf(Lcom/google/android/libraries/places/internal/zzbni;)Lcom/google/android/libraries/places/internal/zzbnc;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    if-ne p1, p0, :cond_0

    .line 55
    .line 56
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnc;->zza:Lcom/google/android/libraries/places/internal/zzbnj;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnc;->zzc:Lcom/google/android/libraries/places/internal/zzbni;

    .line 59
    .line 60
    invoke-static {p1, p0}, Lcom/google/android/libraries/places/internal/zzbnj;->zzl(Lcom/google/android/libraries/places/internal/zzbnj;Lcom/google/android/libraries/places/internal/zzbni;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void

    .line 64
    :catch_0
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbnj;->zzj()Ljava/util/logging/Logger;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    sget-object p1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 69
    .line 70
    const-string v0, "onSubchannelState"

    .line 71
    .line 72
    const-string v1, "Health listener received state change after subchannel was removed"

    .line 73
    .line 74
    const-string v2, "io.grpc.internal.PickFirstLeafLoadBalancer$HealthListener"

    .line 75
    .line 76
    invoke-virtual {p0, p1, v2, v0, v1}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method
