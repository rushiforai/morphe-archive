.class final Lcom/google/android/libraries/places/api/model/zzi;
.super Lcom/google/android/libraries/places/api/model/zzbx;
.source "SourceFile"


# instance fields
.field private zza:I

.field private zzb:I

.field private zzc:B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/libraries/places/api/model/zzbx;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(I)Lcom/google/android/libraries/places/api/model/zzbx;
    .locals 0

    iput p1, p0, Lcom/google/android/libraries/places/api/model/zzi;->zzb:I

    iget-byte p1, p0, Lcom/google/android/libraries/places/api/model/zzi;->zzc:B

    or-int/lit8 p1, p1, 0x2

    int-to-byte p1, p1

    iput-byte p1, p0, Lcom/google/android/libraries/places/api/model/zzi;->zzc:B

    return-object p0
.end method

.method public final zzb(I)Lcom/google/android/libraries/places/api/model/zzbx;
    .locals 0

    iput p1, p0, Lcom/google/android/libraries/places/api/model/zzi;->zza:I

    iget-byte p1, p0, Lcom/google/android/libraries/places/api/model/zzi;->zzc:B

    or-int/lit8 p1, p1, 0x1

    int-to-byte p1, p1

    iput-byte p1, p0, Lcom/google/android/libraries/places/api/model/zzi;->zzc:B

    return-object p0
.end method

.method public final zzc()Lcom/google/android/libraries/places/api/model/zzby;
    .locals 2

    .line 1
    iget-byte v0, p0, Lcom/google/android/libraries/places/api/model/zzi;->zzc:B

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-eq v0, v1, :cond_2

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-byte v1, p0, Lcom/google/android/libraries/places/api/model/zzi;->zzc:B

    .line 12
    .line 13
    and-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    const-string v1, " offset"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-byte p0, p0, Lcom/google/android/libraries/places/api/model/zzi;->zzc:B

    .line 23
    .line 24
    and-int/lit8 p0, p0, 0x2

    .line 25
    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    const-string p0, " length"

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v0, "Missing required properties:"

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const/4 p0, 0x0

    .line 47
    return-object p0

    .line 48
    :cond_2
    new-instance v0, Lcom/google/android/libraries/places/api/model/zzau;

    .line 49
    .line 50
    iget v1, p0, Lcom/google/android/libraries/places/api/model/zzi;->zza:I

    .line 51
    .line 52
    iget p0, p0, Lcom/google/android/libraries/places/api/model/zzi;->zzb:I

    .line 53
    .line 54
    invoke-direct {v0, v1, p0}, Lcom/google/android/libraries/places/api/model/zzau;-><init>(II)V

    .line 55
    .line 56
    .line 57
    return-object v0
.end method
