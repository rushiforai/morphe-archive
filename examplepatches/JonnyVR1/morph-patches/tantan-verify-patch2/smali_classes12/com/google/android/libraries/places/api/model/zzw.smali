.class final Lcom/google/android/libraries/places/api/model/zzw;
.super Lcom/google/android/libraries/places/api/model/Place$Builder;
.source "SourceFile"


# instance fields
.field private zzA:Ljava/util/List;

.field private zzB:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

.field private zzC:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

.field private zzD:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

.field private zzE:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

.field private zzF:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

.field private zzG:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

.field private zzH:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

.field private zzI:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

.field private zzJ:Ljava/util/List;

.field private zzK:Ljava/lang/Integer;

.field private zzL:Ljava/lang/Integer;

.field private zzM:Lcom/google/android/gms/maps/model/LatLngBounds;

.field private zzN:Landroid/net/Uri;

.field private zzO:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

.field private zza:Ljava/lang/String;

.field private zzb:Lcom/google/android/libraries/places/api/model/AddressComponents;

.field private zzc:Ljava/util/List;

.field private zzd:Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;

.field private zze:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

.field private zzf:Lcom/google/android/libraries/places/api/model/OpeningHours;

.field private zzg:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

.field private zzh:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

.field private zzi:Ljava/lang/String;

.field private zzj:Ljava/lang/String;

.field private zzk:Ljava/lang/Integer;

.field private zzl:Ljava/lang/String;

.field private zzm:Ljava/lang/String;

.field private zzn:Lcom/google/android/gms/maps/model/LatLng;

.field private zzo:Ljava/lang/String;

.field private zzp:Ljava/lang/String;

.field private zzq:Lcom/google/android/libraries/places/api/model/OpeningHours;

.field private zzr:Ljava/lang/String;

.field private zzs:Ljava/util/List;

.field private zzt:Ljava/util/List;

.field private zzu:Ljava/util/List;

.field private zzv:Lcom/google/android/libraries/places/api/model/PlusCode;

.field private zzw:Ljava/lang/Integer;

.field private zzx:Ljava/lang/String;

.field private zzy:Ljava/lang/Double;

.field private zzz:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/libraries/places/api/model/Place$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public final getAddress()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zza:Ljava/lang/String;

    return-object p0
.end method

.method public final getAddressComponents()Lcom/google/android/libraries/places/api/model/AddressComponents;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzb:Lcom/google/android/libraries/places/api/model/AddressComponents;

    return-object p0
.end method

.method public final getAttributions()Ljava/util/List;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzc:Ljava/util/List;

    return-object p0
.end method

.method public final getBusinessStatus()Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzd:Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;

    return-object p0
.end method

.method public final getCurbsidePickup()Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zze:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Property \"curbsidePickup\" has not been set"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getCurrentOpeningHours()Lcom/google/android/libraries/places/api/model/OpeningHours;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzf:Lcom/google/android/libraries/places/api/model/OpeningHours;

    return-object p0
.end method

.method public final getDelivery()Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzg:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Property \"delivery\" has not been set"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getDineIn()Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzh:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Property \"dineIn\" has not been set"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getEditorialSummary()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzi:Ljava/lang/String;

    return-object p0
.end method

.method public final getEditorialSummaryLanguageCode()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzj:Ljava/lang/String;

    return-object p0
.end method

.method public final getIconBackgroundColor()Ljava/lang/Integer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzk:Ljava/lang/Integer;

    return-object p0
.end method

.method public final getIconUrl()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzl:Ljava/lang/String;

    return-object p0
.end method

.method public final getId()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzm:Ljava/lang/String;

    return-object p0
.end method

.method public final getLatLng()Lcom/google/android/gms/maps/model/LatLng;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzn:Lcom/google/android/gms/maps/model/LatLng;

    return-object p0
.end method

.method public final getName()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzo:Ljava/lang/String;

    return-object p0
.end method

.method public final getNameLanguageCode()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzp:Ljava/lang/String;

    return-object p0
.end method

.method public final getOpeningHours()Lcom/google/android/libraries/places/api/model/OpeningHours;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzq:Lcom/google/android/libraries/places/api/model/OpeningHours;

    return-object p0
.end method

.method public final getPhoneNumber()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzr:Ljava/lang/String;

    return-object p0
.end method

.method public final getPhotoMetadatas()Ljava/util/List;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/libraries/places/api/model/PhotoMetadata;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzs:Ljava/util/List;

    return-object p0
.end method

.method public final getPlaceTypes()Ljava/util/List;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzu:Ljava/util/List;

    return-object p0
.end method

.method public final getPlusCode()Lcom/google/android/libraries/places/api/model/PlusCode;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzv:Lcom/google/android/libraries/places/api/model/PlusCode;

    return-object p0
.end method

.method public final getPriceLevel()Ljava/lang/Integer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzw:Ljava/lang/Integer;

    return-object p0
.end method

.method public final getPrimaryType()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzx:Ljava/lang/String;

    return-object p0
.end method

.method public final getRating()Ljava/lang/Double;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzy:Ljava/lang/Double;

    return-object p0
.end method

.method public final getReservable()Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzz:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Property \"reservable\" has not been set"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getReviews()Ljava/util/List;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/libraries/places/api/model/Review;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzt:Ljava/util/List;

    return-object p0
.end method

.method public final getSecondaryOpeningHours()Ljava/util/List;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/libraries/places/api/model/OpeningHours;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzA:Ljava/util/List;

    return-object p0
.end method

.method public final getServesBeer()Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzB:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Property \"servesBeer\" has not been set"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getServesBreakfast()Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzC:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Property \"servesBreakfast\" has not been set"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getServesBrunch()Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzD:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Property \"servesBrunch\" has not been set"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getServesDinner()Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzE:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Property \"servesDinner\" has not been set"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getServesLunch()Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzF:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Property \"servesLunch\" has not been set"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getServesVegetarianFood()Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzG:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Property \"servesVegetarianFood\" has not been set"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getServesWine()Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzH:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Property \"servesWine\" has not been set"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getTakeout()Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzI:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Property \"takeout\" has not been set"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getTypes()Ljava/util/List;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/libraries/places/api/model/Place$Type;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzJ:Ljava/util/List;

    return-object p0
.end method

.method public final getUserRatingsTotal()Ljava/lang/Integer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzK:Ljava/lang/Integer;

    return-object p0
.end method

.method public final getUtcOffsetMinutes()Ljava/lang/Integer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzL:Ljava/lang/Integer;

    return-object p0
.end method

.method public final getViewport()Lcom/google/android/gms/maps/model/LatLngBounds;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzM:Lcom/google/android/gms/maps/model/LatLngBounds;

    return-object p0
.end method

.method public final getWebsiteUri()Landroid/net/Uri;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzN:Landroid/net/Uri;

    return-object p0
.end method

.method public final getWheelchairAccessibleEntrance()Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzO:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Property \"wheelchairAccessibleEntrance\" has not been set"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final setAddress(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zza:Ljava/lang/String;

    return-object p0
.end method

.method public final setAddressComponents(Lcom/google/android/libraries/places/api/model/AddressComponents;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Lcom/google/android/libraries/places/api/model/AddressComponents;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzb:Lcom/google/android/libraries/places/api/model/AddressComponents;

    return-object p0
.end method

.method public final setAttributions(Ljava/util/List;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/android/libraries/places/api/model/Place$Builder;"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzc:Ljava/util/List;

    return-object p0
.end method

.method public final setBusinessStatus(Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzd:Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;

    return-object p0
.end method

.method public final setCurbsidePickup(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zze:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Null curbsidePickup"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final setCurrentOpeningHours(Lcom/google/android/libraries/places/api/model/OpeningHours;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Lcom/google/android/libraries/places/api/model/OpeningHours;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzf:Lcom/google/android/libraries/places/api/model/OpeningHours;

    return-object p0
.end method

.method public final setDelivery(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzg:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Null delivery"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final setDineIn(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzh:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Null dineIn"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final setEditorialSummary(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzi:Ljava/lang/String;

    return-object p0
.end method

.method public final setEditorialSummaryLanguageCode(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzj:Ljava/lang/String;

    return-object p0
.end method

.method public final setIconBackgroundColor(Ljava/lang/Integer;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/lang/Integer;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzk:Ljava/lang/Integer;

    return-object p0
.end method

.method public final setIconUrl(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzl:Ljava/lang/String;

    return-object p0
.end method

.method public final setId(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzm:Ljava/lang/String;

    return-object p0
.end method

.method public final setLatLng(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Lcom/google/android/gms/maps/model/LatLng;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzn:Lcom/google/android/gms/maps/model/LatLng;

    return-object p0
.end method

.method public final setName(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzo:Ljava/lang/String;

    return-object p0
.end method

.method public final setNameLanguageCode(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzp:Ljava/lang/String;

    return-object p0
.end method

.method public final setOpeningHours(Lcom/google/android/libraries/places/api/model/OpeningHours;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Lcom/google/android/libraries/places/api/model/OpeningHours;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzq:Lcom/google/android/libraries/places/api/model/OpeningHours;

    return-object p0
.end method

.method public final setPhoneNumber(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzr:Ljava/lang/String;

    return-object p0
.end method

.method public final setPhotoMetadatas(Ljava/util/List;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/libraries/places/api/model/PhotoMetadata;",
            ">;)",
            "Lcom/google/android/libraries/places/api/model/Place$Builder;"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzs:Ljava/util/List;

    return-object p0
.end method

.method public final setPlaceTypes(Ljava/util/List;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/android/libraries/places/api/model/Place$Builder;"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzu:Ljava/util/List;

    return-object p0
.end method

.method public final setPlusCode(Lcom/google/android/libraries/places/api/model/PlusCode;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Lcom/google/android/libraries/places/api/model/PlusCode;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzv:Lcom/google/android/libraries/places/api/model/PlusCode;

    return-object p0
.end method

.method public final setPriceLevel(Ljava/lang/Integer;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/lang/Integer;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzw:Ljava/lang/Integer;

    return-object p0
.end method

.method public final setPrimaryType(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzx:Ljava/lang/String;

    return-object p0
.end method

.method public final setRating(Ljava/lang/Double;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/lang/Double;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzy:Ljava/lang/Double;

    return-object p0
.end method

.method public final setReservable(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzz:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Null reservable"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final setReviews(Ljava/util/List;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/libraries/places/api/model/Review;",
            ">;)",
            "Lcom/google/android/libraries/places/api/model/Place$Builder;"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzt:Ljava/util/List;

    return-object p0
.end method

.method public final setSecondaryOpeningHours(Ljava/util/List;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/libraries/places/api/model/OpeningHours;",
            ">;)",
            "Lcom/google/android/libraries/places/api/model/Place$Builder;"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzA:Ljava/util/List;

    return-object p0
.end method

.method public final setServesBeer(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzB:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Null servesBeer"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final setServesBreakfast(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzC:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Null servesBreakfast"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final setServesBrunch(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzD:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Null servesBrunch"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final setServesDinner(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzE:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Null servesDinner"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final setServesLunch(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzF:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Null servesLunch"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final setServesVegetarianFood(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzG:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Null servesVegetarianFood"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final setServesWine(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzH:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Null servesWine"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final setTakeout(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzI:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Null takeout"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final setTypes(Ljava/util/List;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/libraries/places/api/model/Place$Type;",
            ">;)",
            "Lcom/google/android/libraries/places/api/model/Place$Builder;"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzJ:Ljava/util/List;

    return-object p0
.end method

.method public final setUserRatingsTotal(Ljava/lang/Integer;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/lang/Integer;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzK:Ljava/lang/Integer;

    return-object p0
.end method

.method public final setUtcOffsetMinutes(Ljava/lang/Integer;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Ljava/lang/Integer;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzL:Ljava/lang/Integer;

    return-object p0
.end method

.method public final setViewport(Lcom/google/android/gms/maps/model/LatLngBounds;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Lcom/google/android/gms/maps/model/LatLngBounds;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzM:Lcom/google/android/gms/maps/model/LatLngBounds;

    return-object p0
.end method

.method public final setWebsiteUri(Landroid/net/Uri;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0
    .param p1    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzN:Landroid/net/Uri;

    return-object p0
.end method

.method public final setWheelchairAccessibleEntrance(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/google/android/libraries/places/api/model/zzw;->zzO:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Null wheelchairAccessibleEntrance"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final zza()Lcom/google/android/libraries/places/api/model/Place;
    .locals 43

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v5, v0, Lcom/google/android/libraries/places/api/model/zzw;->zze:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 4
    .line 5
    if-eqz v5, :cond_1

    .line 6
    .line 7
    iget-object v7, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzg:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 8
    .line 9
    if-eqz v7, :cond_1

    .line 10
    .line 11
    iget-object v8, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzh:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 12
    .line 13
    if-eqz v8, :cond_1

    .line 14
    .line 15
    iget-object v1, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzz:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iget-object v2, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzB:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 20
    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    iget-object v3, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzC:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 24
    .line 25
    if-eqz v3, :cond_1

    .line 26
    .line 27
    iget-object v4, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzD:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 28
    .line 29
    if-eqz v4, :cond_1

    .line 30
    .line 31
    iget-object v6, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzE:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 32
    .line 33
    if-eqz v6, :cond_1

    .line 34
    .line 35
    iget-object v9, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzF:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 36
    .line 37
    if-eqz v9, :cond_1

    .line 38
    .line 39
    iget-object v10, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzG:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 40
    .line 41
    if-eqz v10, :cond_1

    .line 42
    .line 43
    iget-object v11, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzH:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 44
    .line 45
    if-eqz v11, :cond_1

    .line 46
    .line 47
    iget-object v12, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzI:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 48
    .line 49
    if-eqz v12, :cond_1

    .line 50
    .line 51
    iget-object v13, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzO:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 52
    .line 53
    if-nez v13, :cond_0

    .line 54
    .line 55
    goto/16 :goto_0

    .line 56
    .line 57
    :cond_0
    new-instance v14, Lcom/google/android/libraries/places/api/model/zzbk;

    .line 58
    .line 59
    move-object/from16 v26, v1

    .line 60
    .line 61
    iget-object v1, v0, Lcom/google/android/libraries/places/api/model/zzw;->zza:Ljava/lang/String;

    .line 62
    .line 63
    move-object/from16 v28, v2

    .line 64
    .line 65
    iget-object v2, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzb:Lcom/google/android/libraries/places/api/model/AddressComponents;

    .line 66
    .line 67
    move-object/from16 v29, v3

    .line 68
    .line 69
    iget-object v3, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzc:Ljava/util/List;

    .line 70
    .line 71
    move-object/from16 v30, v4

    .line 72
    .line 73
    iget-object v4, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzd:Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;

    .line 74
    .line 75
    move-object/from16 v31, v6

    .line 76
    .line 77
    iget-object v6, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzf:Lcom/google/android/libraries/places/api/model/OpeningHours;

    .line 78
    .line 79
    move-object/from16 v32, v9

    .line 80
    .line 81
    iget-object v9, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzi:Ljava/lang/String;

    .line 82
    .line 83
    move-object/from16 v33, v10

    .line 84
    .line 85
    iget-object v10, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzj:Ljava/lang/String;

    .line 86
    .line 87
    move-object/from16 v34, v11

    .line 88
    .line 89
    iget-object v11, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzk:Ljava/lang/Integer;

    .line 90
    .line 91
    move-object/from16 v35, v12

    .line 92
    .line 93
    iget-object v12, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzl:Ljava/lang/String;

    .line 94
    .line 95
    move-object/from16 v41, v13

    .line 96
    .line 97
    iget-object v13, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzm:Ljava/lang/String;

    .line 98
    .line 99
    move-object v15, v14

    .line 100
    iget-object v14, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzn:Lcom/google/android/gms/maps/model/LatLng;

    .line 101
    .line 102
    move-object/from16 v16, v15

    .line 103
    .line 104
    iget-object v15, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzo:Ljava/lang/String;

    .line 105
    .line 106
    move-object/from16 v17, v1

    .line 107
    .line 108
    iget-object v1, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzp:Ljava/lang/String;

    .line 109
    .line 110
    move-object/from16 v18, v1

    .line 111
    .line 112
    iget-object v1, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzq:Lcom/google/android/libraries/places/api/model/OpeningHours;

    .line 113
    .line 114
    move-object/from16 v19, v1

    .line 115
    .line 116
    iget-object v1, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzr:Ljava/lang/String;

    .line 117
    .line 118
    move-object/from16 v20, v1

    .line 119
    .line 120
    iget-object v1, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzs:Ljava/util/List;

    .line 121
    .line 122
    move-object/from16 v21, v1

    .line 123
    .line 124
    iget-object v1, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzt:Ljava/util/List;

    .line 125
    .line 126
    move-object/from16 v22, v1

    .line 127
    .line 128
    iget-object v1, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzu:Ljava/util/List;

    .line 129
    .line 130
    move-object/from16 v23, v1

    .line 131
    .line 132
    iget-object v1, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzv:Lcom/google/android/libraries/places/api/model/PlusCode;

    .line 133
    .line 134
    move-object/from16 v24, v1

    .line 135
    .line 136
    iget-object v1, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzw:Ljava/lang/Integer;

    .line 137
    .line 138
    move-object/from16 v25, v1

    .line 139
    .line 140
    iget-object v1, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzx:Ljava/lang/String;

    .line 141
    .line 142
    move-object/from16 v27, v1

    .line 143
    .line 144
    iget-object v1, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzy:Ljava/lang/Double;

    .line 145
    .line 146
    move-object/from16 v36, v1

    .line 147
    .line 148
    iget-object v1, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzA:Ljava/util/List;

    .line 149
    .line 150
    move-object/from16 v37, v1

    .line 151
    .line 152
    iget-object v1, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzJ:Ljava/util/List;

    .line 153
    .line 154
    move-object/from16 v38, v1

    .line 155
    .line 156
    iget-object v1, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzK:Ljava/lang/Integer;

    .line 157
    .line 158
    move-object/from16 v39, v1

    .line 159
    .line 160
    iget-object v1, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzL:Ljava/lang/Integer;

    .line 161
    .line 162
    move-object/from16 v40, v1

    .line 163
    .line 164
    iget-object v1, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzM:Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 165
    .line 166
    iget-object v0, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzN:Landroid/net/Uri;

    .line 167
    .line 168
    move-object/from16 v42, v40

    .line 169
    .line 170
    move-object/from16 v40, v0

    .line 171
    .line 172
    move-object/from16 v0, v16

    .line 173
    .line 174
    move-object/from16 v16, v18

    .line 175
    .line 176
    move-object/from16 v18, v20

    .line 177
    .line 178
    move-object/from16 v20, v22

    .line 179
    .line 180
    move-object/from16 v22, v24

    .line 181
    .line 182
    move-object/from16 v24, v27

    .line 183
    .line 184
    move-object/from16 v27, v37

    .line 185
    .line 186
    move-object/from16 v37, v39

    .line 187
    .line 188
    move-object/from16 v39, v1

    .line 189
    .line 190
    move-object/from16 v1, v17

    .line 191
    .line 192
    move-object/from16 v17, v19

    .line 193
    .line 194
    move-object/from16 v19, v21

    .line 195
    .line 196
    move-object/from16 v21, v23

    .line 197
    .line 198
    move-object/from16 v23, v25

    .line 199
    .line 200
    move-object/from16 v25, v36

    .line 201
    .line 202
    move-object/from16 v36, v38

    .line 203
    .line 204
    move-object/from16 v38, v42

    .line 205
    .line 206
    invoke-direct/range {v0 .. v41}, Lcom/google/android/libraries/places/api/model/zzbk;-><init>(Ljava/lang/String;Lcom/google/android/libraries/places/api/model/AddressComponents;Ljava/util/List;Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Lcom/google/android/libraries/places/api/model/OpeningHours;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/maps/model/LatLng;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/libraries/places/api/model/OpeningHours;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lcom/google/android/libraries/places/api/model/PlusCode;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Double;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Ljava/util/List;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Integer;Lcom/google/android/gms/maps/model/LatLngBounds;Landroid/net/Uri;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)V

    .line 207
    .line 208
    .line 209
    move-object v15, v0

    .line 210
    return-object v15

    .line 211
    :cond_1
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 212
    .line 213
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 214
    .line 215
    .line 216
    iget-object v2, v0, Lcom/google/android/libraries/places/api/model/zzw;->zze:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 217
    .line 218
    if-nez v2, :cond_2

    .line 219
    .line 220
    const-string v2, " curbsidePickup"

    .line 221
    .line 222
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    :cond_2
    iget-object v2, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzg:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 226
    .line 227
    if-nez v2, :cond_3

    .line 228
    .line 229
    const-string v2, " delivery"

    .line 230
    .line 231
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    :cond_3
    iget-object v2, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzh:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 235
    .line 236
    if-nez v2, :cond_4

    .line 237
    .line 238
    const-string v2, " dineIn"

    .line 239
    .line 240
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    :cond_4
    iget-object v2, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzz:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 244
    .line 245
    if-nez v2, :cond_5

    .line 246
    .line 247
    const-string v2, " reservable"

    .line 248
    .line 249
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    :cond_5
    iget-object v2, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzB:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 253
    .line 254
    if-nez v2, :cond_6

    .line 255
    .line 256
    const-string v2, " servesBeer"

    .line 257
    .line 258
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    :cond_6
    iget-object v2, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzC:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 262
    .line 263
    if-nez v2, :cond_7

    .line 264
    .line 265
    const-string v2, " servesBreakfast"

    .line 266
    .line 267
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    :cond_7
    iget-object v2, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzD:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 271
    .line 272
    if-nez v2, :cond_8

    .line 273
    .line 274
    const-string v2, " servesBrunch"

    .line 275
    .line 276
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    :cond_8
    iget-object v2, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzE:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 280
    .line 281
    if-nez v2, :cond_9

    .line 282
    .line 283
    const-string v2, " servesDinner"

    .line 284
    .line 285
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    :cond_9
    iget-object v2, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzF:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 289
    .line 290
    if-nez v2, :cond_a

    .line 291
    .line 292
    const-string v2, " servesLunch"

    .line 293
    .line 294
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    :cond_a
    iget-object v2, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzG:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 298
    .line 299
    if-nez v2, :cond_b

    .line 300
    .line 301
    const-string v2, " servesVegetarianFood"

    .line 302
    .line 303
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    :cond_b
    iget-object v2, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzH:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 307
    .line 308
    if-nez v2, :cond_c

    .line 309
    .line 310
    const-string v2, " servesWine"

    .line 311
    .line 312
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    .line 314
    .line 315
    :cond_c
    iget-object v2, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzI:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 316
    .line 317
    if-nez v2, :cond_d

    .line 318
    .line 319
    const-string v2, " takeout"

    .line 320
    .line 321
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    :cond_d
    iget-object v0, v0, Lcom/google/android/libraries/places/api/model/zzw;->zzO:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 325
    .line 326
    if-nez v0, :cond_e

    .line 327
    .line 328
    const-string v0, " wheelchairAccessibleEntrance"

    .line 329
    .line 330
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 331
    .line 332
    .line 333
    :cond_e
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    const-string v1, "Missing required properties:"

    .line 338
    .line 339
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    const/4 v0, 0x0

    .line 347
    return-object v0
.end method
