.class public final Lcom/google/android/libraries/places/internal/zzbcs;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private zza:Ljava/util/List;

.field private zzb:Lcom/google/android/libraries/places/internal/zzaye;

.field private zzc:Lcom/google/android/libraries/places/internal/zzbcp;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbcs;->zza:Ljava/util/List;

    .line 7
    .line 8
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaye;->zza:Lcom/google/android/libraries/places/internal/zzaye;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbcs;->zzb:Lcom/google/android/libraries/places/internal/zzaye;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final zza(Ljava/util/List;)Lcom/google/android/libraries/places/internal/zzbcs;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbcs;->zza:Ljava/util/List;

    return-object p0
.end method

.method public final zzb(Lcom/google/android/libraries/places/internal/zzaye;)Lcom/google/android/libraries/places/internal/zzbcs;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbcs;->zzb:Lcom/google/android/libraries/places/internal/zzaye;

    return-object p0
.end method

.method public final zzc(Lcom/google/android/libraries/places/internal/zzbcp;)Lcom/google/android/libraries/places/internal/zzbcs;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbcs;->zzc:Lcom/google/android/libraries/places/internal/zzbcp;

    return-object p0
.end method

.method public final zzd()Lcom/google/android/libraries/places/internal/zzbct;
    .locals 3

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbct;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbcs;->zza:Ljava/util/List;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbcs;->zzb:Lcom/google/android/libraries/places/internal/zzaye;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbcs;->zzc:Lcom/google/android/libraries/places/internal/zzbcp;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, p0}, Lcom/google/android/libraries/places/internal/zzbct;-><init>(Ljava/util/List;Lcom/google/android/libraries/places/internal/zzaye;Lcom/google/android/libraries/places/internal/zzbcp;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method
