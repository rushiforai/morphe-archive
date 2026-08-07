.class public Lcom/google/android/libraries/places/internal/zzoz;
.super Lcom/google/android/libraries/places/internal/zzpb;
.source "SourceFile"


# instance fields
.field private final zza:[[C

.field private final zzb:I

.field private final zzc:C


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzpa;CC)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzpb;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzpa;->zzb()[[C

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzoz;->zza:[[C

    .line 9
    .line 10
    array-length p1, p1

    .line 11
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzoz;->zzb:I

    .line 12
    .line 13
    const p1, 0xffff

    .line 14
    .line 15
    .line 16
    iput-char p1, p0, Lcom/google/android/libraries/places/internal/zzoz;->zzc:C

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-ge v0, v1, :cond_2

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzoz;->zzb:I

    .line 16
    .line 17
    if-ge v1, v2, :cond_0

    .line 18
    .line 19
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzoz;->zza:[[C

    .line 20
    .line 21
    aget-object v2, v2, v1

    .line 22
    .line 23
    if-nez v2, :cond_1

    .line 24
    .line 25
    :cond_0
    iget-char v2, p0, Lcom/google/android/libraries/places/internal/zzoz;->zzc:C

    .line 26
    .line 27
    if-gt v1, v2, :cond_1

    .line 28
    .line 29
    add-int/lit8 v0, v0, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    invoke-virtual {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzpb;->zzc(Ljava/lang/String;I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_2
    return-object p1
.end method

.method public final zzb(C)[C
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzoz;->zzb:I

    .line 2
    .line 3
    if-ge p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzoz;->zza:[[C

    .line 6
    .line 7
    aget-object p0, p0, p1

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method
