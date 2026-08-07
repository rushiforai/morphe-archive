.class final Lcom/google/android/libraries/places/internal/zzbgl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Ljava/lang/StringBuilder;

.field final synthetic zzb:Lcom/google/android/libraries/places/internal/zzbgz;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbgz;Ljava/lang/StringBuilder;)V
    .locals 0

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbgl;->zza:Ljava/lang/StringBuilder;

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbgl;->zzb:Lcom/google/android/libraries/places/internal/zzbgz;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbgl;->zza:Ljava/lang/StringBuilder;

    .line 2
    .line 3
    sget-object v1, Lcom/google/android/libraries/places/internal/zzbdo;->zze:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbgl;->zzb:Lcom/google/android/libraries/places/internal/zzbgz;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-static {p0, v0, v1}, Lcom/google/android/libraries/places/internal/zzbgz;->zzi(Lcom/google/android/libraries/places/internal/zzbgz;Lcom/google/android/libraries/places/internal/zzbdo;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
