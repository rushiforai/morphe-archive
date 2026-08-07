.class final Lcom/google/android/libraries/places/internal/zzbjr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzbgf;

.field final synthetic zzb:Z

.field final synthetic zzc:Lcom/google/android/libraries/places/internal/zzbkd;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbkd;Lcom/google/android/libraries/places/internal/zzbgf;Z)V
    .locals 0

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbjr;->zza:Lcom/google/android/libraries/places/internal/zzbgf;

    iput-boolean p3, p0, Lcom/google/android/libraries/places/internal/zzbjr;->zzb:Z

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbjr;->zzc:Lcom/google/android/libraries/places/internal/zzbkd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbjr;->zzc:Lcom/google/android/libraries/places/internal/zzbkd;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbkd;->zzj(Lcom/google/android/libraries/places/internal/zzbkd;)Lcom/google/android/libraries/places/internal/zzbji;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbjr;->zza:Lcom/google/android/libraries/places/internal/zzbgf;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/google/android/libraries/places/internal/zzbjr;->zzb:Z

    .line 10
    .line 11
    invoke-virtual {v0, v1, p0}, Lcom/google/android/libraries/places/internal/zzbji;->zzc(Ljava/lang/Object;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
