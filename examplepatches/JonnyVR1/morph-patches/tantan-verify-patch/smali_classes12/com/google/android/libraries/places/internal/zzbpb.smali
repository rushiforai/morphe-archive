.class final Lcom/google/android/libraries/places/internal/zzbpb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final zza:Lcom/google/android/libraries/places/internal/zzbdo;

.field private final zzb:Lcom/google/android/libraries/places/internal/zzbfs;

.field private final zzc:Lcom/google/android/libraries/places/internal/zzbcf;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbfs;Lcom/google/android/libraries/places/internal/zzbcf;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbpb;->zza:Lcom/google/android/libraries/places/internal/zzbdo;

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbpb;->zzb:Lcom/google/android/libraries/places/internal/zzbfs;

    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzbpb;->zzc:Lcom/google/android/libraries/places/internal/zzbcf;

    return-void
.end method

.method public static bridge synthetic zza(Lcom/google/android/libraries/places/internal/zzbpb;)Lcom/google/android/libraries/places/internal/zzbcf;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbpb;->zzc:Lcom/google/android/libraries/places/internal/zzbcf;

    return-object p0
.end method

.method public static bridge synthetic zzb(Lcom/google/android/libraries/places/internal/zzbpb;)Lcom/google/android/libraries/places/internal/zzbdo;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbpb;->zza:Lcom/google/android/libraries/places/internal/zzbdo;

    return-object p0
.end method

.method public static bridge synthetic zzc(Lcom/google/android/libraries/places/internal/zzbpb;)Lcom/google/android/libraries/places/internal/zzbfs;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbpb;->zzb:Lcom/google/android/libraries/places/internal/zzbfs;

    return-object p0
.end method
