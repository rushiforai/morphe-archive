.class public final synthetic Lcom/google/android/libraries/places/internal/zzfs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s26;


# instance fields
.field public final synthetic zza:Lcom/google/android/libraries/places/internal/zzga;

.field public final synthetic zzb:Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;

.field public final synthetic zzc:Lcom/google/android/libraries/places/internal/zzej;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzga;Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;ILcom/google/android/libraries/places/internal/zzej;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzfs;->zza:Lcom/google/android/libraries/places/internal/zzga;

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzfs;->zzb:Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;

    iput-object p4, p0, Lcom/google/android/libraries/places/internal/zzfs;->zzc:Lcom/google/android/libraries/places/internal/zzej;

    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 3

    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzfs;->zza:Lcom/google/android/libraries/places/internal/zzga;

    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzfs;->zzb:Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;

    const/4 v2, 0x1

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzfs;->zzc:Lcom/google/android/libraries/places/internal/zzej;

    invoke-virtual {v0, v1, v2, p0, p1}, Lcom/google/android/libraries/places/internal/zzga;->zzt(Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;ILcom/google/android/libraries/places/internal/zzej;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/libraries/places/api/net/SearchNearbyResponse;

    move-result-object p0

    return-object p0
.end method
