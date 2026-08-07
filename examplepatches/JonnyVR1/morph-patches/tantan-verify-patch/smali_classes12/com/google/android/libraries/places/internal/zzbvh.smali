.class public final Lcom/google/android/libraries/places/internal/zzbvh;
.super Lcom/google/android/libraries/places/internal/zzbvc;
.source "SourceFile"


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzbvi;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbvi;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbvh;->zza:Lcom/google/android/libraries/places/internal/zzbvi;

    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbvc;-><init>()V

    return-void
.end method


# virtual methods
.method public final zze(Lcom/google/android/libraries/places/internal/zzaze;Lcom/google/android/libraries/places/internal/zzbbk;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvh;->zza:Lcom/google/android/libraries/places/internal/zzbvi;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/google/android/libraries/places/internal/zzbvi;->zza:Lcom/google/android/libraries/places/internal/zzbvk;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbvk;->zzj(Lcom/google/android/libraries/places/internal/zzbvk;)Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbvi;->zze(Lcom/google/android/libraries/places/internal/zzbvi;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvh;->zza:Lcom/google/android/libraries/places/internal/zzbvi;

    .line 21
    .line 22
    invoke-static {v0, p1}, Lcom/google/android/libraries/places/internal/zzbvi;->zzg(Lcom/google/android/libraries/places/internal/zzbvi;Lcom/google/android/libraries/places/internal/zzaze;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbvh;->zza:Lcom/google/android/libraries/places/internal/zzbvi;

    .line 26
    .line 27
    invoke-static {v0, p2}, Lcom/google/android/libraries/places/internal/zzbvi;->zzf(Lcom/google/android/libraries/places/internal/zzbvi;Lcom/google/android/libraries/places/internal/zzbbk;)V

    .line 28
    .line 29
    .line 30
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbvh;->zza:Lcom/google/android/libraries/places/internal/zzbvi;

    .line 31
    .line 32
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzbvi;->zzl(Lcom/google/android/libraries/places/internal/zzbvi;)Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-nez p2, :cond_2

    .line 37
    .line 38
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbvh;->zza:Lcom/google/android/libraries/places/internal/zzbvi;

    .line 39
    .line 40
    iget-object v0, p2, Lcom/google/android/libraries/places/internal/zzbvi;->zza:Lcom/google/android/libraries/places/internal/zzbvk;

    .line 41
    .line 42
    iget-boolean v0, v0, Lcom/google/android/libraries/places/internal/zzbvk;->zzf:Z

    .line 43
    .line 44
    if-nez v0, :cond_2

    .line 45
    .line 46
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaze;->zzd:Lcom/google/android/libraries/places/internal/zzaze;

    .line 47
    .line 48
    if-ne p1, v0, :cond_1

    .line 49
    .line 50
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzbvi;->zzd(Lcom/google/android/libraries/places/internal/zzbvi;)Lcom/google/android/libraries/places/internal/zzbvg;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbvb;->zzg()Lcom/google/android/libraries/places/internal/zzbbm;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbbm;->zzd()V

    .line 59
    .line 60
    .line 61
    :cond_1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbvh;->zza:Lcom/google/android/libraries/places/internal/zzbvi;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zza:Lcom/google/android/libraries/places/internal/zzbvk;

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbvk;->zzl()V

    .line 66
    .line 67
    .line 68
    :cond_2
    :goto_0
    return-void
.end method

.method public final zzf()Lcom/google/android/libraries/places/internal/zzbbd;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbvh;->zza:Lcom/google/android/libraries/places/internal/zzbvi;

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbvi;->zza:Lcom/google/android/libraries/places/internal/zzbvk;

    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbvk;->zzg(Lcom/google/android/libraries/places/internal/zzbvk;)Lcom/google/android/libraries/places/internal/zzbbd;

    move-result-object p0

    return-object p0
.end method
