.class final Lcom/google/android/libraries/places/internal/zzasa;
.super Lcom/google/android/libraries/places/internal/zzasc;
.source "SourceFile"


# instance fields
.field final synthetic zza:Lcom/google/android/libraries/places/internal/zzask;

.field private zzb:I

.field private final zzc:I


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzask;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzasa;->zza:Lcom/google/android/libraries/places/internal/zzask;

    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzasc;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzasa;->zzb:I

    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzask;->zzd()I

    move-result p1

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzasa;->zzc:I

    return-void
.end method


# virtual methods
.method public final hasNext()Z
    .locals 1

    iget v0, p0, Lcom/google/android/libraries/places/internal/zzasa;->zzb:I

    iget p0, p0, Lcom/google/android/libraries/places/internal/zzasa;->zzc:I

    if-ge v0, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final zza()B
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzasa;->zzb:I

    .line 2
    .line 3
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzasa;->zzc:I

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    add-int/lit8 v1, v0, 0x1

    .line 8
    .line 9
    iput v1, p0, Lcom/google/android/libraries/places/internal/zzasa;->zzb:I

    .line 10
    .line 11
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzasa;->zza:Lcom/google/android/libraries/places/internal/zzask;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzask;->zzb(I)B

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-static {}, Ll/mor;->a()V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return p0
.end method
