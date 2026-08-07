.class final Lcom/google/android/libraries/places/internal/zzbjq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzbkd;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbkd;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbjq;->zza:Lcom/google/android/libraries/places/internal/zzbkd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbjq;->zza:Lcom/google/android/libraries/places/internal/zzbkd;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbkd;->zza(Lcom/google/android/libraries/places/internal/zzbkd;)Lcom/google/android/libraries/places/internal/zzaym;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x2

    .line 8
    const-string v2, "Terminated"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzaym;->zza(ILjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbjq;->zza:Lcom/google/android/libraries/places/internal/zzbkd;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbkd;->zzk(Lcom/google/android/libraries/places/internal/zzbkd;)Lcom/google/android/libraries/places/internal/zzbjw;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/google/android/libraries/places/internal/zzblv;

    .line 20
    .line 21
    iget-object v1, v0, Lcom/google/android/libraries/places/internal/zzblv;->zzb:Lcom/google/android/libraries/places/internal/zzblx;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/google/android/libraries/places/internal/zzblx;->zzj:Lcom/google/android/libraries/places/internal/zzbma;

    .line 24
    .line 25
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbma;->zzH(Lcom/google/android/libraries/places/internal/zzbma;)Ljava/util/Set;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-interface {v1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    iget-object v1, v0, Lcom/google/android/libraries/places/internal/zzblv;->zzb:Lcom/google/android/libraries/places/internal/zzblx;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/google/android/libraries/places/internal/zzblx;->zzj:Lcom/google/android/libraries/places/internal/zzbma;

    .line 35
    .line 36
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbma;->zzk(Lcom/google/android/libraries/places/internal/zzbma;)Lcom/google/android/libraries/places/internal/zzbah;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1, p0}, Lcom/google/android/libraries/places/internal/zzbah;->zzh(Lcom/google/android/libraries/places/internal/zzbao;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, v0, Lcom/google/android/libraries/places/internal/zzblv;->zzb:Lcom/google/android/libraries/places/internal/zzblx;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzblx;->zzj:Lcom/google/android/libraries/places/internal/zzbma;

    .line 46
    .line 47
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbma;->zzQ(Lcom/google/android/libraries/places/internal/zzbma;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method
