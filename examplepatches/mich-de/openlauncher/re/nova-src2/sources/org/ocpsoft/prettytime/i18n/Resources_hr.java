package org.ocpsoft.prettytime.i18n;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.ListResourceBundle;
import org.ocpsoft.prettytime.units.Day;
import org.ocpsoft.prettytime.units.Hour;
import org.ocpsoft.prettytime.units.Millennium;
import org.ocpsoft.prettytime.units.Minute;
import org.ocpsoft.prettytime.units.Month;
import org.ocpsoft.prettytime.units.Week;
import org.ocpsoft.prettytime.units.Year;
import wa0.c;
import ya0.d;

/* loaded from: classes5.dex */
public class Resources_hr extends ListResourceBundle implements d {

    /* renamed from: a, reason: collision with root package name */
    public static final Object[][] f80662a = {new Object[]{"CenturyPattern", "%n %u"}, new Object[]{"CenturyFuturePrefix", "za "}, new Object[]{"CenturyFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"CenturyPastPrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"CenturyPastSuffix", " unatrag"}, new Object[]{"CenturySingularName", "stoljeće"}, new Object[]{"CenturyPluralName", "stoljeća"}, new Object[]{"DayPattern", "%n %u"}, new Object[]{"DayFuturePrefix", "za "}, new Object[]{"DayFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"DayPastPrefix", "prije "}, new Object[]{"DayPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"DaySingularName", "dan"}, new Object[]{"DayPluralName", "dana"}, new Object[]{"DecadePattern", "%n %u"}, new Object[]{"DecadeFuturePrefix", "za "}, new Object[]{"DecadeFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"DecadePastPrefix", "prije "}, new Object[]{"DecadePastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"DecadeSingularName", "desetljeće"}, new Object[]{"DecadePluralName", "desetljeća"}, new Object[]{"HourPattern", "%n %u"}, new Object[]{"HourFuturePrefix", "za "}, new Object[]{"HourFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"HourPastPrefix", "prije "}, new Object[]{"HourPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"HourSingularName", "sat"}, new Object[]{"HourPluralName", "sati"}, new Object[]{"JustNowPattern", "%u"}, new Object[]{"JustNowFuturePrefix", "za nekoliko trenutaka"}, new Object[]{"JustNowFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"JustNowPastPrefix", "prije nekoliko trenutaka"}, new Object[]{"JustNowPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"JustNowSingularName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"JustNowPluralName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillenniumPattern", "%n %u"}, new Object[]{"MillenniumFuturePrefix", "za "}, new Object[]{"MillenniumFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillenniumPastPrefix", "prije "}, new Object[]{"MillenniumPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillenniumSingularName", "tisućljeće"}, new Object[]{"MillenniumPluralName", "tisućljeća"}, new Object[]{"MillisecondPattern", "%n %u"}, new Object[]{"MillisecondFuturePrefix", "za "}, new Object[]{"MillisecondFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillisecondPastPrefix", "prije "}, new Object[]{"MillisecondPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillisecondSingularName", "milisekunda"}, new Object[]{"MillisecondPluralName", "milisekunda"}, new Object[]{"MinutePattern", "%n %u"}, new Object[]{"MinuteFuturePrefix", "za "}, new Object[]{"MinuteFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MinutePastPrefix", "prije "}, new Object[]{"MinutePastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MinuteSingularName", "minuta"}, new Object[]{"MinutePluralName", "minuta"}, new Object[]{"MonthPattern", "%n %u"}, new Object[]{"MonthFuturePrefix", "za "}, new Object[]{"MonthFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MonthPastPrefix", "prije "}, new Object[]{"MonthPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MonthSingularName", "mjesec"}, new Object[]{"MonthPluralName", "mjeseca"}, new Object[]{"SecondPattern", "%n %u"}, new Object[]{"SecondFuturePrefix", "za "}, new Object[]{"SecondFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"SecondPastPrefix", "prije "}, new Object[]{"SecondPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"SecondSingularName", "sekunda"}, new Object[]{"SecondPluralName", "sekundi"}, new Object[]{"WeekPattern", "%n %u"}, new Object[]{"WeekFuturePrefix", "za "}, new Object[]{"WeekFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"WeekPastPrefix", "prije "}, new Object[]{"WeekPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"WeekSingularName", "tjedan"}, new Object[]{"WeekPluralName", "tjedna"}, new Object[]{"YearPattern", "%n %u"}, new Object[]{"YearFuturePrefix", "za "}, new Object[]{"YearFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"YearPastPrefix", "prije "}, new Object[]{"YearPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"YearSingularName", "godina"}, new Object[]{"YearPluralName", "godina"}, new Object[]{"AbstractTimeUnitPattern", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitFuturePrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitPastPrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitSingularName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitPluralName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}};

    public static class HrName implements Comparable<HrName> {

        /* renamed from: a, reason: collision with root package name */
        public final boolean f80663a;

        /* renamed from: b, reason: collision with root package name */
        public final Long f80664b;

        /* renamed from: c, reason: collision with root package name */
        public final String f80665c;

        public HrName(boolean z11, String str, Long l9) {
            this.f80663a = z11;
            this.f80665c = str;
            this.f80664b = l9;
        }

        @Override // java.lang.Comparable
        public final int compareTo(HrName hrName) {
            Long l9 = hrName.f80664b;
            l9.longValue();
            return this.f80664b.compareTo(l9);
        }
    }

    public static class HrTimeFormat extends xa0.a {
        public final ArrayList n = new ArrayList();
        public final ArrayList o = new ArrayList();

        public HrTimeFormat(String str, Resources_hr resources_hr, ArrayList arrayList) {
            this.f95743h = resources_hr.getString(str + "Pattern");
            this.f95744i = resources_hr.getString(str + "FuturePrefix").trim();
            this.f95745j = resources_hr.getString(str + "FutureSuffix").trim();
            this.f95746k = resources_hr.getString(str + "PastPrefix").trim();
            this.f95747l = resources_hr.getString(str + "PastSuffix").trim();
            this.f95737b = resources_hr.getString(str + "SingularName");
            this.f95738c = resources_hr.getString(str + "PluralName");
            try {
                this.f95740e = resources_hr.getString(str + "FuturePluralName");
            } catch (Exception unused) {
            }
            try {
                this.f95739d = resources_hr.getString(str + "FutureSingularName");
            } catch (Exception unused2) {
            }
            try {
                this.f95742g = resources_hr.getString(str + "PastPluralName");
            } catch (Exception unused3) {
            }
            try {
                this.f95741f = resources_hr.getString(str + "PastSingularName");
            } catch (Exception unused4) {
            }
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                HrName hrName = (HrName) it.next();
                if (hrName.f80663a) {
                    this.n.add(hrName);
                } else {
                    this.o.add(hrName);
                }
            }
            Collections.sort(this.n);
            Collections.sort(this.o);
        }

        public static String g(ArrayList arrayList, long j11) {
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                HrName hrName = (HrName) it.next();
                if (hrName.f80664b.longValue() >= j11) {
                    return hrName.f80665c;
                }
            }
            throw new IllegalStateException("Invalid resource bundle configuration");
        }

        @Override // xa0.a
        public final String d(ya0.a aVar) {
            long jAbs = Math.abs(Math.abs(aVar.b()));
            return aVar.d() ? g(this.n, jAbs) : g(this.o, jAbs);
        }
    }

    public static class HrTimeFormatBuilder {

        /* renamed from: a, reason: collision with root package name */
        public final ArrayList f80666a = new ArrayList();

        /* renamed from: b, reason: collision with root package name */
        public final String f80667b;

        public HrTimeFormatBuilder(String str) {
            this.f80667b = str;
        }

        public final void a(long j11, boolean z11, String str) {
            this.f80666a.add(new HrName(z11, str, Long.valueOf(j11)));
        }

        public final HrTimeFormat b(Resources_hr resources_hr) {
            return new HrTimeFormat(this.f80667b, resources_hr, this.f80666a);
        }
    }

    @Override // ya0.d
    public final c a(ya0.c cVar) {
        if (cVar instanceof Minute) {
            HrTimeFormatBuilder hrTimeFormatBuilder = new HrTimeFormatBuilder("Minute");
            hrTimeFormatBuilder.a(1L, true, "minutu");
            hrTimeFormatBuilder.a(1L, false, "minutu");
            hrTimeFormatBuilder.a(4L, true, "minute");
            hrTimeFormatBuilder.a(4L, false, "minute");
            hrTimeFormatBuilder.a(Long.MAX_VALUE, true, "minuta");
            hrTimeFormatBuilder.a(Long.MAX_VALUE, false, "minuta");
            return hrTimeFormatBuilder.b(this);
        }
        if (cVar instanceof Hour) {
            HrTimeFormatBuilder hrTimeFormatBuilder2 = new HrTimeFormatBuilder("Hour");
            hrTimeFormatBuilder2.a(1L, true, "sat");
            hrTimeFormatBuilder2.a(1L, false, "sat");
            hrTimeFormatBuilder2.a(4L, true, "sata");
            hrTimeFormatBuilder2.a(4L, false, "sata");
            hrTimeFormatBuilder2.a(Long.MAX_VALUE, true, "sati");
            hrTimeFormatBuilder2.a(Long.MAX_VALUE, false, "sati");
            return hrTimeFormatBuilder2.b(this);
        }
        if (cVar instanceof Day) {
            HrTimeFormatBuilder hrTimeFormatBuilder3 = new HrTimeFormatBuilder("Day");
            hrTimeFormatBuilder3.a(1L, true, "dan");
            hrTimeFormatBuilder3.a(1L, false, "dan");
            hrTimeFormatBuilder3.a(4L, true, "dana");
            hrTimeFormatBuilder3.a(4L, false, "dana");
            hrTimeFormatBuilder3.a(Long.MAX_VALUE, true, "dana");
            hrTimeFormatBuilder3.a(Long.MAX_VALUE, false, "dana");
            return hrTimeFormatBuilder3.b(this);
        }
        if (cVar instanceof Week) {
            HrTimeFormatBuilder hrTimeFormatBuilder4 = new HrTimeFormatBuilder("Week");
            hrTimeFormatBuilder4.a(1L, true, "tjedan");
            hrTimeFormatBuilder4.a(1L, false, "tjedan");
            hrTimeFormatBuilder4.a(4L, true, "tjedna");
            hrTimeFormatBuilder4.a(4L, false, "tjedna");
            hrTimeFormatBuilder4.a(Long.MAX_VALUE, true, "tjedana");
            hrTimeFormatBuilder4.a(Long.MAX_VALUE, false, "tjedana");
            return hrTimeFormatBuilder4.b(this);
        }
        if (cVar instanceof Month) {
            HrTimeFormatBuilder hrTimeFormatBuilder5 = new HrTimeFormatBuilder("Month");
            hrTimeFormatBuilder5.a(1L, true, "mjesec");
            hrTimeFormatBuilder5.a(1L, false, "mjesec");
            hrTimeFormatBuilder5.a(4L, true, "mjeseca");
            hrTimeFormatBuilder5.a(4L, false, "mjeseca");
            hrTimeFormatBuilder5.a(Long.MAX_VALUE, true, "mjeseci");
            hrTimeFormatBuilder5.a(Long.MAX_VALUE, false, "mjeseci");
            return hrTimeFormatBuilder5.b(this);
        }
        if (cVar instanceof Year) {
            HrTimeFormatBuilder hrTimeFormatBuilder6 = new HrTimeFormatBuilder("Year");
            hrTimeFormatBuilder6.a(1L, true, "godinu");
            hrTimeFormatBuilder6.a(1L, false, "godinu");
            hrTimeFormatBuilder6.a(4L, true, "godine");
            hrTimeFormatBuilder6.a(4L, false, "godine");
            hrTimeFormatBuilder6.a(Long.MAX_VALUE, true, "godina");
            hrTimeFormatBuilder6.a(Long.MAX_VALUE, false, "godina");
            return hrTimeFormatBuilder6.b(this);
        }
        if (!(cVar instanceof Millennium)) {
            return null;
        }
        HrTimeFormatBuilder hrTimeFormatBuilder7 = new HrTimeFormatBuilder("Millennium");
        hrTimeFormatBuilder7.a(1L, true, "tisućljeće");
        hrTimeFormatBuilder7.a(1L, false, "tisućljeće");
        hrTimeFormatBuilder7.a(Long.MAX_VALUE, true, "tisućljeća");
        hrTimeFormatBuilder7.a(Long.MAX_VALUE, false, "tisućljeća");
        return hrTimeFormatBuilder7.b(this);
    }

    @Override // java.util.ListResourceBundle
    public final Object[][] getContents() {
        return f80662a;
    }
}
