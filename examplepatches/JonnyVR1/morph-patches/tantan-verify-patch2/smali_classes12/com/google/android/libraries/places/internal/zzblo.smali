.class final Lcom/google/android/libraries/places/internal/zzblo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Ljava/lang/Runnable;

.field final synthetic zzb:Lcom/google/android/libraries/places/internal/zzblq;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzblq;Ljava/lang/Runnable;)V
    .locals 0

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzblo;->zza:Ljava/lang/Runnable;

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzblo;->zzb:Lcom/google/android/libraries/places/internal/zzblq;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzblo;->zza:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/google/android/libraries/places/internal/zzblp;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzblo;->zzb:Lcom/google/android/libraries/places/internal/zzblq;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lcom/google/android/libraries/places/internal/zzblp;-><init>(Lcom/google/android/libraries/places/internal/zzblq;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzblq;->zzd:Lcom/google/android/libraries/places/internal/zzbls;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbls;->zza:Lcom/google/android/libraries/places/internal/zzbma;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbma;->zzf:Lcom/google/android/libraries/places/internal/zzbdw;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzbdw;->zzc(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbdw;->zzb()V

    .line 23
    .line 24
    .line 25
    return-void
.end method
