.class public final Lcom/google/android/libraries/places/internal/zzbal;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final zza:Lcom/google/android/libraries/places/internal/zzbdo;

.field private final zzb:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzbdo;Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzayp;Lcom/google/android/libraries/places/internal/zzbak;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string p3, "status"

    .line 5
    .line 6
    invoke-static {p1, p3}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbal;->zza:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbal;->zzb:Ljava/lang/Object;

    .line 12
    .line 13
    return-void
.end method

.method public static zza()Lcom/google/android/libraries/places/internal/zzbaj;
    .locals 2

    new-instance v0, Lcom/google/android/libraries/places/internal/zzbaj;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/libraries/places/internal/zzbaj;-><init>(Lcom/google/android/libraries/places/internal/zzbai;)V

    return-object v0
.end method


# virtual methods
.method public final zzb()Lcom/google/android/libraries/places/internal/zzbdo;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbal;->zza:Lcom/google/android/libraries/places/internal/zzbdo;

    return-object p0
.end method

.method public final zzc()Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbal;->zzb:Ljava/lang/Object;

    return-object p0
.end method
