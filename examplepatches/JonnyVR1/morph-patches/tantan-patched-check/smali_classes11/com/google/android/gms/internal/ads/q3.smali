.class public final Lcom/google/android/gms/internal/ads/q3;
.super Lcom/google/android/gms/internal/ads/o3;
.source "SourceFile"


# instance fields
.field public p:Lcom/google/android/gms/internal/ads/zzgdz;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ads/zzfzv;ZLjava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/internal/ads/o3;-><init>(Lcom/google/android/gms/internal/ads/zzfzv;ZZ)V

    .line 3
    .line 4
    .line 5
    new-instance p1, Lcom/google/android/gms/internal/ads/zzgdy;

    .line 6
    .line 7
    invoke-direct {p1, p0, p4, p3}, Lcom/google/android/gms/internal/ads/zzgdy;-><init>(Lcom/google/android/gms/internal/ads/q3;Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/q3;->p:Lcom/google/android/gms/internal/ads/zzgdz;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/o3;->R()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static bridge synthetic V(Lcom/google/android/gms/internal/ads/q3;Lcom/google/android/gms/internal/ads/zzgdz;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/internal/ads/q3;->p:Lcom/google/android/gms/internal/ads/zzgdz;

    return-void
.end method


# virtual methods
.method public final P(ILjava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final Q()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/q3;->p:Lcom/google/android/gms/internal/ads/zzgdz;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/zzgdz;->zzf()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final U(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/gms/internal/ads/o3;->U(I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/q3;->p:Lcom/google/android/gms/internal/ads/zzgdz;

    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final s()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/q3;->p:Lcom/google/android/gms/internal/ads/zzgdz;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/zzgew;->zzh()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
