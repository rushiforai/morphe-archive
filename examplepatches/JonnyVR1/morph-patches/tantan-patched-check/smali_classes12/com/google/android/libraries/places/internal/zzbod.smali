.class final Lcom/google/android/libraries/places/internal/zzbod;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzboe;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzboe;Lcom/google/android/libraries/places/internal/zzboc;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbod;->zza:Lcom/google/android/libraries/places/internal/zzboe;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbod;->zza:Lcom/google/android/libraries/places/internal/zzboe;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzboe;->zzd(Lcom/google/android/libraries/places/internal/zzboe;)Ljava/util/concurrent/Executor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbob;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-direct {v1, p0, v2}, Lcom/google/android/libraries/places/internal/zzbob;-><init>(Lcom/google/android/libraries/places/internal/zzboe;Lcom/google/android/libraries/places/internal/zzboa;)V

    .line 11
    .line 12
    .line 13
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbdw;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/internal/zzbdw;->zzc(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbdw;->zzb()V

    .line 19
    .line 20
    .line 21
    return-void
.end method
