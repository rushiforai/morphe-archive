.class final Lcom/google/android/libraries/places/internal/zzrn;
.super Ljava/util/AbstractMap;
.source "SourceFile"


# static fields
.field private static final zza:Ljava/util/Comparator;


# instance fields
.field private final zzb:[Ljava/lang/Object;

.field private final zzc:[I

.field private final zzd:Ljava/util/Set;

.field private zze:Ljava/lang/Integer;

.field private zzf:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/libraries/places/internal/zzrk;

    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzrk;-><init>()V

    sput-object v0, Lcom/google/android/libraries/places/internal/zzrn;->zza:Ljava/util/Comparator;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/google/android/libraries/places/internal/zzrm;

    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    invoke-direct {v0, p0, v1}, Lcom/google/android/libraries/places/internal/zzrm;-><init>(Lcom/google/android/libraries/places/internal/zzrn;I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzrn;->zzd:Ljava/util/Set;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzrn;->zze:Ljava/lang/Integer;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzrn;->zzf:Ljava/lang/String;

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_2

    .line 26
    .line 27
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    new-array v2, v1, [Ljava/lang/Object;

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-nez v3, :cond_1

    .line 42
    .line 43
    const/4 p1, 0x0

    .line 44
    filled-new-array {p1}, [I

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const/16 v3, 0x10

    .line 49
    .line 50
    if-le v1, v3, :cond_0

    .line 51
    .line 52
    mul-int/lit8 v1, v1, 0x9

    .line 53
    .line 54
    if-lez v1, :cond_0

    .line 55
    .line 56
    invoke-static {v2, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    :cond_0
    iput-object v2, p0, Lcom/google/android/libraries/places/internal/zzrn;->zzb:[Ljava/lang/Object;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzrn;->zzc:[I

    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    check-cast p0, Lcom/google/android/libraries/places/internal/zzrj;

    .line 70
    .line 71
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzrj;->zza(Lcom/google/android/libraries/places/internal/zzrj;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    throw v0

    .line 75
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    check-cast p0, Lcom/google/android/libraries/places/internal/zzrj;

    .line 80
    .line 81
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzrj;->zza(Lcom/google/android/libraries/places/internal/zzrj;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    throw v0
.end method

.method public static bridge synthetic zza()Ljava/util/Comparator;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzrn;->zza:Ljava/util/Comparator;

    return-object v0
.end method

.method public static bridge synthetic zzb(Lcom/google/android/libraries/places/internal/zzrn;)[I
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzrn;->zzc:[I

    return-object p0
.end method

.method public static bridge synthetic zzc(Lcom/google/android/libraries/places/internal/zzrn;)[Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzrn;->zzb:[Ljava/lang/Object;

    return-object p0
.end method


# virtual methods
.method public final entrySet()Ljava/util/Set;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzrn;->zzd:Ljava/util/Set;

    return-object p0
.end method

.method public final hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzrn;->zze:Ljava/lang/Integer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Ljava/util/AbstractMap;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzrn;->zze:Ljava/lang/Integer;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzrn;->zze:Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzrn;->zzf:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Ljava/util/AbstractMap;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzrn;->zzf:Ljava/lang/String;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzrn;->zzf:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method
