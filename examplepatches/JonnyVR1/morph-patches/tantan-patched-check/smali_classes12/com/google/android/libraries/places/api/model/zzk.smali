.class abstract Lcom/google/android/libraries/places/api/model/zzk;
.super Lcom/google/android/libraries/places/api/model/AutocompleteSessionToken;
.source "SourceFile"


# instance fields
.field private final zza:Landroid/os/ParcelUuid;


# direct methods
.method public constructor <init>(Landroid/os/ParcelUuid;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/api/model/AutocompleteSessionToken;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzk;->zza:Landroid/os/ParcelUuid;

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "Null UUID"

    .line 10
    .line 11
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    throw p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p1, Lcom/google/android/libraries/places/api/model/AutocompleteSessionToken;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    check-cast p1, Lcom/google/android/libraries/places/api/model/AutocompleteSessionToken;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzk;->zza:Landroid/os/ParcelUuid;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/model/AutocompleteSessionToken;->zza()Landroid/os/ParcelUuid;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Landroid/os/ParcelUuid;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_1
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public final hashCode()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzk;->zza:Landroid/os/ParcelUuid;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/os/ParcelUuid;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const v0, 0xf4243

    .line 8
    .line 9
    .line 10
    xor-int/2addr p0, v0

    .line 11
    return p0
.end method

.method public final zza()Landroid/os/ParcelUuid;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzk;->zza:Landroid/os/ParcelUuid;

    return-object p0
.end method
