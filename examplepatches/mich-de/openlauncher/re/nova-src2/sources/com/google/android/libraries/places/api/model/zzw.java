package com.google.android.libraries.places.api.model;

import android.net.Uri;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.libraries.places.api.model.Place;
import java.util.List;

/* loaded from: classes3.dex */
final class zzw extends Place.Builder {
    private List zzA;
    private Place.BooleanPlaceAttributeValue zzB;
    private Place.BooleanPlaceAttributeValue zzC;
    private Place.BooleanPlaceAttributeValue zzD;
    private Place.BooleanPlaceAttributeValue zzE;
    private Place.BooleanPlaceAttributeValue zzF;
    private Place.BooleanPlaceAttributeValue zzG;
    private Place.BooleanPlaceAttributeValue zzH;
    private Place.BooleanPlaceAttributeValue zzI;
    private List zzJ;
    private Integer zzK;
    private Integer zzL;
    private LatLngBounds zzM;
    private Uri zzN;
    private Place.BooleanPlaceAttributeValue zzO;
    private String zza;
    private AddressComponents zzb;
    private List zzc;
    private Place.BusinessStatus zzd;
    private Place.BooleanPlaceAttributeValue zze;
    private OpeningHours zzf;
    private Place.BooleanPlaceAttributeValue zzg;
    private Place.BooleanPlaceAttributeValue zzh;
    private String zzi;
    private String zzj;
    private Integer zzk;
    private String zzl;
    private String zzm;
    private LatLng zzn;
    private String zzo;
    private String zzp;
    private OpeningHours zzq;
    private String zzr;
    private List zzs;
    private List zzt;
    private List zzu;
    private PlusCode zzv;
    private Integer zzw;
    private String zzx;
    private Double zzy;
    private Place.BooleanPlaceAttributeValue zzz;

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final String getAddress() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final AddressComponents getAddressComponents() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final List<String> getAttributions() {
        return this.zzc;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.BusinessStatus getBusinessStatus() {
        return this.zzd;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.BooleanPlaceAttributeValue getCurbsidePickup() {
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue = this.zze;
        if (booleanPlaceAttributeValue != null) {
            return booleanPlaceAttributeValue;
        }
        throw new IllegalStateException("Property \"curbsidePickup\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final OpeningHours getCurrentOpeningHours() {
        return this.zzf;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.BooleanPlaceAttributeValue getDelivery() {
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue = this.zzg;
        if (booleanPlaceAttributeValue != null) {
            return booleanPlaceAttributeValue;
        }
        throw new IllegalStateException("Property \"delivery\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.BooleanPlaceAttributeValue getDineIn() {
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue = this.zzh;
        if (booleanPlaceAttributeValue != null) {
            return booleanPlaceAttributeValue;
        }
        throw new IllegalStateException("Property \"dineIn\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final String getEditorialSummary() {
        return this.zzi;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final String getEditorialSummaryLanguageCode() {
        return this.zzj;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Integer getIconBackgroundColor() {
        return this.zzk;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final String getIconUrl() {
        return this.zzl;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final String getId() {
        return this.zzm;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final LatLng getLatLng() {
        return this.zzn;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final String getName() {
        return this.zzo;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final String getNameLanguageCode() {
        return this.zzp;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final OpeningHours getOpeningHours() {
        return this.zzq;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final String getPhoneNumber() {
        return this.zzr;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final List<PhotoMetadata> getPhotoMetadatas() {
        return this.zzs;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final List<String> getPlaceTypes() {
        return this.zzu;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final PlusCode getPlusCode() {
        return this.zzv;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Integer getPriceLevel() {
        return this.zzw;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final String getPrimaryType() {
        return this.zzx;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Double getRating() {
        return this.zzy;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.BooleanPlaceAttributeValue getReservable() {
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue = this.zzz;
        if (booleanPlaceAttributeValue != null) {
            return booleanPlaceAttributeValue;
        }
        throw new IllegalStateException("Property \"reservable\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final List<Review> getReviews() {
        return this.zzt;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final List<OpeningHours> getSecondaryOpeningHours() {
        return this.zzA;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.BooleanPlaceAttributeValue getServesBeer() {
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue = this.zzB;
        if (booleanPlaceAttributeValue != null) {
            return booleanPlaceAttributeValue;
        }
        throw new IllegalStateException("Property \"servesBeer\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.BooleanPlaceAttributeValue getServesBreakfast() {
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue = this.zzC;
        if (booleanPlaceAttributeValue != null) {
            return booleanPlaceAttributeValue;
        }
        throw new IllegalStateException("Property \"servesBreakfast\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.BooleanPlaceAttributeValue getServesBrunch() {
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue = this.zzD;
        if (booleanPlaceAttributeValue != null) {
            return booleanPlaceAttributeValue;
        }
        throw new IllegalStateException("Property \"servesBrunch\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.BooleanPlaceAttributeValue getServesDinner() {
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue = this.zzE;
        if (booleanPlaceAttributeValue != null) {
            return booleanPlaceAttributeValue;
        }
        throw new IllegalStateException("Property \"servesDinner\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.BooleanPlaceAttributeValue getServesLunch() {
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue = this.zzF;
        if (booleanPlaceAttributeValue != null) {
            return booleanPlaceAttributeValue;
        }
        throw new IllegalStateException("Property \"servesLunch\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.BooleanPlaceAttributeValue getServesVegetarianFood() {
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue = this.zzG;
        if (booleanPlaceAttributeValue != null) {
            return booleanPlaceAttributeValue;
        }
        throw new IllegalStateException("Property \"servesVegetarianFood\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.BooleanPlaceAttributeValue getServesWine() {
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue = this.zzH;
        if (booleanPlaceAttributeValue != null) {
            return booleanPlaceAttributeValue;
        }
        throw new IllegalStateException("Property \"servesWine\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.BooleanPlaceAttributeValue getTakeout() {
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue = this.zzI;
        if (booleanPlaceAttributeValue != null) {
            return booleanPlaceAttributeValue;
        }
        throw new IllegalStateException("Property \"takeout\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final List<Place.Type> getTypes() {
        return this.zzJ;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Integer getUserRatingsTotal() {
        return this.zzK;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Integer getUtcOffsetMinutes() {
        return this.zzL;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final LatLngBounds getViewport() {
        return this.zzM;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Uri getWebsiteUri() {
        return this.zzN;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.BooleanPlaceAttributeValue getWheelchairAccessibleEntrance() {
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue = this.zzO;
        if (booleanPlaceAttributeValue != null) {
            return booleanPlaceAttributeValue;
        }
        throw new IllegalStateException("Property \"wheelchairAccessibleEntrance\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setAddress(String str) {
        this.zza = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setAddressComponents(AddressComponents addressComponents) {
        this.zzb = addressComponents;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setAttributions(List<String> list) {
        this.zzc = list;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setBusinessStatus(Place.BusinessStatus businessStatus) {
        this.zzd = businessStatus;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setCurbsidePickup(Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue) {
        if (booleanPlaceAttributeValue == null) {
            throw new NullPointerException("Null curbsidePickup");
        }
        this.zze = booleanPlaceAttributeValue;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setCurrentOpeningHours(OpeningHours openingHours) {
        this.zzf = openingHours;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setDelivery(Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue) {
        if (booleanPlaceAttributeValue == null) {
            throw new NullPointerException("Null delivery");
        }
        this.zzg = booleanPlaceAttributeValue;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setDineIn(Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue) {
        if (booleanPlaceAttributeValue == null) {
            throw new NullPointerException("Null dineIn");
        }
        this.zzh = booleanPlaceAttributeValue;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setEditorialSummary(String str) {
        this.zzi = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setEditorialSummaryLanguageCode(String str) {
        this.zzj = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setIconBackgroundColor(Integer num) {
        this.zzk = num;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setIconUrl(String str) {
        this.zzl = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setId(String str) {
        this.zzm = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setLatLng(LatLng latLng) {
        this.zzn = latLng;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setName(String str) {
        this.zzo = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setNameLanguageCode(String str) {
        this.zzp = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setOpeningHours(OpeningHours openingHours) {
        this.zzq = openingHours;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setPhoneNumber(String str) {
        this.zzr = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setPhotoMetadatas(List<PhotoMetadata> list) {
        this.zzs = list;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setPlaceTypes(List<String> list) {
        this.zzu = list;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setPlusCode(PlusCode plusCode) {
        this.zzv = plusCode;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setPriceLevel(Integer num) {
        this.zzw = num;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setPrimaryType(String str) {
        this.zzx = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setRating(Double d5) {
        this.zzy = d5;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setReservable(Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue) {
        if (booleanPlaceAttributeValue == null) {
            throw new NullPointerException("Null reservable");
        }
        this.zzz = booleanPlaceAttributeValue;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setReviews(List<Review> list) {
        this.zzt = list;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setSecondaryOpeningHours(List<OpeningHours> list) {
        this.zzA = list;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setServesBeer(Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue) {
        if (booleanPlaceAttributeValue == null) {
            throw new NullPointerException("Null servesBeer");
        }
        this.zzB = booleanPlaceAttributeValue;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setServesBreakfast(Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue) {
        if (booleanPlaceAttributeValue == null) {
            throw new NullPointerException("Null servesBreakfast");
        }
        this.zzC = booleanPlaceAttributeValue;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setServesBrunch(Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue) {
        if (booleanPlaceAttributeValue == null) {
            throw new NullPointerException("Null servesBrunch");
        }
        this.zzD = booleanPlaceAttributeValue;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setServesDinner(Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue) {
        if (booleanPlaceAttributeValue == null) {
            throw new NullPointerException("Null servesDinner");
        }
        this.zzE = booleanPlaceAttributeValue;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setServesLunch(Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue) {
        if (booleanPlaceAttributeValue == null) {
            throw new NullPointerException("Null servesLunch");
        }
        this.zzF = booleanPlaceAttributeValue;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setServesVegetarianFood(Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue) {
        if (booleanPlaceAttributeValue == null) {
            throw new NullPointerException("Null servesVegetarianFood");
        }
        this.zzG = booleanPlaceAttributeValue;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setServesWine(Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue) {
        if (booleanPlaceAttributeValue == null) {
            throw new NullPointerException("Null servesWine");
        }
        this.zzH = booleanPlaceAttributeValue;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setTakeout(Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue) {
        if (booleanPlaceAttributeValue == null) {
            throw new NullPointerException("Null takeout");
        }
        this.zzI = booleanPlaceAttributeValue;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setTypes(List<Place.Type> list) {
        this.zzJ = list;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setUserRatingsTotal(Integer num) {
        this.zzK = num;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setUtcOffsetMinutes(Integer num) {
        this.zzL = num;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setViewport(LatLngBounds latLngBounds) {
        this.zzM = latLngBounds;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setWebsiteUri(Uri uri) {
        this.zzN = uri;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place.Builder setWheelchairAccessibleEntrance(Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue) {
        if (booleanPlaceAttributeValue == null) {
            throw new NullPointerException("Null wheelchairAccessibleEntrance");
        }
        this.zzO = booleanPlaceAttributeValue;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Place.Builder
    public final Place zza() {
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue;
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue2;
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue3;
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue4;
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue5;
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue6;
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue7;
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue8;
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue9;
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue10;
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue11;
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue12;
        Place.BooleanPlaceAttributeValue booleanPlaceAttributeValue13 = this.zze;
        if (booleanPlaceAttributeValue13 != null && (booleanPlaceAttributeValue = this.zzg) != null && (booleanPlaceAttributeValue2 = this.zzh) != null && (booleanPlaceAttributeValue3 = this.zzz) != null && (booleanPlaceAttributeValue4 = this.zzB) != null && (booleanPlaceAttributeValue5 = this.zzC) != null && (booleanPlaceAttributeValue6 = this.zzD) != null && (booleanPlaceAttributeValue7 = this.zzE) != null && (booleanPlaceAttributeValue8 = this.zzF) != null && (booleanPlaceAttributeValue9 = this.zzG) != null && (booleanPlaceAttributeValue10 = this.zzH) != null && (booleanPlaceAttributeValue11 = this.zzI) != null && (booleanPlaceAttributeValue12 = this.zzO) != null) {
            return new zzbk(this.zza, this.zzb, this.zzc, this.zzd, booleanPlaceAttributeValue13, this.zzf, booleanPlaceAttributeValue, booleanPlaceAttributeValue2, this.zzi, this.zzj, this.zzk, this.zzl, this.zzm, this.zzn, this.zzo, this.zzp, this.zzq, this.zzr, this.zzs, this.zzt, this.zzu, this.zzv, this.zzw, this.zzx, this.zzy, booleanPlaceAttributeValue3, this.zzA, booleanPlaceAttributeValue4, booleanPlaceAttributeValue5, booleanPlaceAttributeValue6, booleanPlaceAttributeValue7, booleanPlaceAttributeValue8, booleanPlaceAttributeValue9, booleanPlaceAttributeValue10, booleanPlaceAttributeValue11, this.zzJ, this.zzK, this.zzL, this.zzM, this.zzN, booleanPlaceAttributeValue12);
        }
        StringBuilder sb2 = new StringBuilder();
        if (this.zze == null) {
            sb2.append(" curbsidePickup");
        }
        if (this.zzg == null) {
            sb2.append(" delivery");
        }
        if (this.zzh == null) {
            sb2.append(" dineIn");
        }
        if (this.zzz == null) {
            sb2.append(" reservable");
        }
        if (this.zzB == null) {
            sb2.append(" servesBeer");
        }
        if (this.zzC == null) {
            sb2.append(" servesBreakfast");
        }
        if (this.zzD == null) {
            sb2.append(" servesBrunch");
        }
        if (this.zzE == null) {
            sb2.append(" servesDinner");
        }
        if (this.zzF == null) {
            sb2.append(" servesLunch");
        }
        if (this.zzG == null) {
            sb2.append(" servesVegetarianFood");
        }
        if (this.zzH == null) {
            sb2.append(" servesWine");
        }
        if (this.zzI == null) {
            sb2.append(" takeout");
        }
        if (this.zzO == null) {
            sb2.append(" wheelchairAccessibleEntrance");
        }
        throw new IllegalStateException("Missing required properties:".concat(sb2.toString()));
    }
}
