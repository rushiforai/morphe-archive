package com.google.android.libraries.places.internal;

import android.graphics.Color;
import android.net.Uri;
import b.c0;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.libraries.places.api.model.AddressComponent;
import com.google.android.libraries.places.api.model.AddressComponents;
import com.google.android.libraries.places.api.model.AuthorAttribution;
import com.google.android.libraries.places.api.model.AuthorAttributions;
import com.google.android.libraries.places.api.model.DayOfWeek;
import com.google.android.libraries.places.api.model.LocalDate;
import com.google.android.libraries.places.api.model.LocalTime;
import com.google.android.libraries.places.api.model.OpeningHours;
import com.google.android.libraries.places.api.model.Period;
import com.google.android.libraries.places.api.model.PhotoMetadata;
import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.api.model.PlusCode;
import com.google.android.libraries.places.api.model.Review;
import com.google.android.libraries.places.api.model.SpecialDay;
import com.google.android.libraries.places.api.model.TimeOfWeek;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
final class zzhe {
    private final zzhh zza;
    private final zzoa zzb;
    private final zzoa zzc;

    public zzhe(zzhh zzhhVar) {
        zznz zznzVar = new zznz();
        zznzVar.zza(zzaov.OPERATIONAL, Place.BusinessStatus.OPERATIONAL);
        zznzVar.zza(zzaov.CLOSED_TEMPORARILY, Place.BusinessStatus.CLOSED_TEMPORARILY);
        zznzVar.zza(zzaov.CLOSED_PERMANENTLY, Place.BusinessStatus.CLOSED_PERMANENTLY);
        this.zzb = zznzVar.zzc();
        zznz zznzVar2 = new zznz();
        zznzVar2.zza(zzapg.ACCESS, OpeningHours.HoursType.ACCESS);
        zznzVar2.zza(zzapg.BREAKFAST, OpeningHours.HoursType.BREAKFAST);
        zznzVar2.zza(zzapg.BRUNCH, OpeningHours.HoursType.BRUNCH);
        zznzVar2.zza(zzapg.DELIVERY, OpeningHours.HoursType.DELIVERY);
        zznzVar2.zza(zzapg.DINNER, OpeningHours.HoursType.DINNER);
        zznzVar2.zza(zzapg.DRIVE_THROUGH, OpeningHours.HoursType.DRIVE_THROUGH);
        zznzVar2.zza(zzapg.HAPPY_HOUR, OpeningHours.HoursType.HAPPY_HOUR);
        zznzVar2.zza(zzapg.KITCHEN, OpeningHours.HoursType.KITCHEN);
        zznzVar2.zza(zzapg.LUNCH, OpeningHours.HoursType.LUNCH);
        zznzVar2.zza(zzapg.ONLINE_SERVICE_HOURS, OpeningHours.HoursType.ONLINE_SERVICE_HOURS);
        zznzVar2.zza(zzapg.PICKUP, OpeningHours.HoursType.PICKUP);
        zznzVar2.zza(zzapg.SENIOR_HOURS, OpeningHours.HoursType.SENIOR_HOURS);
        zznzVar2.zza(zzapg.TAKEOUT, OpeningHours.HoursType.TAKEOUT);
        this.zzc = zznzVar2.zzc();
        this.zza = zzhhVar;
    }

    private final OpeningHours zzb(zzapj zzapjVar) throws ApiException {
        OpeningHours.Builder builder = OpeningHours.builder();
        List listZze = zzapjVar.zze();
        ArrayList arrayList = new ArrayList();
        Iterator it = listZze.iterator();
        while (true) {
            TimeOfWeek timeOfWeekZzj = null;
            if (!it.hasNext()) {
                break;
            }
            zzape zzapeVar = (zzape) it.next();
            Period.Builder builder2 = Period.builder();
            builder2.setOpen(zzapeVar.zzf() ? zzj(zzapeVar.zzc()) : null);
            if (zzapeVar.zze()) {
                timeOfWeekZzj = zzj(zzapeVar.zza());
            }
            builder2.setClose(timeOfWeekZzj);
            arrayList.add(builder2.build());
        }
        builder.setPeriods(arrayList);
        builder.setWeekdayText(zzapjVar.zzg());
        builder.setHoursType((OpeningHours.HoursType) this.zzc.getOrDefault(zzapjVar.zza(), null));
        List listZzf = zzapjVar.zzf();
        ArrayList arrayList2 = new ArrayList();
        Iterator it2 = listZzf.iterator();
        while (it2.hasNext()) {
            try {
                SpecialDay.Builder builder3 = SpecialDay.builder(zzg(((zzapi) it2.next()).zzc()));
                builder3.setExceptional(true);
                arrayList2.add(builder3.build());
            } catch (IllegalArgumentException e3) {
                throw zzc(c0.k("Special day is not properly defined: ", e3.getMessage()));
            }
        }
        builder.setSpecialDays(arrayList2);
        return builder.build();
    }

    private static final ApiException zzc(String str) {
        return new ApiException(new Status(8, "Unexpected server error: ".concat(String.valueOf(str)), null, null));
    }

    private static final String zzd(String str) {
        if (str.isEmpty()) {
            return null;
        }
        return str;
    }

    private static final Place.BooleanPlaceAttributeValue zze(boolean z11, boolean z12) {
        return !z11 ? Place.BooleanPlaceAttributeValue.UNKNOWN : z12 ? Place.BooleanPlaceAttributeValue.TRUE : Place.BooleanPlaceAttributeValue.FALSE;
    }

    private static final LatLng zzf(zzaxp zzaxpVar) {
        return new LatLng(zzaxpVar.zzc(), zzaxpVar.zze());
    }

    private static final LocalDate zzg(zzaxm zzaxmVar) {
        return LocalDate.newInstance(zzaxmVar.zzf(), zzaxmVar.zze(), zzaxmVar.zzc());
    }

    private static final String zzh(String str, String str2) {
        zzsa zzsaVar = new zzsa("a");
        int i5 = zzsc.zza;
        zzsaVar.zzc(zzsc.zza(str, zzsb.zza));
        zzsaVar.zzb(str2);
        return zzsaVar.zza().zza();
    }

    private static final AuthorAttribution zzi(zzalr zzalrVar) throws ApiException {
        String strZzd = zzalrVar.zzd();
        if (strZzd.isEmpty()) {
            throw zzc("Author name not provided for an AuthorAttribution result.");
        }
        AuthorAttribution.Builder builder = AuthorAttribution.builder(strZzd);
        builder.setUri(zzd(zzalrVar.zzf()));
        builder.setPhotoUri(zzd(zzalrVar.zze()));
        return builder.build();
    }

    private static final TimeOfWeek zzj(zzapd zzapdVar) throws ApiException {
        DayOfWeek dayOfWeek;
        int iZza = zzapdVar.zza();
        LocalTime localTimeNewInstance = LocalTime.newInstance(zzapdVar.zzc(), zzapdVar.zzd());
        LocalDate localDateZzg = zzapdVar.zzi() ? zzg(zzapdVar.zzg()) : null;
        switch (iZza) {
            case 0:
                dayOfWeek = DayOfWeek.SUNDAY;
                break;
            case 1:
                dayOfWeek = DayOfWeek.MONDAY;
                break;
            case 2:
                dayOfWeek = DayOfWeek.TUESDAY;
                break;
            case 3:
                dayOfWeek = DayOfWeek.WEDNESDAY;
                break;
            case 4:
                dayOfWeek = DayOfWeek.THURSDAY;
                break;
            case 5:
                dayOfWeek = DayOfWeek.FRIDAY;
                break;
            case 6:
                dayOfWeek = DayOfWeek.SATURDAY;
                break;
            default:
                throw zzc("Day of week must an integer between 0 and 6");
        }
        TimeOfWeek.Builder builder = TimeOfWeek.builder(dayOfWeek, localTimeNewInstance);
        builder.setDate(localDateZzg);
        builder.setTruncated(zzapdVar.zzh());
        return builder.build();
    }

    public final Place zza(zzaps zzapsVar) throws ApiException {
        AddressComponents addressComponentsNewInstance;
        ArrayList arrayList;
        Integer numValueOf;
        ArrayList arrayList2;
        AuthorAttributions authorAttributionsNewInstance;
        PlusCode plusCodeBuild;
        ArrayList arrayList3;
        ArrayList arrayList4;
        LatLngBounds latLngBounds;
        Place.Builder builder = Place.builder();
        builder.setAddress(zzd(zzapsVar.zzq()));
        List<zzaoo> listZzx = zzapsVar.zzx();
        if (listZzx.isEmpty()) {
            addressComponentsNewInstance = null;
        } else {
            ArrayList arrayList5 = new ArrayList();
            for (zzaoo zzaooVar : listZzx) {
                try {
                    AddressComponent.Builder builder2 = AddressComponent.builder(zzaooVar.zzc(), zzaooVar.zze());
                    builder2.setShortName(zzd(zzaooVar.zzd()));
                    arrayList5.add(builder2.build());
                } catch (IllegalStateException e3) {
                    throw zzc(c0.l("AddressComponent is not properly defined: ", e3.getMessage(), "."));
                }
            }
            addressComponentsNewInstance = AddressComponents.newInstance(arrayList5);
        }
        builder.setAddressComponents(addressComponentsNewInstance);
        List<zzaos> listZzy = zzapsVar.zzy();
        if (listZzy.isEmpty()) {
            arrayList = null;
        } else {
            arrayList = new ArrayList();
            for (zzaos zzaosVar : listZzy) {
                String strZzd = zzaosVar.zzd();
                if (strZzd.startsWith("//")) {
                    strZzd = "https:".concat(strZzd);
                }
                arrayList.add(zzh(strZzd, zzaosVar.zzc()));
            }
        }
        builder.setAttributions(arrayList);
        builder.setBusinessStatus((Place.BusinessStatus) this.zzb.getOrDefault(zzapsVar.zzg(), null));
        builder.setCurbsidePickup(zze(zzapsVar.zzP(), zzapsVar.zzD()));
        builder.setCurrentOpeningHours(zzapsVar.zzQ() ? zzb(zzapsVar.zzh()) : null);
        builder.setDelivery(zze(zzapsVar.zzR(), zzapsVar.zzE()));
        builder.setDineIn(zze(zzapsVar.zzS(), zzapsVar.zzF()));
        builder.setEditorialSummary(zzapsVar.zzU() ? zzd(zzapsVar.zzp().zzg()) : null);
        builder.setEditorialSummaryLanguageCode(zzapsVar.zzU() ? zzd(zzapsVar.zzp().zzf()) : null);
        String strZzr = zzapsVar.zzr();
        if (strZzr.isEmpty()) {
            numValueOf = null;
        } else {
            try {
                numValueOf = Integer.valueOf(Color.parseColor(strZzr));
            } catch (IllegalArgumentException unused) {
            }
        }
        builder.setIconBackgroundColor(numValueOf);
        String strZzs = zzapsVar.zzs();
        builder.setIconUrl(!strZzs.isEmpty() ? strZzs.concat(".png") : null);
        builder.setId(zzd(zzapsVar.zzt()));
        builder.setLatLng(zzapsVar.zzV() ? zzf(zzapsVar.zzn()) : null);
        builder.setName(zzapsVar.zzT() ? zzd(zzapsVar.zzo().zzg()) : null);
        builder.setNameLanguageCode(zzapsVar.zzT() ? zzd(zzapsVar.zzo().zzf()) : null);
        builder.setOpeningHours(zzapsVar.zzX() ? zzb(zzapsVar.zzi()) : null);
        builder.setPhoneNumber(zzd(zzapsVar.zzu()));
        List<zzaog> listZzz = zzapsVar.zzz();
        if (listZzz.isEmpty()) {
            arrayList2 = null;
        } else {
            arrayList2 = new ArrayList();
            for (zzaog zzaogVar : listZzz) {
                String strZze = zzaogVar.zze();
                if (strZze.isEmpty() || strZze.split("/").length != 4) {
                    throw zzc("Photo reference not provided for a PhotoMetadata result.");
                }
                Iterator it = zzmy.zzb(zzma.zzb('/')).zzd(strZze).iterator();
                it.getClass();
                int i5 = 0;
                while (i5 < 3 && it.hasNext()) {
                    it.next();
                    i5++;
                }
                if (!it.hasNext()) {
                    throw new IndexOutOfBoundsException(c0.i(i5, "position (3) must be less than the number of elements that remained (", ")"));
                }
                PhotoMetadata.Builder builder3 = PhotoMetadata.builder((String) it.next());
                builder3.zza(zzaogVar.zze());
                List<zzalr> listZzf = zzaogVar.zzf();
                ArrayList arrayList6 = new ArrayList();
                for (zzalr zzalrVar : listZzf) {
                    if (zzalrVar != null) {
                        String strZzf = zzalrVar.zzf();
                        if (strZzf.startsWith("//")) {
                            strZzf = "https:".concat(strZzf);
                        }
                        arrayList6.add(zzh(strZzf, zzalrVar.zzd()));
                    }
                }
                builder3.setAttributions(zzmh.zzc(", ").zzf(arrayList6));
                builder3.setHeight(zzaogVar.zza());
                builder3.setWidth(zzaogVar.zzc());
                List listZzf2 = zzaogVar.zzf();
                if (listZzf2.isEmpty()) {
                    authorAttributionsNewInstance = null;
                } else {
                    zznu zznuVar = new zznu();
                    Iterator it2 = listZzf2.iterator();
                    while (it2.hasNext()) {
                        zznuVar.zze(zzi((zzalr) it2.next()));
                    }
                    authorAttributionsNewInstance = AuthorAttributions.newInstance(zznuVar.zzg());
                }
                builder3.setAuthorAttributions(authorAttributionsNewInstance);
                arrayList2.add(builder3.build());
            }
        }
        builder.setPhotoMetadatas(arrayList2);
        builder.setPlaceTypes(zzapsVar.zzC().isEmpty() ? null : zzapsVar.zzC());
        if (zzapsVar.zzW()) {
            zzapp zzappVarZzj = zzapsVar.zzj();
            PlusCode.Builder builder4 = PlusCode.builder();
            builder4.setCompoundCode(zzd(zzappVarZzj.zzd()));
            builder4.setGlobalCode(zzd(zzappVarZzj.zze()));
            plusCodeBuild = builder4.build();
        } else {
            plusCodeBuild = null;
        }
        builder.setPlusCode(plusCodeBuild);
        zzaqb zzaqbVarZzm = zzapsVar.zzm();
        zzaqb zzaqbVar = zzaqb.PRICE_LEVEL_UNSPECIFIED;
        int iOrdinal = zzaqbVarZzm.ordinal();
        builder.setPriceLevel(iOrdinal != 1 ? iOrdinal != 2 ? iOrdinal != 3 ? iOrdinal != 4 ? iOrdinal != 5 ? null : 4 : 3 : 2 : 1 : 0);
        builder.setPrimaryType(zzd(zzapsVar.zzv()));
        double dZza = zzapsVar.zza();
        builder.setRating(dZza < 1.0d ? null : Double.valueOf(dZza));
        builder.setReservable(zze(zzapsVar.zzY(), zzapsVar.zzG()));
        List<zzaqh> listZzB = zzapsVar.zzB();
        if (listZzB.isEmpty()) {
            arrayList3 = null;
        } else {
            arrayList3 = new ArrayList();
            for (zzaqh zzaqhVar : listZzB) {
                double dZza2 = zzaqhVar.zza();
                if (dZza2 == 0.0d) {
                    throw zzc("Review rating not provided for a Review result.");
                }
                if (!zzaqhVar.zzi()) {
                    throw zzc("Author attribution not provided for a Review result.");
                }
                String strZza = zzaqhVar.zzk() ? zzaxg.zza(zzaqhVar.zze()) : null;
                String strZzd2 = zzaqhVar.zzl() ? zzd(zzaqhVar.zzg().zzg()) : null;
                String strZzd3 = zzaqhVar.zzl() ? zzd(zzaqhVar.zzg().zzf()) : null;
                String strZzd4 = zzaqhVar.zzj() ? zzd(zzaqhVar.zzf().zzg()) : null;
                String strZzd5 = zzaqhVar.zzj() ? zzd(zzaqhVar.zzf().zzf()) : null;
                String strZzd6 = zzd(zzaqhVar.zzh());
                Review.Builder builder5 = Review.builder(Double.valueOf(dZza2), zzi(zzaqhVar.zzc()));
                builder5.setPublishTime(strZza);
                builder5.setText(strZzd2);
                builder5.setTextLanguageCode(strZzd3);
                builder5.setOriginalText(strZzd4);
                builder5.setOriginalTextLanguageCode(strZzd5);
                builder5.setRelativePublishTimeDescription(strZzd6);
                arrayList3.add(builder5.build());
            }
        }
        builder.setReviews(arrayList3);
        List listZzA = zzapsVar.zzA();
        if (listZzA.isEmpty()) {
            arrayList4 = null;
        } else {
            arrayList4 = new ArrayList();
            Iterator it3 = listZzA.iterator();
            while (it3.hasNext()) {
                arrayList4.add(zzb((zzapj) it3.next()));
            }
        }
        builder.setSecondaryOpeningHours(arrayList4);
        builder.setServesBeer(zze(zzapsVar.zzZ(), zzapsVar.zzH()));
        builder.setServesBreakfast(zze(zzapsVar.zzaa(), zzapsVar.zzI()));
        builder.setServesBrunch(zze(zzapsVar.zzab(), zzapsVar.zzJ()));
        builder.setServesDinner(zze(zzapsVar.zzac(), zzapsVar.zzK()));
        builder.setServesLunch(zze(zzapsVar.zzad(), zzapsVar.zzL()));
        builder.setServesVegetarianFood(zze(zzapsVar.zzae(), zzapsVar.zzM()));
        builder.setServesWine(zze(zzapsVar.zzaf(), zzapsVar.zzN()));
        builder.setTakeout(zze(zzapsVar.zzag(), zzapsVar.zzO()));
        builder.setTypes(this.zza.zza(zzapsVar.zzC()));
        builder.setUserRatingsTotal(zzapsVar.zzah() ? Integer.valueOf(zzapsVar.zzc()) : null);
        builder.setUtcOffsetMinutes(zzapsVar.zzai() ? Integer.valueOf(zzapsVar.zzd()) : null);
        if (zzapsVar.zzaj()) {
            zzaki zzakiVarZze = zzapsVar.zze();
            latLngBounds = new LatLngBounds(zzf(zzakiVarZze.zzf()), zzf(zzakiVarZze.zze()));
        } else {
            latLngBounds = null;
        }
        builder.setViewport(latLngBounds);
        String strZzw = zzapsVar.zzw();
        builder.setWebsiteUri(strZzw.isEmpty() ? null : Uri.parse(strZzw));
        builder.setWheelchairAccessibleEntrance(zze(zzapsVar.zzf().zze(), zzapsVar.zzf().zzd()));
        return builder.build();
    }
}
