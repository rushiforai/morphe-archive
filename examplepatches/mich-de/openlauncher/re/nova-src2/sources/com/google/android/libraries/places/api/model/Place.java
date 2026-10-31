package com.google.android.libraries.places.api.model;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import androidx.annotation.RecentlyNonNull;
import androidx.annotation.RecentlyNullable;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.libraries.places.internal.zzmt;
import com.google.android.libraries.places.internal.zznx;
import com.google.android.libraries.places.internal.zzok;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class Place implements Parcelable {
    public static final int PRICE_LEVEL_MAX_VALUE = 4;
    public static final int PRICE_LEVEL_MIN_VALUE = 0;
    public static final double RATING_MAX_VALUE = 5.0d;
    public static final double RATING_MIN_VALUE = 1.0d;

    public enum BooleanPlaceAttributeValue implements Parcelable {
        UNKNOWN,
        TRUE,
        FALSE;


        @RecentlyNonNull
        public static final Parcelable.Creator<BooleanPlaceAttributeValue> CREATOR = new zzcf();

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(@RecentlyNonNull Parcel parcel, int i5) {
            parcel.writeString(name());
        }
    }

    public static abstract class Builder {
        @RecentlyNonNull
        public Place build() {
            Place placeZza = zza();
            List<String> attributions = placeZza.getAttributions();
            if (attributions != null) {
                Iterator<String> it = attributions.iterator();
                while (it.hasNext()) {
                    zzmt.zzp(!TextUtils.isEmpty(it.next()), "Attributions must not contain null or empty values.");
                }
            }
            Integer priceLevel = placeZza.getPriceLevel();
            if (priceLevel != null) {
                zzmt.zzs(zzok.zzb(0, 4).zzd(priceLevel), "Price Level must not be out-of-range: %s to %s, but was: %s.", 0, 4, priceLevel);
            }
            Double rating = placeZza.getRating();
            if (rating != null) {
                Double dValueOf = Double.valueOf(1.0d);
                Double dValueOf2 = Double.valueOf(5.0d);
                zzmt.zzs(zzok.zzb(dValueOf, dValueOf2).zzd(rating), "Rating must not be out-of-range: %s to %s, but was: %s.", dValueOf, dValueOf2, rating);
            }
            Integer userRatingsTotal = placeZza.getUserRatingsTotal();
            if (userRatingsTotal != null) {
                zzmt.zzr(zzok.zza(0).zzd(userRatingsTotal), "User Ratings Total must not be < 0, but was: %s.", userRatingsTotal);
            }
            if (attributions != null) {
                setAttributions(zznx.zzj(attributions));
            }
            List<PhotoMetadata> photoMetadatas = placeZza.getPhotoMetadatas();
            if (photoMetadatas != null) {
                setPhotoMetadatas(zznx.zzj(photoMetadatas));
            }
            List<String> placeTypes = placeZza.getPlaceTypes();
            if (placeTypes != null) {
                setPlaceTypes(zznx.zzj(placeTypes));
            }
            List<Type> types = placeZza.getTypes();
            if (types != null) {
                setTypes(zznx.zzj(types));
            }
            List<OpeningHours> secondaryOpeningHours = placeZza.getSecondaryOpeningHours();
            if (secondaryOpeningHours != null) {
                setSecondaryOpeningHours(zznx.zzj(secondaryOpeningHours));
            }
            List<Review> reviews = placeZza.getReviews();
            if (reviews != null) {
                setReviews(zznx.zzj(reviews));
            }
            return zza();
        }

        @RecentlyNullable
        public abstract String getAddress();

        @RecentlyNullable
        public abstract AddressComponents getAddressComponents();

        @RecentlyNullable
        public abstract List<String> getAttributions();

        @RecentlyNullable
        public abstract BusinessStatus getBusinessStatus();

        @RecentlyNonNull
        public abstract BooleanPlaceAttributeValue getCurbsidePickup();

        @RecentlyNullable
        public abstract OpeningHours getCurrentOpeningHours();

        @RecentlyNonNull
        public abstract BooleanPlaceAttributeValue getDelivery();

        @RecentlyNonNull
        public abstract BooleanPlaceAttributeValue getDineIn();

        @RecentlyNullable
        public abstract String getEditorialSummary();

        @RecentlyNullable
        public abstract String getEditorialSummaryLanguageCode();

        @RecentlyNullable
        public abstract Integer getIconBackgroundColor();

        @RecentlyNullable
        public abstract String getIconUrl();

        @RecentlyNullable
        public abstract String getId();

        @RecentlyNullable
        public abstract LatLng getLatLng();

        @RecentlyNullable
        public abstract String getName();

        @RecentlyNullable
        public abstract String getNameLanguageCode();

        @RecentlyNullable
        public abstract OpeningHours getOpeningHours();

        @RecentlyNullable
        public abstract String getPhoneNumber();

        @RecentlyNullable
        public abstract List<PhotoMetadata> getPhotoMetadatas();

        @RecentlyNullable
        public abstract List<String> getPlaceTypes();

        @RecentlyNullable
        public abstract PlusCode getPlusCode();

        @RecentlyNullable
        public abstract Integer getPriceLevel();

        @RecentlyNullable
        public abstract String getPrimaryType();

        @RecentlyNullable
        public abstract Double getRating();

        @RecentlyNonNull
        public abstract BooleanPlaceAttributeValue getReservable();

        @RecentlyNullable
        public abstract List<Review> getReviews();

        @RecentlyNullable
        public abstract List<OpeningHours> getSecondaryOpeningHours();

        @RecentlyNonNull
        public abstract BooleanPlaceAttributeValue getServesBeer();

        @RecentlyNonNull
        public abstract BooleanPlaceAttributeValue getServesBreakfast();

        @RecentlyNonNull
        public abstract BooleanPlaceAttributeValue getServesBrunch();

        @RecentlyNonNull
        public abstract BooleanPlaceAttributeValue getServesDinner();

        @RecentlyNonNull
        public abstract BooleanPlaceAttributeValue getServesLunch();

        @RecentlyNonNull
        public abstract BooleanPlaceAttributeValue getServesVegetarianFood();

        @RecentlyNonNull
        public abstract BooleanPlaceAttributeValue getServesWine();

        @RecentlyNonNull
        public abstract BooleanPlaceAttributeValue getTakeout();

        @RecentlyNullable
        @Deprecated
        public abstract List<Type> getTypes();

        @RecentlyNullable
        public abstract Integer getUserRatingsTotal();

        @RecentlyNullable
        public abstract Integer getUtcOffsetMinutes();

        @RecentlyNullable
        public abstract LatLngBounds getViewport();

        @RecentlyNullable
        public abstract Uri getWebsiteUri();

        @RecentlyNonNull
        public abstract BooleanPlaceAttributeValue getWheelchairAccessibleEntrance();

        @RecentlyNonNull
        public abstract Builder setAddress(String str);

        @RecentlyNonNull
        public abstract Builder setAddressComponents(AddressComponents addressComponents);

        @RecentlyNonNull
        public abstract Builder setAttributions(List<String> list);

        @RecentlyNonNull
        public abstract Builder setBusinessStatus(BusinessStatus businessStatus);

        @RecentlyNonNull
        public abstract Builder setCurbsidePickup(@RecentlyNonNull BooleanPlaceAttributeValue booleanPlaceAttributeValue);

        @RecentlyNonNull
        public abstract Builder setCurrentOpeningHours(OpeningHours openingHours);

        @RecentlyNonNull
        public abstract Builder setDelivery(@RecentlyNonNull BooleanPlaceAttributeValue booleanPlaceAttributeValue);

        @RecentlyNonNull
        public abstract Builder setDineIn(@RecentlyNonNull BooleanPlaceAttributeValue booleanPlaceAttributeValue);

        @RecentlyNonNull
        public abstract Builder setEditorialSummary(String str);

        @RecentlyNonNull
        public abstract Builder setEditorialSummaryLanguageCode(String str);

        @RecentlyNonNull
        public abstract Builder setIconBackgroundColor(Integer num);

        @RecentlyNonNull
        public abstract Builder setIconUrl(String str);

        @RecentlyNonNull
        public abstract Builder setId(String str);

        @RecentlyNonNull
        public abstract Builder setLatLng(LatLng latLng);

        @RecentlyNonNull
        public abstract Builder setName(String str);

        @RecentlyNonNull
        public abstract Builder setNameLanguageCode(String str);

        @RecentlyNonNull
        public abstract Builder setOpeningHours(OpeningHours openingHours);

        @RecentlyNonNull
        public abstract Builder setPhoneNumber(String str);

        @RecentlyNonNull
        public abstract Builder setPhotoMetadatas(List<PhotoMetadata> list);

        @RecentlyNonNull
        public abstract Builder setPlaceTypes(List<String> list);

        @RecentlyNonNull
        public abstract Builder setPlusCode(PlusCode plusCode);

        @RecentlyNonNull
        public abstract Builder setPriceLevel(Integer num);

        @RecentlyNonNull
        public abstract Builder setPrimaryType(String str);

        @RecentlyNonNull
        public abstract Builder setRating(Double d5);

        @RecentlyNonNull
        public abstract Builder setReservable(@RecentlyNonNull BooleanPlaceAttributeValue booleanPlaceAttributeValue);

        @RecentlyNonNull
        public abstract Builder setReviews(List<Review> list);

        @RecentlyNonNull
        public abstract Builder setSecondaryOpeningHours(List<OpeningHours> list);

        @RecentlyNonNull
        public abstract Builder setServesBeer(@RecentlyNonNull BooleanPlaceAttributeValue booleanPlaceAttributeValue);

        @RecentlyNonNull
        public abstract Builder setServesBreakfast(@RecentlyNonNull BooleanPlaceAttributeValue booleanPlaceAttributeValue);

        @RecentlyNonNull
        public abstract Builder setServesBrunch(@RecentlyNonNull BooleanPlaceAttributeValue booleanPlaceAttributeValue);

        @RecentlyNonNull
        public abstract Builder setServesDinner(@RecentlyNonNull BooleanPlaceAttributeValue booleanPlaceAttributeValue);

        @RecentlyNonNull
        public abstract Builder setServesLunch(@RecentlyNonNull BooleanPlaceAttributeValue booleanPlaceAttributeValue);

        @RecentlyNonNull
        public abstract Builder setServesVegetarianFood(@RecentlyNonNull BooleanPlaceAttributeValue booleanPlaceAttributeValue);

        @RecentlyNonNull
        public abstract Builder setServesWine(@RecentlyNonNull BooleanPlaceAttributeValue booleanPlaceAttributeValue);

        @RecentlyNonNull
        public abstract Builder setTakeout(@RecentlyNonNull BooleanPlaceAttributeValue booleanPlaceAttributeValue);

        @RecentlyNonNull
        @Deprecated
        public abstract Builder setTypes(List<Type> list);

        @RecentlyNonNull
        public abstract Builder setUserRatingsTotal(Integer num);

        @RecentlyNonNull
        public abstract Builder setUtcOffsetMinutes(Integer num);

        @RecentlyNonNull
        public abstract Builder setViewport(LatLngBounds latLngBounds);

        @RecentlyNonNull
        public abstract Builder setWebsiteUri(Uri uri);

        @RecentlyNonNull
        public abstract Builder setWheelchairAccessibleEntrance(@RecentlyNonNull BooleanPlaceAttributeValue booleanPlaceAttributeValue);

        public abstract Place zza();
    }

    public enum BusinessStatus implements Parcelable {
        OPERATIONAL,
        CLOSED_TEMPORARILY,
        CLOSED_PERMANENTLY;


        @RecentlyNonNull
        public static final Parcelable.Creator<BusinessStatus> CREATOR = new zzcg();

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(@RecentlyNonNull Parcel parcel, int i5) {
            parcel.writeString(name());
        }
    }

    public enum Field implements Parcelable {
        ADDRESS,
        ADDRESS_COMPONENTS,
        BUSINESS_STATUS,
        CURBSIDE_PICKUP,
        CURRENT_OPENING_HOURS,
        DELIVERY,
        DINE_IN,
        EDITORIAL_SUMMARY,
        ICON_BACKGROUND_COLOR,
        ICON_URL,
        ID,
        LAT_LNG,
        NAME,
        OPENING_HOURS,
        PHONE_NUMBER,
        PHOTO_METADATAS,
        PLUS_CODE,
        PRICE_LEVEL,
        PRIMARY_TYPE,
        RATING,
        RESERVABLE,
        REVIEWS,
        SECONDARY_OPENING_HOURS,
        SERVES_BEER,
        SERVES_BREAKFAST,
        SERVES_BRUNCH,
        SERVES_DINNER,
        SERVES_LUNCH,
        SERVES_VEGETARIAN_FOOD,
        SERVES_WINE,
        TAKEOUT,
        TYPES,
        USER_RATINGS_TOTAL,
        UTC_OFFSET,
        VIEWPORT,
        WEBSITE_URI,
        WHEELCHAIR_ACCESSIBLE_ENTRANCE;


        @RecentlyNonNull
        public static final Parcelable.Creator<Field> CREATOR = new zzch();

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(@RecentlyNonNull Parcel parcel, int i5) {
            parcel.writeString(name());
        }
    }

    @Deprecated
    public enum Type implements Parcelable {
        OTHER,
        ACCOUNTING,
        ADMINISTRATIVE_AREA_LEVEL_1,
        ADMINISTRATIVE_AREA_LEVEL_2,
        ADMINISTRATIVE_AREA_LEVEL_3,
        ADMINISTRATIVE_AREA_LEVEL_4,
        ADMINISTRATIVE_AREA_LEVEL_5,
        AIRPORT,
        AMUSEMENT_PARK,
        AQUARIUM,
        ARCHIPELAGO,
        ART_GALLERY,
        ATM,
        BAKERY,
        BANK,
        BAR,
        BEAUTY_SALON,
        BICYCLE_STORE,
        BOOK_STORE,
        BOWLING_ALLEY,
        BUS_STATION,
        CAFE,
        CAMPGROUND,
        CAR_DEALER,
        CAR_RENTAL,
        CAR_REPAIR,
        CAR_WASH,
        CASINO,
        CEMETERY,
        CHURCH,
        CITY_HALL,
        CLOTHING_STORE,
        COLLOQUIAL_AREA,
        CONTINENT,
        CONVENIENCE_STORE,
        COUNTRY,
        COURTHOUSE,
        DENTIST,
        DEPARTMENT_STORE,
        DOCTOR,
        DRUGSTORE,
        ELECTRICIAN,
        ELECTRONICS_STORE,
        EMBASSY,
        ESTABLISHMENT,
        FINANCE,
        FIRE_STATION,
        FLOOR,
        FLORIST,
        FOOD,
        FUNERAL_HOME,
        FURNITURE_STORE,
        GAS_STATION,
        GENERAL_CONTRACTOR,
        GEOCODE,
        GROCERY_OR_SUPERMARKET,
        GYM,
        HAIR_CARE,
        HARDWARE_STORE,
        HEALTH,
        HINDU_TEMPLE,
        HOME_GOODS_STORE,
        HOSPITAL,
        INSURANCE_AGENCY,
        INTERSECTION,
        JEWELRY_STORE,
        LAUNDRY,
        LAWYER,
        LIBRARY,
        LIGHT_RAIL_STATION,
        LIQUOR_STORE,
        LOCAL_GOVERNMENT_OFFICE,
        LOCALITY,
        LOCKSMITH,
        LODGING,
        MEAL_DELIVERY,
        MEAL_TAKEAWAY,
        MOSQUE,
        MOVIE_RENTAL,
        MOVIE_THEATER,
        MOVING_COMPANY,
        MUSEUM,
        NATURAL_FEATURE,
        NEIGHBORHOOD,
        NIGHT_CLUB,
        PAINTER,
        PARK,
        PARKING,
        PET_STORE,
        PHARMACY,
        PHYSIOTHERAPIST,
        PLACE_OF_WORSHIP,
        PLUMBER,
        PLUS_CODE,
        POINT_OF_INTEREST,
        POLICE,
        POLITICAL,
        POST_BOX,
        POST_OFFICE,
        POSTAL_CODE_PREFIX,
        POSTAL_CODE_SUFFIX,
        POSTAL_CODE,
        POSTAL_TOWN,
        PREMISE,
        PRIMARY_SCHOOL,
        REAL_ESTATE_AGENCY,
        RESTAURANT,
        ROOFING_CONTRACTOR,
        ROOM,
        ROUTE,
        RV_PARK,
        SCHOOL,
        SECONDARY_SCHOOL,
        SHOE_STORE,
        SHOPPING_MALL,
        SPA,
        STADIUM,
        STORAGE,
        STORE,
        STREET_ADDRESS,
        STREET_NUMBER,
        SUBLOCALITY_LEVEL_1,
        SUBLOCALITY_LEVEL_2,
        SUBLOCALITY_LEVEL_3,
        SUBLOCALITY_LEVEL_4,
        SUBLOCALITY_LEVEL_5,
        SUBLOCALITY,
        SUBPREMISE,
        SUBWAY_STATION,
        SUPERMARKET,
        SYNAGOGUE,
        TAXI_STAND,
        TOURIST_ATTRACTION,
        TOWN_SQUARE,
        TRAIN_STATION,
        TRANSIT_STATION,
        TRAVEL_AGENCY,
        UNIVERSITY,
        VETERINARY_CARE,
        ZOO;


        @RecentlyNonNull
        public static final Parcelable.Creator<Type> CREATOR = new zzci();

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(@RecentlyNonNull Parcel parcel, int i5) {
            parcel.writeString(name());
        }
    }

    @RecentlyNonNull
    public static Builder builder() {
        zzw zzwVar = new zzw();
        BooleanPlaceAttributeValue booleanPlaceAttributeValue = BooleanPlaceAttributeValue.UNKNOWN;
        zzwVar.setCurbsidePickup(booleanPlaceAttributeValue);
        zzwVar.setDelivery(booleanPlaceAttributeValue);
        zzwVar.setDineIn(booleanPlaceAttributeValue);
        zzwVar.setReservable(booleanPlaceAttributeValue);
        zzwVar.setServesBeer(booleanPlaceAttributeValue);
        zzwVar.setServesBreakfast(booleanPlaceAttributeValue);
        zzwVar.setServesBrunch(booleanPlaceAttributeValue);
        zzwVar.setServesDinner(booleanPlaceAttributeValue);
        zzwVar.setServesLunch(booleanPlaceAttributeValue);
        zzwVar.setServesVegetarianFood(booleanPlaceAttributeValue);
        zzwVar.setServesWine(booleanPlaceAttributeValue);
        zzwVar.setTakeout(booleanPlaceAttributeValue);
        zzwVar.setWheelchairAccessibleEntrance(booleanPlaceAttributeValue);
        return zzwVar;
    }

    @RecentlyNullable
    public abstract String getAddress();

    @RecentlyNullable
    public abstract AddressComponents getAddressComponents();

    @RecentlyNullable
    public abstract List<String> getAttributions();

    @RecentlyNullable
    public abstract BusinessStatus getBusinessStatus();

    @RecentlyNonNull
    public abstract BooleanPlaceAttributeValue getCurbsidePickup();

    @RecentlyNullable
    public abstract OpeningHours getCurrentOpeningHours();

    @RecentlyNonNull
    public abstract BooleanPlaceAttributeValue getDelivery();

    @RecentlyNonNull
    public abstract BooleanPlaceAttributeValue getDineIn();

    @RecentlyNullable
    public abstract String getEditorialSummary();

    @RecentlyNullable
    public abstract String getEditorialSummaryLanguageCode();

    @RecentlyNullable
    public abstract Integer getIconBackgroundColor();

    @RecentlyNullable
    public abstract String getIconUrl();

    @RecentlyNullable
    public abstract String getId();

    @RecentlyNullable
    public abstract LatLng getLatLng();

    @RecentlyNullable
    public abstract String getName();

    @RecentlyNullable
    public abstract String getNameLanguageCode();

    @RecentlyNullable
    public abstract OpeningHours getOpeningHours();

    @RecentlyNullable
    public abstract String getPhoneNumber();

    @RecentlyNullable
    public abstract List<PhotoMetadata> getPhotoMetadatas();

    @RecentlyNullable
    public abstract List<String> getPlaceTypes();

    @RecentlyNullable
    public abstract PlusCode getPlusCode();

    @RecentlyNullable
    public abstract Integer getPriceLevel();

    @RecentlyNullable
    public abstract String getPrimaryType();

    @RecentlyNullable
    public abstract Double getRating();

    @RecentlyNonNull
    public abstract BooleanPlaceAttributeValue getReservable();

    @RecentlyNullable
    public abstract List<Review> getReviews();

    @RecentlyNullable
    public abstract List<OpeningHours> getSecondaryOpeningHours();

    @RecentlyNonNull
    public abstract BooleanPlaceAttributeValue getServesBeer();

    @RecentlyNonNull
    public abstract BooleanPlaceAttributeValue getServesBreakfast();

    @RecentlyNonNull
    public abstract BooleanPlaceAttributeValue getServesBrunch();

    @RecentlyNonNull
    public abstract BooleanPlaceAttributeValue getServesDinner();

    @RecentlyNonNull
    public abstract BooleanPlaceAttributeValue getServesLunch();

    @RecentlyNonNull
    public abstract BooleanPlaceAttributeValue getServesVegetarianFood();

    @RecentlyNonNull
    public abstract BooleanPlaceAttributeValue getServesWine();

    @RecentlyNonNull
    public abstract BooleanPlaceAttributeValue getTakeout();

    @RecentlyNullable
    @Deprecated
    public abstract List<Type> getTypes();

    @RecentlyNullable
    public abstract Integer getUserRatingsTotal();

    @RecentlyNullable
    public abstract Integer getUtcOffsetMinutes();

    @RecentlyNullable
    public abstract LatLngBounds getViewport();

    @RecentlyNullable
    public abstract Uri getWebsiteUri();

    @RecentlyNonNull
    public abstract BooleanPlaceAttributeValue getWheelchairAccessibleEntrance();

    @RecentlyNullable
    @Deprecated
    public Boolean isOpen() {
        return isOpen(System.currentTimeMillis());
    }

    @RecentlyNullable
    @Deprecated
    public Boolean isOpen(long j11) {
        return zzce.zzb(this, j11);
    }
}
