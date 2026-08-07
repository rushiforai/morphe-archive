.class final Lcom/google/android/libraries/places/internal/zzbhj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzazc;

.field final synthetic zzb:Lcom/google/android/libraries/places/internal/zzbhy;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbhy;Lcom/google/android/libraries/places/internal/zzazc;)V
    .locals 0

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbhj;->zza:Lcom/google/android/libraries/places/internal/zzazc;

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbhj;->zzb:Lcom/google/android/libraries/places/internal/zzbhy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbhj;->zzb:Lcom/google/android/libraries/places/internal/zzbhy;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbhy;->zzd(Lcom/google/android/libraries/places/internal/zzbhy;)Lcom/google/android/libraries/places/internal/zzbfr;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbhj;->zza:Lcom/google/android/libraries/places/internal/zzazc;

    .line 8
    .line 9
    invoke-interface {v0, p0}, Lcom/google/android/libraries/places/internal/zzbqp;->zzv(Lcom/google/android/libraries/places/internal/zzazc;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
