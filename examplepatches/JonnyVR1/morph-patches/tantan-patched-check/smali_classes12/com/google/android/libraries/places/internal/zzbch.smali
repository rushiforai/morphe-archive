.class public final Lcom/google/android/libraries/places/internal/zzbch;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private zza:Lcom/google/android/libraries/places/internal/zzbci;

.field private zzb:Lcom/google/android/libraries/places/internal/zzbci;

.field private zzc:Lcom/google/android/libraries/places/internal/zzbcj;

.field private zzd:Ljava/lang/String;

.field private zze:Z


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    const/4 p0, 0x0

    throw p0
.end method

.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzbcg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbch;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbch;->zzd:Ljava/lang/String;

    return-object p0
.end method

.method public final zzb(Lcom/google/android/libraries/places/internal/zzbci;)Lcom/google/android/libraries/places/internal/zzbch;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbch;->zza:Lcom/google/android/libraries/places/internal/zzbci;

    return-object p0
.end method

.method public final zzc(Lcom/google/android/libraries/places/internal/zzbci;)Lcom/google/android/libraries/places/internal/zzbch;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbch;->zzb:Lcom/google/android/libraries/places/internal/zzbci;

    return-object p0
.end method

.method public final zzd(Z)Lcom/google/android/libraries/places/internal/zzbch;
    .locals 0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzbch;->zze:Z

    return-object p0
.end method

.method public final zze(Lcom/google/android/libraries/places/internal/zzbcj;)Lcom/google/android/libraries/places/internal/zzbch;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbch;->zzc:Lcom/google/android/libraries/places/internal/zzbcj;

    return-object p0
.end method

.method public final zzf()Lcom/google/android/libraries/places/internal/zzbcl;
    .locals 10

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbcl;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbch;->zzc:Lcom/google/android/libraries/places/internal/zzbcj;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbch;->zzd:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbch;->zza:Lcom/google/android/libraries/places/internal/zzbci;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbch;->zzb:Lcom/google/android/libraries/places/internal/zzbci;

    .line 10
    .line 11
    iget-boolean v8, p0, Lcom/google/android/libraries/places/internal/zzbch;->zze:Z

    .line 12
    .line 13
    const/4 v9, 0x0

    .line 14
    const/4 v5, 0x0

    .line 15
    const/4 v6, 0x0

    .line 16
    const/4 v7, 0x0

    .line 17
    invoke-direct/range {v0 .. v9}, Lcom/google/android/libraries/places/internal/zzbcl;-><init>(Lcom/google/android/libraries/places/internal/zzbcj;Ljava/lang/String;Lcom/google/android/libraries/places/internal/zzbci;Lcom/google/android/libraries/places/internal/zzbci;Ljava/lang/Object;ZZZLcom/google/android/libraries/places/internal/zzbck;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method
