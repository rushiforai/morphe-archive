.class public final Lcom/google/android/libraries/places/internal/zzbaj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private zza:Ljava/lang/Object;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    const/4 p0, 0x0

    throw p0
.end method

.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzbai;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzbaj;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbaj;->zza:Ljava/lang/Object;

    return-object p0
.end method

.method public final zzb()Lcom/google/android/libraries/places/internal/zzbal;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbaj;->zza:Ljava/lang/Object;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    const-string v1, "config is not set"

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbal;

    .line 14
    .line 15
    sget-object v1, Lcom/google/android/libraries/places/internal/zzbdo;->zza:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbaj;->zza:Ljava/lang/Object;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-direct {v0, v1, p0, v2, v2}, Lcom/google/android/libraries/places/internal/zzbal;-><init>(Lcom/google/android/libraries/places/internal/zzbdo;Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzayp;Lcom/google/android/libraries/places/internal/zzbak;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method
