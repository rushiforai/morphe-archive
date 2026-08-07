.class public final Lcom/google/android/libraries/places/internal/zzga;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/api/net/PlacesClient;


# instance fields
.field private final zza:Lcom/google/android/libraries/places/internal/zzev;

.field private final zzb:Lcom/google/android/libraries/places/internal/zzel;

.field private final zzc:Lcom/google/android/libraries/places/internal/zzeq;

.field private final zzd:Lcom/google/android/libraries/places/internal/zzjr;

.field private final zze:Lcom/google/android/libraries/places/internal/zzdv;

.field private final zzf:Lcom/google/android/libraries/places/internal/zzhc;

.field private final zzg:Lcom/google/android/libraries/places/internal/zzjs;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzjs;Lcom/google/android/libraries/places/internal/zzev;Lcom/google/android/libraries/places/internal/zzel;Lcom/google/android/libraries/places/internal/zzeq;Lcom/google/android/libraries/places/internal/zzjr;Lcom/google/android/libraries/places/internal/zzdv;Lcom/google/android/libraries/places/internal/zzhc;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzga;->zzg:Lcom/google/android/libraries/places/internal/zzjs;

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzga;->zza:Lcom/google/android/libraries/places/internal/zzev;

    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzga;->zzb:Lcom/google/android/libraries/places/internal/zzel;

    iput-object p4, p0, Lcom/google/android/libraries/places/internal/zzga;->zzc:Lcom/google/android/libraries/places/internal/zzeq;

    iput-object p5, p0, Lcom/google/android/libraries/places/internal/zzga;->zzd:Lcom/google/android/libraries/places/internal/zzjr;

    iput-object p6, p0, Lcom/google/android/libraries/places/internal/zzga;->zze:Lcom/google/android/libraries/places/internal/zzdv;

    iput-object p7, p0, Lcom/google/android/libraries/places/internal/zzga;->zzf:Lcom/google/android/libraries/places/internal/zzhc;

    return-void
.end method

.method private static zzu(Lcom/google/android/libraries/places/internal/zzef;Lcom/google/android/libraries/places/internal/zzej;)V
    .locals 0
    .param p1    # Lcom/google/android/libraries/places/internal/zzej;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const-string p1, "Duration"

    .line 2
    .line 3
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzef;->zzb(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzef;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    filled-new-array {p1}, [Lcom/google/android/libraries/places/internal/zzef;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p0, p1}, Lcom/google/android/libraries/places/internal/zzef;->zza(Lcom/google/android/libraries/places/internal/zzef;[Lcom/google/android/libraries/places/internal/zzef;)Lcom/google/android/libraries/places/internal/zzef;

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzea;->zza()Lcom/google/android/libraries/places/internal/zzea;

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzea;->zza()Lcom/google/android/libraries/places/internal/zzea;

    .line 18
    .line 19
    .line 20
    const-string p1, "Battery"

    .line 21
    .line 22
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzef;->zzb(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzef;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    filled-new-array {p1}, [Lcom/google/android/libraries/places/internal/zzef;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-static {p0, p1}, Lcom/google/android/libraries/places/internal/zzef;->zza(Lcom/google/android/libraries/places/internal/zzef;[Lcom/google/android/libraries/places/internal/zzef;)Lcom/google/android/libraries/places/internal/zzef;

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzea;->zza()Lcom/google/android/libraries/places/internal/zzea;

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public final fetchPhoto(Lcom/google/android/libraries/places/api/net/FetchPhotoRequest;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/libraries/places/api/net/FetchPhotoRequest;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/android/libraries/places/api/net/FetchPhotoResponse;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzga;->zza(Lcom/google/android/libraries/places/api/net/FetchPhotoRequest;I)Lcom/google/android/gms/tasks/Task;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public final fetchPlace(Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/android/libraries/places/api/net/FetchPlaceResponse;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzga;->zzb(Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;I)Lcom/google/android/gms/tasks/Task;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public final fetchResolvedPhotoUri(Lcom/google/android/libraries/places/api/net/FetchResolvedPhotoUriRequest;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/libraries/places/api/net/FetchResolvedPhotoUriRequest;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/android/libraries/places/api/net/FetchResolvedPhotoUriResponse;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzga;->zzc(Lcom/google/android/libraries/places/api/net/FetchResolvedPhotoUriRequest;I)Lcom/google/android/gms/tasks/Task;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public final findAutocompletePredictions(Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsResponse;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzga;->zzd(Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;I)Lcom/google/android/gms/tasks/Task;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public final findCurrentPlace(Lcom/google/android/libraries/places/api/net/FindCurrentPlaceRequest;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation build Landroidx/annotation/RequiresPermission;
        anyOf = {
            "android.permission.ACCESS_COARSE_LOCATION",
            "android.permission.ACCESS_FINE_LOCATION"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/libraries/places/api/net/FindCurrentPlaceRequest;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/android/libraries/places/api/net/FindCurrentPlaceResponse;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-virtual {p0, p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzga;->zze(Lcom/google/android/libraries/places/api/net/FindCurrentPlaceRequest;Ljava/lang/String;I)Lcom/google/android/gms/tasks/Task;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final isOpen(Lcom/google/android/libraries/places/api/net/IsOpenRequest;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/libraries/places/api/net/IsOpenRequest;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/android/libraries/places/api/net/IsOpenResponse;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzga;->zzf(Lcom/google/android/libraries/places/api/net/IsOpenRequest;I)Lcom/google/android/gms/tasks/Task;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public final searchByText(Lcom/google/android/libraries/places/api/net/SearchByTextRequest;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/libraries/places/api/net/SearchByTextRequest;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/android/libraries/places/api/net/SearchByTextResponse;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzga;->zzh(Lcom/google/android/libraries/places/api/net/SearchByTextRequest;I)Lcom/google/android/gms/tasks/Task;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public final searchNearby(Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/android/libraries/places/api/net/SearchNearbyResponse;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzga;->zzi(Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;I)Lcom/google/android/gms/tasks/Task;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public final zza(Lcom/google/android/libraries/places/api/net/FetchPhotoRequest;I)Lcom/google/android/gms/tasks/Task;
    .locals 3

    .line 1
    :try_start_0
    const-string p2, "Request must not be null."

    .line 2
    .line 3
    invoke-static {p1, p2}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzea;->zza()Lcom/google/android/libraries/places/internal/zzea;

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzej;->zza()Lcom/google/android/libraries/places/internal/zzej;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzga;->zza:Lcom/google/android/libraries/places/internal/zzev;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-interface {v0, p1, v1}, Lcom/google/android/libraries/places/internal/zzev;->zza(Lcom/google/android/libraries/places/api/net/FetchPhotoRequest;I)Lcom/google/android/gms/tasks/Task;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v2, Lcom/google/android/libraries/places/internal/zzfw;

    .line 21
    .line 22
    invoke-direct {v2, p0, p1, v1, p2}, Lcom/google/android/libraries/places/internal/zzfw;-><init>(Lcom/google/android/libraries/places/internal/zzga;Lcom/google/android/libraries/places/api/net/FetchPhotoRequest;ILcom/google/android/libraries/places/internal/zzej;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v2}, Lcom/google/android/gms/tasks/Task;->h(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance p1, Lcom/google/android/libraries/places/internal/zzfr;

    .line 30
    .line 31
    invoke-direct {p1}, Lcom/google/android/libraries/places/internal/zzfr;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->j(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 35
    .line 36
    .line 37
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    return-object p0

    .line 39
    :catch_0
    move-exception p0

    .line 40
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzkd;->zzb(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    throw p0
.end method

.method public final zzb(Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;I)Lcom/google/android/gms/tasks/Task;
    .locals 3

    .line 1
    :try_start_0
    const-string v0, "Request must not be null."

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzea;->zza()Lcom/google/android/libraries/places/internal/zzea;

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzej;->zza()Lcom/google/android/libraries/places/internal/zzej;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzga;->zzg:Lcom/google/android/libraries/places/internal/zzjs;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzjs;->zzh()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    if-eq p2, v1, :cond_0

    .line 23
    .line 24
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzga;->zzf:Lcom/google/android/libraries/places/internal/zzhc;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {p2, p1, v1}, Lcom/google/android/libraries/places/internal/zzhc;->zzg(Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;I)Lcom/google/android/gms/tasks/Task;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    new-instance v2, Lcom/google/android/libraries/places/internal/zzfu;

    .line 32
    .line 33
    invoke-direct {v2, p0, p1, v1, v0}, Lcom/google/android/libraries/places/internal/zzfu;-><init>(Lcom/google/android/libraries/places/internal/zzga;Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;ILcom/google/android/libraries/places/internal/zzej;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2, v2}, Lcom/google/android/gms/tasks/Task;->h(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance p1, Lcom/google/android/libraries/places/internal/zzfr;

    .line 41
    .line 42
    invoke-direct {p1}, Lcom/google/android/libraries/places/internal/zzfr;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->j(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_0
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzga;->zza:Lcom/google/android/libraries/places/internal/zzev;

    .line 51
    .line 52
    invoke-interface {v1, p1, p2}, Lcom/google/android/libraries/places/internal/zzev;->zzb(Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;I)Lcom/google/android/gms/tasks/Task;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    new-instance v2, Lcom/google/android/libraries/places/internal/zzfv;

    .line 57
    .line 58
    invoke-direct {v2, p0, p1, p2, v0}, Lcom/google/android/libraries/places/internal/zzfv;-><init>(Lcom/google/android/libraries/places/internal/zzga;Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;ILcom/google/android/libraries/places/internal/zzej;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v2}, Lcom/google/android/gms/tasks/Task;->h(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    new-instance p1, Lcom/google/android/libraries/places/internal/zzfr;

    .line 66
    .line 67
    invoke-direct {p1}, Lcom/google/android/libraries/places/internal/zzfr;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->j(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 71
    .line 72
    .line 73
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    return-object p0

    .line 75
    :catch_0
    move-exception p0

    .line 76
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzkd;->zzb(Ljava/lang/Throwable;)V

    .line 77
    .line 78
    .line 79
    throw p0
.end method

.method public final zzc(Lcom/google/android/libraries/places/api/net/FetchResolvedPhotoUriRequest;I)Lcom/google/android/gms/tasks/Task;
    .locals 3

    .line 1
    :try_start_0
    const-string p2, "Request must not be null."

    .line 2
    .line 3
    invoke-static {p1, p2}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzea;->zza()Lcom/google/android/libraries/places/internal/zzea;

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzej;->zza()Lcom/google/android/libraries/places/internal/zzej;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzga;->zzf:Lcom/google/android/libraries/places/internal/zzhc;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, p1, v1}, Lcom/google/android/libraries/places/internal/zzhc;->zzf(Lcom/google/android/libraries/places/api/net/FetchResolvedPhotoUriRequest;I)Lcom/google/android/gms/tasks/Task;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v2, Lcom/google/android/libraries/places/internal/zzft;

    .line 21
    .line 22
    invoke-direct {v2, p0, p1, v1, p2}, Lcom/google/android/libraries/places/internal/zzft;-><init>(Lcom/google/android/libraries/places/internal/zzga;Lcom/google/android/libraries/places/api/net/FetchResolvedPhotoUriRequest;ILcom/google/android/libraries/places/internal/zzej;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v2}, Lcom/google/android/gms/tasks/Task;->h(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance p1, Lcom/google/android/libraries/places/internal/zzfr;

    .line 30
    .line 31
    invoke-direct {p1}, Lcom/google/android/libraries/places/internal/zzfr;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->j(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 35
    .line 36
    .line 37
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    return-object p0

    .line 39
    :catch_0
    move-exception p0

    .line 40
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzkd;->zzb(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    throw p0
.end method

.method public final zzd(Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;I)Lcom/google/android/gms/tasks/Task;
    .locals 3

    .line 1
    :try_start_0
    const-string v0, "Request must not be null."

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzea;->zza()Lcom/google/android/libraries/places/internal/zzea;

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzej;->zza()Lcom/google/android/libraries/places/internal/zzej;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzga;->zzg:Lcom/google/android/libraries/places/internal/zzjs;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzjs;->zzh()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    if-eq p2, v1, :cond_0

    .line 23
    .line 24
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzga;->zzf:Lcom/google/android/libraries/places/internal/zzhc;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {p2, p1, v1}, Lcom/google/android/libraries/places/internal/zzhc;->zze(Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;I)Lcom/google/android/gms/tasks/Task;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    new-instance v2, Lcom/google/android/libraries/places/internal/zzfp;

    .line 32
    .line 33
    invoke-direct {v2, p0, p1, v1, v0}, Lcom/google/android/libraries/places/internal/zzfp;-><init>(Lcom/google/android/libraries/places/internal/zzga;Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;ILcom/google/android/libraries/places/internal/zzej;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2, v2}, Lcom/google/android/gms/tasks/Task;->h(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance p1, Lcom/google/android/libraries/places/internal/zzfr;

    .line 41
    .line 42
    invoke-direct {p1}, Lcom/google/android/libraries/places/internal/zzfr;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->j(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_0
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzga;->zza:Lcom/google/android/libraries/places/internal/zzev;

    .line 51
    .line 52
    invoke-interface {v1, p1, p2}, Lcom/google/android/libraries/places/internal/zzev;->zzc(Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;I)Lcom/google/android/gms/tasks/Task;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    new-instance v2, Lcom/google/android/libraries/places/internal/zzfq;

    .line 57
    .line 58
    invoke-direct {v2, p0, p1, p2, v0}, Lcom/google/android/libraries/places/internal/zzfq;-><init>(Lcom/google/android/libraries/places/internal/zzga;Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;ILcom/google/android/libraries/places/internal/zzej;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v2}, Lcom/google/android/gms/tasks/Task;->h(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    new-instance p1, Lcom/google/android/libraries/places/internal/zzfr;

    .line 66
    .line 67
    invoke-direct {p1}, Lcom/google/android/libraries/places/internal/zzfr;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->j(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 71
    .line 72
    .line 73
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    return-object p0

    .line 75
    :catch_0
    move-exception p0

    .line 76
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzkd;->zzb(Ljava/lang/Throwable;)V

    .line 77
    .line 78
    .line 79
    throw p0
.end method

.method public final zze(Lcom/google/android/libraries/places/api/net/FindCurrentPlaceRequest;Ljava/lang/String;I)Lcom/google/android/gms/tasks/Task;
    .locals 7
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RequiresPermission;
        anyOf = {
            "android.permission.ACCESS_COARSE_LOCATION",
            "android.permission.ACCESS_FINE_LOCATION"
        }
    .end annotation

    .line 1
    :try_start_0
    const-string p2, "Request must not be null."

    .line 2
    .line 3
    invoke-static {p1, p2}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzga;->zze:Lcom/google/android/libraries/places/internal/zzdv;

    .line 7
    .line 8
    invoke-interface {p2}, Lcom/google/android/libraries/places/internal/zzdv;->zza()J

    .line 9
    .line 10
    .line 11
    move-result-wide v3

    .line 12
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzea;->zza()Lcom/google/android/libraries/places/internal/zzea;

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzej;->zza()Lcom/google/android/libraries/places/internal/zzej;

    .line 16
    .line 17
    .line 18
    move-result-object v6

    .line 19
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzga;->zzb:Lcom/google/android/libraries/places/internal/zzel;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FindCurrentPlaceRequest;->getCancellationToken()Ll/gg4;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    invoke-virtual {p2, p3}, Lcom/google/android/libraries/places/internal/zzel;->zza(Ll/gg4;)Lcom/google/android/gms/tasks/Task;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    new-instance p3, Lcom/google/android/libraries/places/internal/zzfn;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-direct {p3, p0, p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzfn;-><init>(Lcom/google/android/libraries/places/internal/zzga;Lcom/google/android/libraries/places/api/net/FindCurrentPlaceRequest;Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2, p3}, Lcom/google/android/gms/tasks/Task;->r(Ll/zdg0;)Lcom/google/android/gms/tasks/Task;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    new-instance v0, Lcom/google/android/libraries/places/internal/zzfo;

    .line 41
    .line 42
    const/4 v5, 0x1

    .line 43
    move-object v1, p0

    .line 44
    move-object v2, p1

    .line 45
    invoke-direct/range {v0 .. v6}, Lcom/google/android/libraries/places/internal/zzfo;-><init>(Lcom/google/android/libraries/places/internal/zzga;Lcom/google/android/libraries/places/api/net/FindCurrentPlaceRequest;JILcom/google/android/libraries/places/internal/zzej;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2, v0}, Lcom/google/android/gms/tasks/Task;->h(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    new-instance p1, Lcom/google/android/libraries/places/internal/zzfr;

    .line 53
    .line 54
    invoke-direct {p1}, Lcom/google/android/libraries/places/internal/zzfr;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->j(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 58
    .line 59
    .line 60
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    return-object p0

    .line 62
    :catch_0
    move-exception v0

    .line 63
    move-object p0, v0

    .line 64
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzkd;->zzb(Ljava/lang/Throwable;)V

    .line 65
    .line 66
    .line 67
    throw p0
.end method

.method public final zzf(Lcom/google/android/libraries/places/api/net/IsOpenRequest;I)Lcom/google/android/gms/tasks/Task;
    .locals 8

    .line 1
    :try_start_0
    const-string p2, "Request must not be null."

    .line 2
    .line 3
    invoke-static {p1, p2}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/IsOpenRequest;->getPlace()Lcom/google/android/libraries/places/api/model/Place;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/IsOpenRequest;->getPlaceId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/IsOpenRequest;->getUtcTimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    new-instance v3, Ll/sni0;

    .line 19
    .line 20
    invoke-direct {v3}, Ll/sni0;-><init>()V

    .line 21
    .line 22
    .line 23
    if-nez p2, :cond_0

    .line 24
    .line 25
    sget v4, Lcom/google/android/libraries/places/api/model/zzce;->zza:I

    .line 26
    .line 27
    sget-object v4, Lcom/google/android/libraries/places/api/model/Place$Field;->BUSINESS_STATUS:Lcom/google/android/libraries/places/api/model/Place$Field;

    .line 28
    .line 29
    sget-object v5, Lcom/google/android/libraries/places/api/model/Place$Field;->CURRENT_OPENING_HOURS:Lcom/google/android/libraries/places/api/model/Place$Field;

    .line 30
    .line 31
    sget-object v6, Lcom/google/android/libraries/places/api/model/Place$Field;->OPENING_HOURS:Lcom/google/android/libraries/places/api/model/Place$Field;

    .line 32
    .line 33
    sget-object v7, Lcom/google/android/libraries/places/api/model/Place$Field;->UTC_OFFSET:Lcom/google/android/libraries/places/api/model/Place$Field;

    .line 34
    .line 35
    filled-new-array {v4, v5, v6, v7}, [Lcom/google/android/libraries/places/api/model/Place$Field;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p2}, Lcom/google/android/libraries/places/api/model/Place;->getBusinessStatus()Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    if-eqz v5, :cond_1

    .line 54
    .line 55
    sget-object v6, Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;->OPERATIONAL:Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;

    .line 56
    .line 57
    if-ne v5, v6, :cond_5

    .line 58
    .line 59
    :cond_1
    if-nez v5, :cond_2

    .line 60
    .line 61
    sget-object v5, Lcom/google/android/libraries/places/api/model/Place$Field;->BUSINESS_STATUS:Lcom/google/android/libraries/places/api/model/Place$Field;

    .line 62
    .line 63
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    :cond_2
    invoke-virtual {p2}, Lcom/google/android/libraries/places/api/model/Place;->getCurrentOpeningHours()Lcom/google/android/libraries/places/api/model/OpeningHours;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    if-nez v5, :cond_3

    .line 71
    .line 72
    sget-object v5, Lcom/google/android/libraries/places/api/model/Place$Field;->CURRENT_OPENING_HOURS:Lcom/google/android/libraries/places/api/model/Place$Field;

    .line 73
    .line 74
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    :cond_3
    invoke-virtual {p2}, Lcom/google/android/libraries/places/api/model/Place;->getOpeningHours()Lcom/google/android/libraries/places/api/model/OpeningHours;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    if-nez v5, :cond_4

    .line 82
    .line 83
    sget-object v5, Lcom/google/android/libraries/places/api/model/Place$Field;->OPENING_HOURS:Lcom/google/android/libraries/places/api/model/Place$Field;

    .line 84
    .line 85
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    :cond_4
    invoke-virtual {p2}, Lcom/google/android/libraries/places/api/model/Place;->getUtcOffsetMinutes()Ljava/lang/Integer;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    if-nez v5, :cond_5

    .line 93
    .line 94
    sget-object v5, Lcom/google/android/libraries/places/api/model/Place$Field;->UTC_OFFSET:Lcom/google/android/libraries/places/api/model/Place$Field;

    .line 95
    .line 96
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    :cond_5
    :goto_0
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    const/4 v6, 0x0

    .line 104
    if-eqz v5, :cond_7

    .line 105
    .line 106
    if-eqz p2, :cond_6

    .line 107
    .line 108
    invoke-static {p2, v1, v2}, Lcom/google/android/libraries/places/api/model/zzce;->zza(Lcom/google/android/libraries/places/api/model/Place;J)Ljava/lang/Boolean;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {p0}, Lcom/google/android/libraries/places/api/net/IsOpenResponse;->newInstance(Ljava/lang/Boolean;)Lcom/google/android/libraries/places/api/net/IsOpenResponse;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {v3, p0}, Ll/sni0;->c(Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v3}, Ll/sni0;->a()Lcom/google/android/gms/tasks/Task;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    return-object p0

    .line 124
    :cond_6
    throw v6

    .line 125
    :cond_7
    if-eqz p2, :cond_8

    .line 126
    .line 127
    invoke-virtual {p2}, Lcom/google/android/libraries/places/api/model/Place;->getId()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    :cond_8
    if-eqz v0, :cond_a

    .line 132
    .line 133
    invoke-static {v0, v4}, Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;->builder(Ljava/lang/String;Ljava/util/List;)Lcom/google/android/libraries/places/api/net/FetchPlaceRequest$Builder;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/IsOpenRequest;->getCancellationToken()Ll/gg4;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/api/net/FetchPlaceRequest$Builder;->setCancellationToken(Ll/gg4;)Lcom/google/android/libraries/places/api/net/FetchPlaceRequest$Builder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/google/android/libraries/places/api/net/FetchPlaceRequest$Builder;->build()Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzea;->zza()Lcom/google/android/libraries/places/internal/zzea;

    .line 149
    .line 150
    .line 151
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzej;->zza()Lcom/google/android/libraries/places/internal/zzej;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzga;->zzg:Lcom/google/android/libraries/places/internal/zzjs;

    .line 156
    .line 157
    invoke-virtual {v4}, Lcom/google/android/libraries/places/internal/zzjs;->zzh()Z

    .line 158
    .line 159
    .line 160
    move-result v4

    .line 161
    const/4 v5, 0x1

    .line 162
    if-eqz v4, :cond_9

    .line 163
    .line 164
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzga;->zzf:Lcom/google/android/libraries/places/internal/zzhc;

    .line 165
    .line 166
    invoke-virtual {v4, p1, v5}, Lcom/google/android/libraries/places/internal/zzhc;->zzg(Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;I)Lcom/google/android/gms/tasks/Task;

    .line 167
    .line 168
    .line 169
    move-result-object v4

    .line 170
    new-instance v6, Lcom/google/android/libraries/places/internal/zzfx;

    .line 171
    .line 172
    invoke-direct {v6, p0, p1, v5, v0}, Lcom/google/android/libraries/places/internal/zzfx;-><init>(Lcom/google/android/libraries/places/internal/zzga;Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;ILcom/google/android/libraries/places/internal/zzej;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {v4, v6}, Lcom/google/android/gms/tasks/Task;->h(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    new-instance p1, Lcom/google/android/libraries/places/internal/zzfy;

    .line 180
    .line 181
    invoke-direct {p1, p2, v1, v2, v3}, Lcom/google/android/libraries/places/internal/zzfy;-><init>(Lcom/google/android/libraries/places/api/model/Place;JLl/sni0;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->r(Ll/zdg0;)Lcom/google/android/gms/tasks/Task;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    new-instance p1, Lcom/google/android/libraries/places/internal/zzfr;

    .line 189
    .line 190
    invoke-direct {p1}, Lcom/google/android/libraries/places/internal/zzfr;-><init>()V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->j(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    return-object p0

    .line 198
    :cond_9
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzga;->zza:Lcom/google/android/libraries/places/internal/zzev;

    .line 199
    .line 200
    invoke-interface {v4, p1, v5}, Lcom/google/android/libraries/places/internal/zzev;->zzb(Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;I)Lcom/google/android/gms/tasks/Task;

    .line 201
    .line 202
    .line 203
    move-result-object v4

    .line 204
    new-instance v6, Lcom/google/android/libraries/places/internal/zzfz;

    .line 205
    .line 206
    invoke-direct {v6, p0, p1, v5, v0}, Lcom/google/android/libraries/places/internal/zzfz;-><init>(Lcom/google/android/libraries/places/internal/zzga;Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;ILcom/google/android/libraries/places/internal/zzej;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v4, v6}, Lcom/google/android/gms/tasks/Task;->h(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    new-instance p1, Lcom/google/android/libraries/places/internal/zzfm;

    .line 214
    .line 215
    invoke-direct {p1, p2, v1, v2, v3}, Lcom/google/android/libraries/places/internal/zzfm;-><init>(Lcom/google/android/libraries/places/api/model/Place;JLl/sni0;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->r(Ll/zdg0;)Lcom/google/android/gms/tasks/Task;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    new-instance p1, Lcom/google/android/libraries/places/internal/zzfr;

    .line 223
    .line 224
    invoke-direct {p1}, Lcom/google/android/libraries/places/internal/zzfr;-><init>()V

    .line 225
    .line 226
    .line 227
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->j(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    return-object p0

    .line 232
    :cond_a
    throw v6
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 233
    :catch_0
    move-exception p0

    .line 234
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzkd;->zzb(Ljava/lang/Throwable;)V

    .line 235
    .line 236
    .line 237
    throw p0
.end method

.method public final synthetic zzg(Lcom/google/android/libraries/places/api/net/FindCurrentPlaceRequest;Ljava/lang/String;ILandroid/location/Location;)Lcom/google/android/gms/tasks/Task;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-string p2, "Location must not be null."

    .line 2
    .line 3
    invoke-static {p4, p2}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzga;->zzc:Lcom/google/android/libraries/places/internal/zzeq;

    .line 7
    .line 8
    const/4 p3, 0x0

    .line 9
    invoke-virtual {p2, p3}, Lcom/google/android/libraries/places/internal/zzeq;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zznx;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzga;->zza:Lcom/google/android/libraries/places/internal/zzev;

    .line 14
    .line 15
    const/4 p3, 0x1

    .line 16
    invoke-interface {p0, p1, p4, p2, p3}, Lcom/google/android/libraries/places/internal/zzev;->zzd(Lcom/google/android/libraries/places/api/net/FindCurrentPlaceRequest;Landroid/location/Location;Lcom/google/android/libraries/places/internal/zznx;I)Lcom/google/android/gms/tasks/Task;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final zzh(Lcom/google/android/libraries/places/api/net/SearchByTextRequest;I)Lcom/google/android/gms/tasks/Task;
    .locals 3

    .line 1
    :try_start_0
    const-string p2, "Request must not be null."

    .line 2
    .line 3
    invoke-static {p1, p2}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzea;->zza()Lcom/google/android/libraries/places/internal/zzea;

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzej;->zza()Lcom/google/android/libraries/places/internal/zzej;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzga;->zzf:Lcom/google/android/libraries/places/internal/zzhc;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, p1, v1}, Lcom/google/android/libraries/places/internal/zzhc;->zzm(Lcom/google/android/libraries/places/api/net/SearchByTextRequest;I)Lcom/google/android/gms/tasks/Task;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v2, Lcom/google/android/libraries/places/internal/zzfl;

    .line 21
    .line 22
    invoke-direct {v2, p0, p1, v1, p2}, Lcom/google/android/libraries/places/internal/zzfl;-><init>(Lcom/google/android/libraries/places/internal/zzga;Lcom/google/android/libraries/places/api/net/SearchByTextRequest;ILcom/google/android/libraries/places/internal/zzej;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v2}, Lcom/google/android/gms/tasks/Task;->h(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance p1, Lcom/google/android/libraries/places/internal/zzfr;

    .line 30
    .line 31
    invoke-direct {p1}, Lcom/google/android/libraries/places/internal/zzfr;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->j(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 35
    .line 36
    .line 37
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    return-object p0

    .line 39
    :catch_0
    move-exception p0

    .line 40
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzkd;->zzb(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    throw p0
.end method

.method public final zzi(Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;I)Lcom/google/android/gms/tasks/Task;
    .locals 3

    .line 1
    :try_start_0
    const-string p2, "Request must not be null."

    .line 2
    .line 3
    invoke-static {p1, p2}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzea;->zza()Lcom/google/android/libraries/places/internal/zzea;

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzej;->zza()Lcom/google/android/libraries/places/internal/zzej;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzga;->zzf:Lcom/google/android/libraries/places/internal/zzhc;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, p1, v1}, Lcom/google/android/libraries/places/internal/zzhc;->zzn(Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;I)Lcom/google/android/gms/tasks/Task;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v2, Lcom/google/android/libraries/places/internal/zzfs;

    .line 21
    .line 22
    invoke-direct {v2, p0, p1, v1, p2}, Lcom/google/android/libraries/places/internal/zzfs;-><init>(Lcom/google/android/libraries/places/internal/zzga;Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;ILcom/google/android/libraries/places/internal/zzej;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v2}, Lcom/google/android/gms/tasks/Task;->h(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance p1, Lcom/google/android/libraries/places/internal/zzfr;

    .line 30
    .line 31
    invoke-direct {p1}, Lcom/google/android/libraries/places/internal/zzfr;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->j(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 35
    .line 36
    .line 37
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    return-object p0

    .line 39
    :catch_0
    move-exception p0

    .line 40
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzkd;->zzb(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    throw p0
.end method

.method public final synthetic zzj(Lcom/google/android/libraries/places/api/net/FetchPhotoRequest;ILcom/google/android/libraries/places/internal/zzej;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/libraries/places/api/net/FetchPhotoResponse;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzga;->zzd:Lcom/google/android/libraries/places/internal/zzjr;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    invoke-interface {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzjr;->zza(Lcom/google/android/libraries/places/api/net/FetchPhotoRequest;I)V

    .line 5
    .line 6
    .line 7
    const-string p0, "FetchPhoto"

    .line 8
    .line 9
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzef;->zzb(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzef;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0, p3}, Lcom/google/android/libraries/places/internal/zzga;->zzu(Lcom/google/android/libraries/places/internal/zzef;Lcom/google/android/libraries/places/internal/zzej;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->l()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/google/android/libraries/places/api/net/FetchPhotoResponse;

    .line 21
    .line 22
    return-object p0
.end method

.method public final synthetic zzk(Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;ILcom/google/android/libraries/places/internal/zzej;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/libraries/places/api/net/FetchPlaceResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzga;->zzd:Lcom/google/android/libraries/places/internal/zzjr;

    .line 2
    .line 3
    const/4 p2, 0x3

    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-interface {p0, p1, p2, v0}, Lcom/google/android/libraries/places/internal/zzjr;->zzk(Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;II)V

    .line 6
    .line 7
    .line 8
    const-string p0, "GetPlace"

    .line 9
    .line 10
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzef;->zzb(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzef;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0, p3}, Lcom/google/android/libraries/places/internal/zzga;->zzu(Lcom/google/android/libraries/places/internal/zzef;Lcom/google/android/libraries/places/internal/zzej;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->l()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/google/android/libraries/places/api/net/FetchPlaceResponse;

    .line 22
    .line 23
    return-object p0
.end method

.method public final synthetic zzl(Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;ILcom/google/android/libraries/places/internal/zzej;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/libraries/places/api/net/FetchPlaceResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzga;->zzd:Lcom/google/android/libraries/places/internal/zzjr;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-interface {p0, p1, v0, p2}, Lcom/google/android/libraries/places/internal/zzjr;->zzk(Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;II)V

    .line 5
    .line 6
    .line 7
    const-string p0, "FetchPlace"

    .line 8
    .line 9
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzef;->zzb(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzef;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0, p3}, Lcom/google/android/libraries/places/internal/zzga;->zzu(Lcom/google/android/libraries/places/internal/zzef;Lcom/google/android/libraries/places/internal/zzej;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->l()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/google/android/libraries/places/api/net/FetchPlaceResponse;

    .line 21
    .line 22
    return-object p0
.end method

.method public final synthetic zzm(Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;ILcom/google/android/libraries/places/internal/zzej;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/libraries/places/api/net/FetchPlaceResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzga;->zzd:Lcom/google/android/libraries/places/internal/zzjr;

    .line 2
    .line 3
    const/4 p2, 0x2

    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-interface {p0, p1, p2, v0}, Lcom/google/android/libraries/places/internal/zzjr;->zzo(Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;II)V

    .line 6
    .line 7
    .line 8
    const-string p0, "IsOpenFetchPlace"

    .line 9
    .line 10
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzef;->zzb(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzef;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0, p3}, Lcom/google/android/libraries/places/internal/zzga;->zzu(Lcom/google/android/libraries/places/internal/zzef;Lcom/google/android/libraries/places/internal/zzej;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->l()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/google/android/libraries/places/api/net/FetchPlaceResponse;

    .line 22
    .line 23
    return-object p0
.end method

.method public final synthetic zzn(Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;ILcom/google/android/libraries/places/internal/zzej;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/libraries/places/api/net/FetchPlaceResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzga;->zzd:Lcom/google/android/libraries/places/internal/zzjr;

    .line 2
    .line 3
    const/4 p2, 0x3

    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-interface {p0, p1, p2, v0}, Lcom/google/android/libraries/places/internal/zzjr;->zzo(Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;II)V

    .line 6
    .line 7
    .line 8
    const-string p0, "IsOpenGetPlace"

    .line 9
    .line 10
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzef;->zzb(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzef;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0, p3}, Lcom/google/android/libraries/places/internal/zzga;->zzu(Lcom/google/android/libraries/places/internal/zzef;Lcom/google/android/libraries/places/internal/zzej;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->l()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/google/android/libraries/places/api/net/FetchPlaceResponse;

    .line 22
    .line 23
    return-object p0
.end method

.method public final synthetic zzo(Lcom/google/android/libraries/places/api/net/FetchResolvedPhotoUriRequest;ILcom/google/android/libraries/places/internal/zzej;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/libraries/places/api/net/FetchResolvedPhotoUriResponse;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzga;->zzd:Lcom/google/android/libraries/places/internal/zzjr;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    invoke-interface {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzjr;->zzc(Lcom/google/android/libraries/places/api/net/FetchResolvedPhotoUriRequest;I)V

    .line 5
    .line 6
    .line 7
    const-string p0, "GetPhotoMedia"

    .line 8
    .line 9
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzef;->zzb(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzef;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0, p3}, Lcom/google/android/libraries/places/internal/zzga;->zzu(Lcom/google/android/libraries/places/internal/zzef;Lcom/google/android/libraries/places/internal/zzej;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->l()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/google/android/libraries/places/api/net/FetchResolvedPhotoUriResponse;

    .line 21
    .line 22
    return-object p0
.end method

.method public final synthetic zzp(Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;ILcom/google/android/libraries/places/internal/zzej;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzga;->zzd:Lcom/google/android/libraries/places/internal/zzjr;

    .line 2
    .line 3
    const/4 p2, 0x3

    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-interface {p0, p1, p2, v0}, Lcom/google/android/libraries/places/internal/zzjr;->zzm(Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;II)V

    .line 6
    .line 7
    .line 8
    const-string p0, "FindAutocompletePredictionsOnePlatform"

    .line 9
    .line 10
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzef;->zzb(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzef;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0, p3}, Lcom/google/android/libraries/places/internal/zzga;->zzu(Lcom/google/android/libraries/places/internal/zzef;Lcom/google/android/libraries/places/internal/zzej;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->l()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsResponse;

    .line 22
    .line 23
    return-object p0
.end method

.method public final synthetic zzq(Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;ILcom/google/android/libraries/places/internal/zzej;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzga;->zzd:Lcom/google/android/libraries/places/internal/zzjr;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-interface {p0, p1, v0, p2}, Lcom/google/android/libraries/places/internal/zzjr;->zzm(Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;II)V

    .line 5
    .line 6
    .line 7
    const-string p0, "FindAutocompletePredictions"

    .line 8
    .line 9
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzef;->zzb(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzef;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0, p3}, Lcom/google/android/libraries/places/internal/zzga;->zzu(Lcom/google/android/libraries/places/internal/zzef;Lcom/google/android/libraries/places/internal/zzej;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->l()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsResponse;

    .line 21
    .line 22
    return-object p0
.end method

.method public final synthetic zzr(Lcom/google/android/libraries/places/api/net/FindCurrentPlaceRequest;JILcom/google/android/libraries/places/internal/zzej;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/libraries/places/api/net/FindCurrentPlaceResponse;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p4, p0, Lcom/google/android/libraries/places/internal/zzga;->zze:Lcom/google/android/libraries/places/internal/zzdv;

    .line 2
    .line 3
    invoke-interface {p4}, Lcom/google/android/libraries/places/internal/zzdv;->zza()J

    .line 4
    .line 5
    .line 6
    move-result-wide v5

    .line 7
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzga;->zzd:Lcom/google/android/libraries/places/internal/zzjr;

    .line 8
    .line 9
    const/4 v7, 0x1

    .line 10
    move-object v1, p1

    .line 11
    move-wide v3, p2

    .line 12
    move-object v2, p6

    .line 13
    invoke-interface/range {v0 .. v7}, Lcom/google/android/libraries/places/internal/zzjr;->zze(Lcom/google/android/libraries/places/api/net/FindCurrentPlaceRequest;Lcom/google/android/gms/tasks/Task;JJI)V

    .line 14
    .line 15
    .line 16
    const-string p0, "FindCurrentPlace"

    .line 17
    .line 18
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzef;->zzb(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzef;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0, p5}, Lcom/google/android/libraries/places/internal/zzga;->zzu(Lcom/google/android/libraries/places/internal/zzef;Lcom/google/android/libraries/places/internal/zzej;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/google/android/gms/tasks/Task;->l()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/google/android/libraries/places/api/net/FindCurrentPlaceResponse;

    .line 30
    .line 31
    return-object p0
.end method

.method public final synthetic zzs(Lcom/google/android/libraries/places/api/net/SearchByTextRequest;ILcom/google/android/libraries/places/internal/zzej;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/libraries/places/api/net/SearchByTextResponse;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzga;->zzd:Lcom/google/android/libraries/places/internal/zzjr;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    invoke-interface {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzjr;->zzg(Lcom/google/android/libraries/places/api/net/SearchByTextRequest;I)V

    .line 5
    .line 6
    .line 7
    const-string p0, "SearchByText"

    .line 8
    .line 9
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzef;->zzb(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzef;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0, p3}, Lcom/google/android/libraries/places/internal/zzga;->zzu(Lcom/google/android/libraries/places/internal/zzef;Lcom/google/android/libraries/places/internal/zzej;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->l()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/google/android/libraries/places/api/net/SearchByTextResponse;

    .line 21
    .line 22
    return-object p0
.end method

.method public final synthetic zzt(Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;ILcom/google/android/libraries/places/internal/zzej;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/libraries/places/api/net/SearchNearbyResponse;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzga;->zzd:Lcom/google/android/libraries/places/internal/zzjr;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    invoke-interface {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzjr;->zzi(Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;I)V

    .line 5
    .line 6
    .line 7
    const-string p0, "SearchNearby"

    .line 8
    .line 9
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzef;->zzb(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzef;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0, p3}, Lcom/google/android/libraries/places/internal/zzga;->zzu(Lcom/google/android/libraries/places/internal/zzef;Lcom/google/android/libraries/places/internal/zzej;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->l()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/google/android/libraries/places/api/net/SearchNearbyResponse;

    .line 21
    .line 22
    return-object p0
.end method
