.class final Lcom/google/android/libraries/places/internal/zzbsn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzbra;


# instance fields
.field private final zza:Lcom/google/android/libraries/places/internal/zzbwb;

.field private zzb:I

.field private zzc:I


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbwb;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbsn;->zza:Lcom/google/android/libraries/places/internal/zzbwb;

    iput p2, p0, Lcom/google/android/libraries/places/internal/zzbsn;->zzb:I

    return-void
.end method


# virtual methods
.method public final zza()I
    .locals 0

    iget p0, p0, Lcom/google/android/libraries/places/internal/zzbsn;->zzc:I

    return p0
.end method

.method public final zzb()I
    .locals 0

    iget p0, p0, Lcom/google/android/libraries/places/internal/zzbsn;->zzb:I

    return p0
.end method

.method public final zzc(B)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbsn;->zza:Lcom/google/android/libraries/places/internal/zzbwb;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzbwb;->zzm(I)Lcom/google/android/libraries/places/internal/zzbwb;

    .line 4
    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzbsn;->zzb:I

    .line 7
    .line 8
    add-int/lit8 p1, p1, -0x1

    .line 9
    .line 10
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbsn;->zzb:I

    .line 11
    .line 12
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzbsn;->zzc:I

    .line 13
    .line 14
    add-int/lit8 p1, p1, 0x1

    .line 15
    .line 16
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbsn;->zzc:I

    .line 17
    .line 18
    return-void
.end method

.method public final zzd([BII)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbsn;->zza:Lcom/google/android/libraries/places/internal/zzbwb;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/libraries/places/internal/zzbwb;->zzl([BII)Lcom/google/android/libraries/places/internal/zzbwb;

    .line 4
    .line 5
    .line 6
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzbsn;->zzb:I

    .line 7
    .line 8
    sub-int/2addr p1, p3

    .line 9
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbsn;->zzb:I

    .line 10
    .line 11
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzbsn;->zzc:I

    .line 12
    .line 13
    add-int/2addr p1, p3

    .line 14
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbsn;->zzc:I

    .line 15
    .line 16
    return-void
.end method

.method public final zze()Lcom/google/android/libraries/places/internal/zzbwb;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbsn;->zza:Lcom/google/android/libraries/places/internal/zzbwb;

    return-object p0
.end method
