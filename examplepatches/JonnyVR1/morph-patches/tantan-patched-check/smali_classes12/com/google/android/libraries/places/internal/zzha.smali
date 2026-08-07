.class public final synthetic Lcom/google/android/libraries/places/internal/zzha;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s26;


# instance fields
.field public final synthetic zza:Lcom/google/android/libraries/places/internal/zzhc;

.field public final synthetic zzb:Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;

.field public final synthetic zzc:J


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzhc;Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;JI)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzha;->zza:Lcom/google/android/libraries/places/internal/zzhc;

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzha;->zzb:Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;

    iput-wide p3, p0, Lcom/google/android/libraries/places/internal/zzha;->zzc:J

    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 6

    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzha;->zza:Lcom/google/android/libraries/places/internal/zzhc;

    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzha;->zzb:Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;

    iget-wide v2, p0, Lcom/google/android/libraries/places/internal/zzha;->zzc:J

    const/4 v4, 0x1

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzhc;->zzl(Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;JILcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;

    return-object v5
.end method
