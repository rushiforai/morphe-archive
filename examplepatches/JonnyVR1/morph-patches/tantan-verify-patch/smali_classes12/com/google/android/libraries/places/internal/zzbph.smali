.class final Lcom/google/android/libraries/places/internal/zzbph;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzbpl;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbpl;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbph;->zza:Lcom/google/android/libraries/places/internal/zzbpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbph;->zza:Lcom/google/android/libraries/places/internal/zzbpl;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Lcom/google/android/libraries/places/internal/zzbpo;->zzQ(Lcom/google/android/libraries/places/internal/zzbpo;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbph;->zza:Lcom/google/android/libraries/places/internal/zzbpl;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbpo;->zzy(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbft;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbpo;->zzC(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpb;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbpb;->zzb(Lcom/google/android/libraries/places/internal/zzbpb;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbph;->zza:Lcom/google/android/libraries/places/internal/zzbpl;

    .line 26
    .line 27
    iget-object v2, v2, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 28
    .line 29
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzbpo;->zzC(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpb;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzbpb;->zzc(Lcom/google/android/libraries/places/internal/zzbpb;)Lcom/google/android/libraries/places/internal/zzbfs;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbph;->zza:Lcom/google/android/libraries/places/internal/zzbpl;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 40
    .line 41
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbpo;->zzC(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbpb;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbpb;->zza(Lcom/google/android/libraries/places/internal/zzbpb;)Lcom/google/android/libraries/places/internal/zzbcf;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-interface {v1, v0, v2, p0}, Lcom/google/android/libraries/places/internal/zzbft;->zzd(Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbfs;Lcom/google/android/libraries/places/internal/zzbcf;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method
