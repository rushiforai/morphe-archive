.class final Lcom/google/android/libraries/places/internal/zzbpu;
.super Lcom/google/android/libraries/places/internal/zzbcr;
.source "SourceFile"


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzbpv;

.field private final zzb:Lcom/google/android/libraries/places/internal/zzbcr;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbpv;Lcom/google/android/libraries/places/internal/zzbcr;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbpu;->zza:Lcom/google/android/libraries/places/internal/zzbpv;

    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbcr;-><init>()V

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbpu;->zzb:Lcom/google/android/libraries/places/internal/zzbcr;

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/libraries/places/internal/zzbdo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbpu;->zzb:Lcom/google/android/libraries/places/internal/zzbcr;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzbcr;->zza(Lcom/google/android/libraries/places/internal/zzbdo;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbpu;->zza:Lcom/google/android/libraries/places/internal/zzbpv;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbpv;->zze(Lcom/google/android/libraries/places/internal/zzbpv;)Lcom/google/android/libraries/places/internal/zzbdw;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbpt;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lcom/google/android/libraries/places/internal/zzbpt;-><init>(Lcom/google/android/libraries/places/internal/zzbpu;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lcom/google/android/libraries/places/internal/zzbdw;->zzc(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbdw;->zzb()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final zzb(Lcom/google/android/libraries/places/internal/zzbct;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbct;->zza()Lcom/google/android/libraries/places/internal/zzaye;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/google/android/libraries/places/internal/zzbpv;->zza:Lcom/google/android/libraries/places/internal/zzayc;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/internal/zzaye;->zzc(Lcom/google/android/libraries/places/internal/zzayc;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbpu;->zzb:Lcom/google/android/libraries/places/internal/zzbcr;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbct;->zzd()Lcom/google/android/libraries/places/internal/zzbcs;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbct;->zza()Lcom/google/android/libraries/places/internal/zzaye;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzaye;->zzb()Lcom/google/android/libraries/places/internal/zzayb;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbpu;->zza:Lcom/google/android/libraries/places/internal/zzbpv;

    .line 28
    .line 29
    new-instance v3, Lcom/google/android/libraries/places/internal/zzbps;

    .line 30
    .line 31
    invoke-direct {v3, p0}, Lcom/google/android/libraries/places/internal/zzbps;-><init>(Lcom/google/android/libraries/places/internal/zzbpv;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v1, v3}, Lcom/google/android/libraries/places/internal/zzayb;->zzb(Lcom/google/android/libraries/places/internal/zzayc;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzayb;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzayb;->zzc()Lcom/google/android/libraries/places/internal/zzaye;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v2, p0}, Lcom/google/android/libraries/places/internal/zzbcs;->zzb(Lcom/google/android/libraries/places/internal/zzaye;)Lcom/google/android/libraries/places/internal/zzbcs;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzbcs;->zzd()Lcom/google/android/libraries/places/internal/zzbct;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    new-instance p1, Lcom/google/android/libraries/places/internal/zzbli;

    .line 49
    .line 50
    check-cast v0, Lcom/google/android/libraries/places/internal/zzblj;

    .line 51
    .line 52
    invoke-direct {p1, v0, p0}, Lcom/google/android/libraries/places/internal/zzbli;-><init>(Lcom/google/android/libraries/places/internal/zzblj;Lcom/google/android/libraries/places/internal/zzbct;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, v0, Lcom/google/android/libraries/places/internal/zzblj;->zzc:Lcom/google/android/libraries/places/internal/zzbma;

    .line 56
    .line 57
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbma;->zzf:Lcom/google/android/libraries/places/internal/zzbdw;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzbdw;->zzc(Ljava/lang/Runnable;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbdw;->zzb()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    const-string p0, "RetryingNameResolver can only be used once to wrap a NameResolver"

    .line 67
    .line 68
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method
