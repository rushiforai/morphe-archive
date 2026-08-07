.class public final Lcom/google/android/libraries/places/internal/zzbdv;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final zza:Lcom/google/android/libraries/places/internal/zzbdt;

.field private final zzb:Ljava/util/concurrent/ScheduledFuture;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzbdt;Ljava/util/concurrent/ScheduledFuture;Lcom/google/android/libraries/places/internal/zzbdu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbdv;->zza:Lcom/google/android/libraries/places/internal/zzbdt;

    .line 5
    .line 6
    const-string p1, "future"

    .line 7
    .line 8
    invoke-static {p2, p1}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbdv;->zzb:Ljava/util/concurrent/ScheduledFuture;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final zza()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbdv;->zza:Lcom/google/android/libraries/places/internal/zzbdt;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, Lcom/google/android/libraries/places/internal/zzbdt;->zzb:Z

    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbdv;->zzb:Ljava/util/concurrent/ScheduledFuture;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-interface {p0, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final zzb()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbdv;->zza:Lcom/google/android/libraries/places/internal/zzbdt;

    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbdt;->zzc:Z

    if-nez v0, :cond_0

    iget-boolean p0, p0, Lcom/google/android/libraries/places/internal/zzbdt;->zzb:Z

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
