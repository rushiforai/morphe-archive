.class final Lcom/google/android/libraries/places/api/model/zzm;
.super Lcom/google/android/libraries/places/api/model/zzca;
.source "SourceFile"


# instance fields
.field private zza:I

.field private zzb:I

.field private zzc:I

.field private zzd:B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/libraries/places/api/model/zzca;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(I)Lcom/google/android/libraries/places/api/model/zzca;
    .locals 0

    iput p1, p0, Lcom/google/android/libraries/places/api/model/zzm;->zzc:I

    iget-byte p1, p0, Lcom/google/android/libraries/places/api/model/zzm;->zzd:B

    or-int/lit8 p1, p1, 0x4

    int-to-byte p1, p1

    iput-byte p1, p0, Lcom/google/android/libraries/places/api/model/zzm;->zzd:B

    return-object p0
.end method

.method public final zzb(I)Lcom/google/android/libraries/places/api/model/zzca;
    .locals 0

    iput p1, p0, Lcom/google/android/libraries/places/api/model/zzm;->zzb:I

    iget-byte p1, p0, Lcom/google/android/libraries/places/api/model/zzm;->zzd:B

    or-int/lit8 p1, p1, 0x2

    int-to-byte p1, p1

    iput-byte p1, p0, Lcom/google/android/libraries/places/api/model/zzm;->zzd:B

    return-object p0
.end method

.method public final zzc(I)Lcom/google/android/libraries/places/api/model/zzca;
    .locals 0

    iput p1, p0, Lcom/google/android/libraries/places/api/model/zzm;->zza:I

    iget-byte p1, p0, Lcom/google/android/libraries/places/api/model/zzm;->zzd:B

    or-int/lit8 p1, p1, 0x1

    int-to-byte p1, p1

    iput-byte p1, p0, Lcom/google/android/libraries/places/api/model/zzm;->zzd:B

    return-object p0
.end method

.method public final zzd()Lcom/google/android/libraries/places/api/model/LocalDate;
    .locals 3

    .line 1
    iget-byte v0, p0, Lcom/google/android/libraries/places/api/model/zzm;->zzd:B

    .line 2
    .line 3
    const/4 v1, 0x7

    .line 4
    if-eq v0, v1, :cond_3

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-byte v1, p0, Lcom/google/android/libraries/places/api/model/zzm;->zzd:B

    .line 12
    .line 13
    and-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    const-string v1, " year"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-byte v1, p0, Lcom/google/android/libraries/places/api/model/zzm;->zzd:B

    .line 23
    .line 24
    and-int/lit8 v1, v1, 0x2

    .line 25
    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    const-string v1, " month"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-byte p0, p0, Lcom/google/android/libraries/places/api/model/zzm;->zzd:B

    .line 34
    .line 35
    and-int/lit8 p0, p0, 0x4

    .line 36
    .line 37
    if-nez p0, :cond_2

    .line 38
    .line 39
    const-string p0, " day"

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string v0, "Missing required properties:"

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    const/4 p0, 0x0

    .line 58
    return-object p0

    .line 59
    :cond_3
    new-instance v0, Lcom/google/android/libraries/places/api/model/zzba;

    .line 60
    .line 61
    iget v1, p0, Lcom/google/android/libraries/places/api/model/zzm;->zza:I

    .line 62
    .line 63
    iget v2, p0, Lcom/google/android/libraries/places/api/model/zzm;->zzb:I

    .line 64
    .line 65
    iget p0, p0, Lcom/google/android/libraries/places/api/model/zzm;->zzc:I

    .line 66
    .line 67
    invoke-direct {v0, v1, v2, p0}, Lcom/google/android/libraries/places/api/model/zzba;-><init>(III)V

    .line 68
    .line 69
    .line 70
    return-object v0
.end method
