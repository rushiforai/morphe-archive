.class public final Lcom/google/android/libraries/places/internal/zzrp;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final zza:Ljava/util/Comparator;

.field private static final zzb:Ljava/util/Comparator;

.field private static final zzc:Lcom/google/android/libraries/places/internal/zzrp;


# instance fields
.field private final zzd:Lcom/google/android/libraries/places/internal/zzrn;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzrh;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzrh;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzrp;->zza:Ljava/util/Comparator;

    .line 7
    .line 8
    new-instance v0, Lcom/google/android/libraries/places/internal/zzri;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzri;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/google/android/libraries/places/internal/zzrp;->zzb:Ljava/util/Comparator;

    .line 14
    .line 15
    new-instance v0, Lcom/google/android/libraries/places/internal/zzrp;

    .line 16
    .line 17
    new-instance v1, Lcom/google/android/libraries/places/internal/zzrn;

    .line 18
    .line 19
    sget-object v2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 20
    .line 21
    invoke-direct {v1, v2}, Lcom/google/android/libraries/places/internal/zzrn;-><init>(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {v0, v1}, Lcom/google/android/libraries/places/internal/zzrp;-><init>(Lcom/google/android/libraries/places/internal/zzrn;)V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/google/android/libraries/places/internal/zzrp;->zzc:Lcom/google/android/libraries/places/internal/zzrp;

    .line 28
    .line 29
    return-void
.end method

.method private constructor <init>(Lcom/google/android/libraries/places/internal/zzrn;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzrp;->zzd:Lcom/google/android/libraries/places/internal/zzrn;

    return-void
.end method

.method public static zza()Lcom/google/android/libraries/places/internal/zzrp;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzrp;->zzc:Lcom/google/android/libraries/places/internal/zzrp;

    return-object v0
.end method

.method public static bridge synthetic zzb()Ljava/util/Comparator;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzrp;->zza:Ljava/util/Comparator;

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/google/android/libraries/places/internal/zzrp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/google/android/libraries/places/internal/zzrp;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/google/android/libraries/places/internal/zzrp;->zzd:Lcom/google/android/libraries/places/internal/zzrn;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzrp;->zzd:Lcom/google/android/libraries/places/internal/zzrn;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzrp;->zzd:Lcom/google/android/libraries/places/internal/zzrn;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzrn;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    not-int p0, p0

    .line 8
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzrp;->zzd:Lcom/google/android/libraries/places/internal/zzrn;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzrn;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
