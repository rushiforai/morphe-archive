.class public final Lcom/google/android/libraries/places/internal/zzoh;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static zza(Ljava/util/List;Lcom/google/android/libraries/places/internal/zzmd;)Ljava/util/List;
    .locals 1

    .line 1
    instance-of v0, p0, Ljava/util/RandomAccess;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/google/android/libraries/places/internal/zzoe;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Lcom/google/android/libraries/places/internal/zzoe;-><init>(Ljava/util/List;Lcom/google/android/libraries/places/internal/zzmd;)V

    .line 8
    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    new-instance v0, Lcom/google/android/libraries/places/internal/zzog;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1}, Lcom/google/android/libraries/places/internal/zzog;-><init>(Ljava/util/List;Lcom/google/android/libraries/places/internal/zzmd;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method
