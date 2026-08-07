.class final Lcom/google/android/libraries/places/internal/zzbpk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzbpl;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbpl;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbpk;->zza:Lcom/google/android/libraries/places/internal/zzbpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbpk;->zza:Lcom/google/android/libraries/places/internal/zzbpl;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbpl;->zzb:Lcom/google/android/libraries/places/internal/zzbpo;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbpo;->zzac(Lcom/google/android/libraries/places/internal/zzbpo;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbpo;->zzy(Lcom/google/android/libraries/places/internal/zzbpo;)Lcom/google/android/libraries/places/internal/zzbft;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbqr;->zzg()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
