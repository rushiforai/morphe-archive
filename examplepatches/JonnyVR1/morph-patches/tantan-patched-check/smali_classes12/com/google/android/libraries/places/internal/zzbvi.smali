.class public final Lcom/google/android/libraries/places/internal/zzbvi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzbvk;

.field private final zzb:Ljava/lang/Object;

.field private zzc:Lcom/google/android/libraries/places/internal/zzbbi;

.field private final zzd:Lcom/google/android/libraries/places/internal/zzbvg;

.field private final zze:Lcom/google/android/libraries/places/internal/zzbbo;

.field private zzf:Lcom/google/android/libraries/places/internal/zzaze;

.field private zzg:Lcom/google/android/libraries/places/internal/zzbbk;

.field private zzh:Z


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbvk;Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzbbo;Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzbbk;Lcom/google/android/libraries/places/internal/zzbbi;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zza:Lcom/google/android/libraries/places/internal/zzbvk;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzb:Ljava/lang/Object;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zze:Lcom/google/android/libraries/places/internal/zzbbo;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzh:Z

    .line 12
    .line 13
    iput-object p5, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzg:Lcom/google/android/libraries/places/internal/zzbbk;

    .line 14
    .line 15
    new-instance p1, Lcom/google/android/libraries/places/internal/zzbvg;

    .line 16
    .line 17
    new-instance p2, Lcom/google/android/libraries/places/internal/zzbvh;

    .line 18
    .line 19
    invoke-direct {p2, p0}, Lcom/google/android/libraries/places/internal/zzbvh;-><init>(Lcom/google/android/libraries/places/internal/zzbvi;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p1, p2}, Lcom/google/android/libraries/places/internal/zzbvg;-><init>(Lcom/google/android/libraries/places/internal/zzbbd;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzd:Lcom/google/android/libraries/places/internal/zzbvg;

    .line 26
    .line 27
    sget-object p2, Lcom/google/android/libraries/places/internal/zzaze;->zza:Lcom/google/android/libraries/places/internal/zzaze;

    .line 28
    .line 29
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzf:Lcom/google/android/libraries/places/internal/zzaze;

    .line 30
    .line 31
    const/4 p2, 0x0

    .line 32
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzc:Lcom/google/android/libraries/places/internal/zzbbi;

    .line 33
    .line 34
    invoke-virtual {p1, p3}, Lcom/google/android/libraries/places/internal/zzbvg;->zzp(Lcom/google/android/libraries/places/internal/zzbbb;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static bridge synthetic zzd(Lcom/google/android/libraries/places/internal/zzbvi;)Lcom/google/android/libraries/places/internal/zzbvg;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzd:Lcom/google/android/libraries/places/internal/zzbvg;

    return-object p0
.end method

.method public static bridge synthetic zze(Lcom/google/android/libraries/places/internal/zzbvi;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzb:Ljava/lang/Object;

    return-object p0
.end method

.method public static bridge synthetic zzf(Lcom/google/android/libraries/places/internal/zzbvi;Lcom/google/android/libraries/places/internal/zzbbk;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzg:Lcom/google/android/libraries/places/internal/zzbbk;

    return-void
.end method

.method public static bridge synthetic zzg(Lcom/google/android/libraries/places/internal/zzbvi;Lcom/google/android/libraries/places/internal/zzaze;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzf:Lcom/google/android/libraries/places/internal/zzaze;

    return-void
.end method

.method public static bridge synthetic zzl(Lcom/google/android/libraries/places/internal/zzbvi;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzh:Z

    return p0
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzb:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbvj;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbvj;->zza:[Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzf:Lcom/google/android/libraries/places/internal/zzaze;

    .line 12
    .line 13
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzg:Lcom/google/android/libraries/places/internal/zzbbk;

    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzd:Lcom/google/android/libraries/places/internal/zzbvg;

    .line 28
    .line 29
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzbvg;->zzg()Lcom/google/android/libraries/places/internal/zzbbm;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    const/4 v4, 0x1

    .line 42
    iget-boolean p0, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzh:Z

    .line 43
    .line 44
    if-eq v4, p0, :cond_0

    .line 45
    .line 46
    const-string p0, ""

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const-string p0, ", deactivated"

    .line 50
    .line 51
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v5, "Address = "

    .line 54
    .line 55
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v0, ", state = "

    .line 62
    .line 63
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v0, ", picker type: "

    .line 70
    .line 71
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v0, ", lb: "

    .line 78
    .line 79
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method

.method public final zza()Lcom/google/android/libraries/places/internal/zzaze;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzf:Lcom/google/android/libraries/places/internal/zzaze;

    return-object p0
.end method

.method public final zzb()Lcom/google/android/libraries/places/internal/zzbbk;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzg:Lcom/google/android/libraries/places/internal/zzbbk;

    return-object p0
.end method

.method public final zzc()Lcom/google/android/libraries/places/internal/zzbbo;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zze:Lcom/google/android/libraries/places/internal/zzbbo;

    return-object p0
.end method

.method public final zzh()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzh:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zza:Lcom/google/android/libraries/places/internal/zzbvk;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzb:Ljava/lang/Object;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbvk;->zzj(Lcom/google/android/libraries/places/internal/zzbvk;)Ljava/util/Map;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzh:Z

    .line 19
    .line 20
    iget-object v6, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzb:Ljava/lang/Object;

    .line 21
    .line 22
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbvk;->zzk()Ljava/util/logging/Logger;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 27
    .line 28
    const-string v4, "deactivate"

    .line 29
    .line 30
    const-string v5, "Child balancer {0} deactivated"

    .line 31
    .line 32
    const-string v3, "io.grpc.util.MultiChildLoadBalancer$ChildLbState"

    .line 33
    .line 34
    invoke-virtual/range {v1 .. v6}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final zzi(Lcom/google/android/libraries/places/internal/zzbbo;)V
    .locals 0

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzh:Z

    return-void
.end method

.method public final zzj(Lcom/google/android/libraries/places/internal/zzbbi;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzc:Lcom/google/android/libraries/places/internal/zzbbi;

    return-void
.end method

.method public final zzk()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzd:Lcom/google/android/libraries/places/internal/zzbvg;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbvb;->zze()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaze;->zze:Lcom/google/android/libraries/places/internal/zzaze;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzf:Lcom/google/android/libraries/places/internal/zzaze;

    .line 9
    .line 10
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbvk;->zzk()Ljava/util/logging/Logger;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 15
    .line 16
    const-string v5, "Child balancer {0} deleted"

    .line 17
    .line 18
    iget-object v6, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzb:Ljava/lang/Object;

    .line 19
    .line 20
    const-string v3, "io.grpc.util.MultiChildLoadBalancer$ChildLbState"

    .line 21
    .line 22
    const-string v4, "shutdown"

    .line 23
    .line 24
    invoke-virtual/range {v1 .. v6}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final zzm()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zzh:Z

    return p0
.end method
