.class public final synthetic Lcom/google/android/libraries/places/internal/zzfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s26;


# instance fields
.field public final synthetic zza:Lcom/google/android/libraries/places/internal/zzga;

.field public final synthetic zzb:Lcom/google/android/libraries/places/api/net/FindCurrentPlaceRequest;

.field public final synthetic zzc:J

.field public final synthetic zzd:Lcom/google/android/libraries/places/internal/zzej;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzga;Lcom/google/android/libraries/places/api/net/FindCurrentPlaceRequest;JILcom/google/android/libraries/places/internal/zzej;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzfo;->zza:Lcom/google/android/libraries/places/internal/zzga;

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzfo;->zzb:Lcom/google/android/libraries/places/api/net/FindCurrentPlaceRequest;

    iput-wide p3, p0, Lcom/google/android/libraries/places/internal/zzfo;->zzc:J

    iput-object p6, p0, Lcom/google/android/libraries/places/internal/zzfo;->zzd:Lcom/google/android/libraries/places/internal/zzej;

    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 7

    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzfo;->zza:Lcom/google/android/libraries/places/internal/zzga;

    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzfo;->zzb:Lcom/google/android/libraries/places/api/net/FindCurrentPlaceRequest;

    iget-wide v2, p0, Lcom/google/android/libraries/places/internal/zzfo;->zzc:J

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzfo;->zzd:Lcom/google/android/libraries/places/internal/zzej;

    move-object v6, p1

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/libraries/places/internal/zzga;->zzr(Lcom/google/android/libraries/places/api/net/FindCurrentPlaceRequest;JILcom/google/android/libraries/places/internal/zzej;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/libraries/places/api/net/FindCurrentPlaceResponse;

    move-result-object p0

    return-object p0
.end method
