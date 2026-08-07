.class final Lcom/google/android/libraries/places/internal/zzkn;
.super Lcom/google/android/libraries/places/internal/zzku;
.source "SourceFile"


# instance fields
.field private zza:Ljava/lang/String;

.field private zzb:Lcom/google/android/libraries/places/internal/zznx;

.field private zzc:Lcom/google/android/libraries/places/api/model/Place;

.field private zzd:Lcom/google/android/libraries/places/api/model/AutocompletePrediction;

.field private zze:Lcom/google/android/gms/common/api/Status;

.field private zzf:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzku;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/libraries/places/api/model/Place;)Lcom/google/android/libraries/places/internal/zzku;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzkn;->zzc:Lcom/google/android/libraries/places/api/model/Place;

    return-object p0
.end method

.method public final zzb(Lcom/google/android/libraries/places/api/model/AutocompletePrediction;)Lcom/google/android/libraries/places/internal/zzku;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzkn;->zzd:Lcom/google/android/libraries/places/api/model/AutocompletePrediction;

    return-object p0
.end method

.method public final zzc(Ljava/util/List;)Lcom/google/android/libraries/places/internal/zzku;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zznx;->zzj(Ljava/util/Collection;)Lcom/google/android/libraries/places/internal/zznx;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzkn;->zzb:Lcom/google/android/libraries/places/internal/zznx;

    .line 6
    .line 7
    return-object p0
.end method

.method public final zzd(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzku;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzkn;->zza:Ljava/lang/String;

    return-object p0
.end method

.method public final zze(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/libraries/places/internal/zzku;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzkn;->zze:Lcom/google/android/gms/common/api/Status;

    return-object p0
.end method

.method public final zzf()Lcom/google/android/libraries/places/internal/zzkv;
    .locals 8

    .line 1
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzkn;->zzf:I

    .line 2
    .line 3
    if-eqz v1, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/google/android/libraries/places/internal/zzkp;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzkn;->zza:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzkn;->zzb:Lcom/google/android/libraries/places/internal/zznx;

    .line 10
    .line 11
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzkn;->zzc:Lcom/google/android/libraries/places/api/model/Place;

    .line 12
    .line 13
    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzkn;->zzd:Lcom/google/android/libraries/places/api/model/AutocompletePrediction;

    .line 14
    .line 15
    iget-object v6, p0, Lcom/google/android/libraries/places/internal/zzkn;->zze:Lcom/google/android/gms/common/api/Status;

    .line 16
    .line 17
    const/4 v7, 0x0

    .line 18
    invoke-direct/range {v0 .. v7}, Lcom/google/android/libraries/places/internal/zzkp;-><init>(ILjava/lang/String;Lcom/google/android/libraries/places/internal/zznx;Lcom/google/android/libraries/places/api/model/Place;Lcom/google/android/libraries/places/api/model/AutocompletePrediction;Lcom/google/android/gms/common/api/Status;Lcom/google/android/libraries/places/internal/zzko;)V

    .line 19
    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_0
    const-string p0, "Missing required properties: type"

    .line 23
    .line 24
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public final zzg(I)Lcom/google/android/libraries/places/internal/zzku;
    .locals 0

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzkn;->zzf:I

    return-object p0
.end method
