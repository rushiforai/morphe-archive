.class final Lcom/google/android/libraries/places/internal/zzbou;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzbdo;

.field final synthetic zzb:Lcom/google/android/libraries/places/internal/zzbfs;

.field final synthetic zzc:Lcom/google/android/libraries/places/internal/zzbcf;

.field final synthetic zzd:Lcom/google/android/libraries/places/internal/zzbpo;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbpo;Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbfs;Lcom/google/android/libraries/places/internal/zzbcf;)V
    .locals 0

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbou;->zza:Lcom/google/android/libraries/places/internal/zzbdo;

    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzbou;->zzb:Lcom/google/android/libraries/places/internal/zzbfs;

    iput-object p4, p0, Lcom/google/android/libraries/places/internal/zzbou;->zzc:Lcom/google/android/libraries/places/internal/zzbcf;

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbou;->zzd:Lcom/google/android/libraries/places/internal/zzbpo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbou;->zzd:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Lcom/google/android/libraries/places/internal/zzbpo;->zzQ(Lcom/google/android/libraries/places/internal/zzbpo;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbou;->zzd:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbpo;->zzy(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbft;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbou;->zza:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbou;->zzb:Lcom/google/android/libraries/places/internal/zzbfs;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbou;->zzc:Lcom/google/android/libraries/places/internal/zzbcf;

    .line 18
    .line 19
    invoke-interface {v0, v1, v2, p0}, Lcom/google/android/libraries/places/internal/zzbft;->zzd(Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbfs;Lcom/google/android/libraries/places/internal/zzbcf;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
