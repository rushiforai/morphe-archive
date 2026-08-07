.class final Lcom/google/android/libraries/places/internal/zzbid;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Z

.field final synthetic zzb:Lcom/google/android/libraries/places/internal/zzbie;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbie;Z)V
    .locals 0

    iput-boolean p2, p0, Lcom/google/android/libraries/places/internal/zzbid;->zza:Z

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbid;->zzb:Lcom/google/android/libraries/places/internal/zzbie;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbid;->zza:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbid;->zzb:Lcom/google/android/libraries/places/internal/zzbie;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbie;->zza:Lcom/google/android/libraries/places/internal/zzbih;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput-boolean v1, v0, Lcom/google/android/libraries/places/internal/zzbih;->zzf:Z

    .line 11
    .line 12
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbih;->zze(Lcom/google/android/libraries/places/internal/zzbih;)J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    const-wide/16 v3, 0x0

    .line 17
    .line 18
    cmp-long v1, v1, v3

    .line 19
    .line 20
    if-lez v1, :cond_0

    .line 21
    .line 22
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbih;->zzf(Lcom/google/android/libraries/places/internal/zzbih;)Lcom/google/android/libraries/places/internal/zzna;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzna;->zzc()Lcom/google/android/libraries/places/internal/zzna;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzna;->zzd()Lcom/google/android/libraries/places/internal/zzna;

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbid;->zzb:Lcom/google/android/libraries/places/internal/zzbie;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbie;->zza:Lcom/google/android/libraries/places/internal/zzbih;

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-static {p0, v0}, Lcom/google/android/libraries/places/internal/zzbih;->zzl(Lcom/google/android/libraries/places/internal/zzbih;Z)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
