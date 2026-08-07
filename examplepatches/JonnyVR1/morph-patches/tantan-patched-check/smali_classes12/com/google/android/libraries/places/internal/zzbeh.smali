.class final Lcom/google/android/libraries/places/internal/zzbeh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzbvq;

.field final synthetic zzb:Lcom/google/android/libraries/places/internal/zzbei;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbei;Lcom/google/android/libraries/places/internal/zzbvq;I)V
    .locals 0

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbeh;->zza:Lcom/google/android/libraries/places/internal/zzbvq;

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbeh;->zzb:Lcom/google/android/libraries/places/internal/zzbei;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    :try_start_0
    sget v0, Lcom/google/android/libraries/places/internal/zzbvr;->zza:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 2
    .line 3
    :try_start_1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbeh;->zzb:Lcom/google/android/libraries/places/internal/zzbei;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbei;->zzl(Lcom/google/android/libraries/places/internal/zzbei;)Lcom/google/android/libraries/places/internal/zzbgj;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x2

    .line 10
    invoke-interface {v0, v1}, Lcom/google/android/libraries/places/internal/zzbgj;->zzc(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    :try_start_2
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 16
    :catchall_1
    move-exception v0

    .line 17
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbeh;->zzb:Lcom/google/android/libraries/places/internal/zzbei;

    .line 18
    .line 19
    invoke-interface {p0, v0}, Lcom/google/android/libraries/places/internal/zzbmm;->zzF(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
