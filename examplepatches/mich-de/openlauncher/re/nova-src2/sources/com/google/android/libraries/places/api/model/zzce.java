package com.google.android.libraries.places.api.model;

import android.util.Log;
import com.google.android.libraries.places.api.model.Period;
import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.internal.zznz;
import com.google.android.libraries.places.internal.zzoa;
import com.google.android.libraries.places.internal.zzok;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.EnumMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class zzce {
    public static final /* synthetic */ int zza = 0;
    private static final zzoa zzb;
    private static final LocalTime zzc;

    static {
        zznz zznzVar = new zznz();
        zznzVar.zza(1, DayOfWeek.SUNDAY);
        zznzVar.zza(2, DayOfWeek.MONDAY);
        zznzVar.zza(3, DayOfWeek.TUESDAY);
        zznzVar.zza(4, DayOfWeek.WEDNESDAY);
        zznzVar.zza(5, DayOfWeek.THURSDAY);
        zznzVar.zza(6, DayOfWeek.FRIDAY);
        zznzVar.zza(7, DayOfWeek.SATURDAY);
        zzb = zznzVar.zzc();
        zzc = LocalTime.newInstance(23, 59);
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00ca  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Boolean zza(Place place, long j11) {
        TimeZone timeZoneZze;
        TimeOfWeek open;
        Place.BusinessStatus businessStatus = place.getBusinessStatus();
        Integer utcOffsetMinutes = place.getUtcOffsetMinutes();
        if (businessStatus != null && businessStatus != Place.BusinessStatus.OPERATIONAL) {
            return Boolean.FALSE;
        }
        if (utcOffsetMinutes != null) {
            OpeningHours currentOpeningHours = place.getCurrentOpeningHours();
            int iIntValue = utcOffsetMinutes.intValue();
            if (currentOpeningHours != null && (timeZoneZze = zze(iIntValue)) != null) {
                ArrayList arrayList = new ArrayList(currentOpeningHours.getPeriods());
                if (!arrayList.isEmpty()) {
                    try {
                        Collections.sort(arrayList, new Comparator() { // from class: com.google.android.libraries.places.api.model.zzcd
                            @Override // java.util.Comparator
                            public final int compare(Object obj, Object obj2) {
                                int i5 = zzce.zza;
                                TimeOfWeek open2 = ((Period) obj).getOpen();
                                open2.getClass();
                                TimeOfWeek open3 = ((Period) obj2).getOpen();
                                open3.getClass();
                                LocalDate date = open2.getDate();
                                date.getClass();
                                LocalDate date2 = open3.getDate();
                                date2.getClass();
                                return date.compareTo(date2);
                            }
                        });
                        open = ((Period) arrayList.get(0)).getOpen();
                    } catch (NullPointerException unused) {
                    }
                    if (open == null) {
                        throw null;
                    }
                    LocalDate date = open.getDate();
                    if (arrayList.isEmpty()) {
                        throw new NoSuchElementException();
                    }
                    TimeOfWeek close = ((Period) arrayList.get(arrayList.size() - 1)).getClose();
                    if (close == null) {
                        throw null;
                    }
                    LocalDate date2 = close.getDate();
                    if (date == null || date2 == null) {
                        currentOpeningHours = place.getOpeningHours();
                        if (currentOpeningHours != null) {
                            List<Period> periods = currentOpeningHours.getPeriods();
                            if (periods.isEmpty()) {
                                return Boolean.FALSE;
                            }
                            if (zzf(periods)) {
                                return Boolean.TRUE;
                            }
                            Iterator<Period> it = periods.iterator();
                            while (true) {
                                if (it.hasNext()) {
                                    Period next = it.next();
                                    if (next.getOpen() == null || next.getClose() == null) {
                                        break;
                                    }
                                } else {
                                    TimeZone timeZoneZze2 = zze(utcOffsetMinutes.intValue());
                                    if (timeZoneZze2 != null) {
                                        Calendar calendar = Calendar.getInstance(timeZoneZze2);
                                        calendar.setTimeInMillis(j11);
                                        DayOfWeek dayOfWeek = (DayOfWeek) zzb.get(Integer.valueOf(calendar.get(7)));
                                        LocalTime localTimeNewInstance = LocalTime.newInstance(calendar.get(11), calendar.get(12));
                                        List list = (List) zzd(periods).get(dayOfWeek);
                                        if (list == null) {
                                            return Boolean.FALSE;
                                        }
                                        Iterator it2 = list.iterator();
                                        while (it2.hasNext()) {
                                            if (((zzok) it2.next()).zzd(localTimeNewInstance)) {
                                                return Boolean.TRUE;
                                            }
                                        }
                                        return Boolean.FALSE;
                                    }
                                }
                            }
                        }
                    } else {
                        Calendar calendar2 = Calendar.getInstance(timeZoneZze);
                        calendar2.set(date.getYear(), date.getMonth() - 1, date.getDay(), 0, 0);
                        long timeInMillis = calendar2.getTimeInMillis();
                        calendar2.set(date2.getYear(), date2.getMonth() - 1, date2.getDay(), 23, 59);
                        if (zzok.zzb(Long.valueOf(timeInMillis), Long.valueOf(calendar2.getTimeInMillis())).zzd(Long.valueOf(j11))) {
                        }
                        if (currentOpeningHours != null) {
                        }
                    }
                }
            }
        }
        return null;
    }

    @Deprecated
    public static Boolean zzb(Place place, long j11) {
        Place.BusinessStatus businessStatus = place.getBusinessStatus();
        OpeningHours openingHours = place.getOpeningHours();
        Integer utcOffsetMinutes = place.getUtcOffsetMinutes();
        if (businessStatus != null && businessStatus != Place.BusinessStatus.OPERATIONAL) {
            return Boolean.FALSE;
        }
        if (openingHours == null || utcOffsetMinutes == null) {
            return null;
        }
        List<Period> periods = openingHours.getPeriods();
        if (periods.isEmpty()) {
            return Boolean.FALSE;
        }
        if (zzf(periods)) {
            return Boolean.TRUE;
        }
        for (Period period : periods) {
            if (period.getOpen() == null || period.getClose() == null) {
                return null;
            }
        }
        TimeZone timeZoneZze = zze(utcOffsetMinutes.intValue());
        if (timeZoneZze == null) {
            return null;
        }
        Calendar calendar = Calendar.getInstance(timeZoneZze);
        calendar.setTimeInMillis(j11);
        DayOfWeek dayOfWeek = (DayOfWeek) zzb.get(Integer.valueOf(calendar.get(7)));
        LocalTime localTimeNewInstance = LocalTime.newInstance(calendar.get(11), calendar.get(12));
        List list = (List) zzd(periods).get(dayOfWeek);
        if (list == null) {
            return Boolean.FALSE;
        }
        Iterator it = list.iterator();
        while (it.hasNext()) {
            if (((zzok) it.next()).zzd(localTimeNewInstance)) {
                return Boolean.TRUE;
            }
        }
        return Boolean.FALSE;
    }

    private static Object zzc(Map map, Object obj, Object obj2) {
        return map.containsKey(obj) ? map.get(obj) : obj2;
    }

    private static Map zzd(List list) {
        EnumMap enumMap = new EnumMap(DayOfWeek.class);
        if (!list.isEmpty()) {
            Period periodBuild = (Period) list.get(0);
            int i5 = 0;
            while (periodBuild != null) {
                TimeOfWeek open = periodBuild.getOpen();
                TimeOfWeek close = periodBuild.getClose();
                if (open == null || close == null) {
                    i5++;
                    periodBuild = i5 >= list.size() ? null : (Period) list.get(i5);
                } else {
                    DayOfWeek day = open.getDay();
                    LocalTime time = open.getTime();
                    if (open.getDay() != close.getDay()) {
                        LocalTime localTime = zzc;
                        List list2 = (List) zzc(enumMap, day, new ArrayList());
                        list2.add(zzok.zzb(time, localTime));
                        enumMap.put((EnumMap) day, (DayOfWeek) list2);
                        TimeOfWeek timeOfWeekNewInstance = TimeOfWeek.newInstance(DayOfWeek.values()[(day.ordinal() + 1) % 7], LocalTime.newInstance(0, 0));
                        TimeOfWeek close2 = periodBuild.getClose();
                        Period.Builder builder = Period.builder();
                        builder.setOpen(timeOfWeekNewInstance);
                        builder.setClose(close2);
                        periodBuild = builder.build();
                    } else {
                        i5++;
                        LocalTime time2 = close.getTime();
                        List list3 = (List) zzc(enumMap, day, new ArrayList());
                        list3.add(zzok.zzc(time, time2));
                        enumMap.put((EnumMap) day, (DayOfWeek) list3);
                        if (i5 < list.size()) {
                            periodBuild = (Period) list.get(i5);
                        }
                    }
                }
            }
        }
        return enumMap;
    }

    private static TimeZone zze(int i5) {
        String[] availableIDs = TimeZone.getAvailableIDs((int) TimeUnit.MINUTES.toMillis(i5));
        if (availableIDs != null && availableIDs.length > 0) {
            return TimeZone.getTimeZone(availableIDs[0]);
        }
        Log.w("Places", String.format("Cannot find timezone that associates with utcOffsetMinutes %d from Place object.", Integer.valueOf(i5)));
        return null;
    }

    private static boolean zzf(List list) {
        if (list.size() != 1) {
            return false;
        }
        Period period = (Period) list.get(0);
        TimeOfWeek open = period.getOpen();
        return period.getClose() == null && open != null && open.getDay() == DayOfWeek.SUNDAY && open.getTime().getHours() == 0 && open.getTime().getMinutes() == 0;
    }
}
