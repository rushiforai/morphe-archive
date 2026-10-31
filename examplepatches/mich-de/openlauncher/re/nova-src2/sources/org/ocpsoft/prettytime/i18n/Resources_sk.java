package org.ocpsoft.prettytime.i18n;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.ListResourceBundle;
import org.ocpsoft.prettytime.units.Day;
import org.ocpsoft.prettytime.units.Hour;
import org.ocpsoft.prettytime.units.Minute;
import org.ocpsoft.prettytime.units.Month;
import org.ocpsoft.prettytime.units.Week;
import org.ocpsoft.prettytime.units.Year;
import wa0.c;
import ya0.d;

/* loaded from: classes5.dex */
public class Resources_sk extends ListResourceBundle implements d {

    /* renamed from: a, reason: collision with root package name */
    public static final Object[][] f80700a = {new Object[]{"CenturyPattern", "%n %u"}, new Object[]{"CenturyFuturePrefix", "o "}, new Object[]{"CenturyFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"CenturyPastPrefix", "pred "}, new Object[]{"CenturyPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"CenturySingularName", "storočie"}, new Object[]{"CenturyPluralName", "storočia"}, new Object[]{"CenturyPastSingularName", "storočím"}, new Object[]{"CenturyPastPluralName", "storočiami"}, new Object[]{"CenturyFutureSingularName", "storočí"}, new Object[]{"CenturyFuturePluralName", "storočia"}, new Object[]{"DayPattern", "%n %u"}, new Object[]{"DayFuturePrefix", "o "}, new Object[]{"DayFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"DayPastPrefix", "pred "}, new Object[]{"DayPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"DaySingularName", "deň"}, new Object[]{"DayPluralName", "dni"}, new Object[]{"DecadePattern", "%n %u"}, new Object[]{"DecadeFuturePrefix", "o "}, new Object[]{"DecadeFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"DecadePastPrefix", "pred "}, new Object[]{"DecadePastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"DecadeSingularName", "desaťročie"}, new Object[]{"DecadePluralName", "desaťročia"}, new Object[]{"DecadePastSingularName", "desaťročím"}, new Object[]{"DecadePastPluralName", "desaťročiami"}, new Object[]{"DecadeFutureSingularName", "desaťročí"}, new Object[]{"DecadeFuturePluralName", "desaťročia"}, new Object[]{"HourPattern", "%n %u"}, new Object[]{"HourFuturePrefix", "o "}, new Object[]{"HourFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"HourPastPrefix", "pred"}, new Object[]{"HourPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"HourSingularName", "hodina"}, new Object[]{"HourPluralName", "hodiny"}, new Object[]{"JustNowPattern", "%u"}, new Object[]{"JustNowFuturePrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"JustNowFutureSuffix", "o chvíľu"}, new Object[]{"JustNowPastPrefix", "pred chvíľou"}, new Object[]{"JustNowPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"JustNowSingularName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"JustNowPluralName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillenniumPattern", "%n %u"}, new Object[]{"MillenniumFuturePrefix", "o "}, new Object[]{"MillenniumFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillenniumPastPrefix", "pred "}, new Object[]{"MillenniumPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillenniumSingularName", "tísícročie"}, new Object[]{"MillenniumPluralName", "tisícročia"}, new Object[]{"MillisecondPattern", "%n %u"}, new Object[]{"MillisecondFuturePrefix", "o "}, new Object[]{"MillisecondFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillisecondPastPrefix", "pred "}, new Object[]{"MillisecondPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillisecondSingularName", "milisekunda"}, new Object[]{"MillisecondPluralName", "milisekundy"}, new Object[]{"MillisecondPastSingularName", "milisekundou"}, new Object[]{"MillisecondPastPluralName", "milisekundami"}, new Object[]{"MillisecondFutureSingularName", "milisekundu"}, new Object[]{"MillisecondFuturePluralName", "milisekúnd"}, new Object[]{"MinutePattern", "%n %u"}, new Object[]{"MinuteFuturePrefix", "o "}, new Object[]{"MinuteFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MinutePastPrefix", "pred "}, new Object[]{"MinutePastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MinuteSingularName", "minúta"}, new Object[]{"MinutePluralName", "minúty"}, new Object[]{"MonthPattern", "%n %u"}, new Object[]{"MonthFuturePrefix", "o "}, new Object[]{"MonthFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MonthPastPrefix", "pred "}, new Object[]{"MonthPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MonthSingularName", "mesiac"}, new Object[]{"MonthPluralName", "mesiace"}, new Object[]{"SecondPattern", "%n %u"}, new Object[]{"SecondFuturePrefix", "o "}, new Object[]{"SecondFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"SecondPastPrefix", "pred "}, new Object[]{"SecondPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"SecondSingularName", "sekunda"}, new Object[]{"SecondPluralName", "sekundy"}, new Object[]{"WeekPattern", "%n %u"}, new Object[]{"WeekFuturePrefix", "o "}, new Object[]{"WeekFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"WeekPastPrefix", "pred "}, new Object[]{"WeekPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"WeekSingularName", "týždeň"}, new Object[]{"WeekPluralName", "týždne"}, new Object[]{"YearPattern", "%n %u"}, new Object[]{"YearFuturePrefix", "o "}, new Object[]{"YearFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"YearPastPrefix", "pred "}, new Object[]{"YearPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"YearSingularName", "rok"}, new Object[]{"YearPluralName", "roky"}, new Object[]{"AbstractTimeUnitPattern", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitFuturePrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitPastPrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitSingularName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitPluralName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}};

    public static class CsName implements Comparable<CsName> {

        /* renamed from: a, reason: collision with root package name */
        public final boolean f80701a;

        /* renamed from: b, reason: collision with root package name */
        public final String f80702b;

        /* renamed from: c, reason: collision with root package name */
        public final Long f80703c;

        public CsName(boolean z11, String str, Long l9) {
            this.f80701a = z11;
            this.f80702b = str;
            this.f80703c = l9;
        }

        @Override // java.lang.Comparable
        public final int compareTo(CsName csName) {
            Long l9 = csName.f80703c;
            l9.longValue();
            return this.f80703c.compareTo(l9);
        }
    }

    public static class CsTimeFormat extends xa0.a {
        public final ArrayList n = new ArrayList();
        public final ArrayList o = new ArrayList();

        public CsTimeFormat(String str, Resources_sk resources_sk, ArrayList arrayList) {
            this.f95743h = resources_sk.getString(str + "Pattern");
            this.f95744i = resources_sk.getString(str + "FuturePrefix").trim();
            this.f95745j = resources_sk.getString(str + "FutureSuffix").trim();
            this.f95746k = resources_sk.getString(str + "PastPrefix").trim();
            this.f95747l = resources_sk.getString(str + "PastSuffix").trim();
            this.f95737b = resources_sk.getString(str + "SingularName");
            this.f95738c = resources_sk.getString(str + "PluralName");
            try {
                this.f95740e = resources_sk.getString(str + "FuturePluralName");
            } catch (Exception unused) {
            }
            try {
                this.f95739d = resources_sk.getString(str + "FutureSingularName");
            } catch (Exception unused2) {
            }
            try {
                this.f95742g = resources_sk.getString(str + "PastPluralName");
            } catch (Exception unused3) {
            }
            try {
                this.f95741f = resources_sk.getString(str + "PastSingularName");
            } catch (Exception unused4) {
            }
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                CsName csName = (CsName) it.next();
                if (csName.f80701a) {
                    this.n.add(csName);
                } else {
                    this.o.add(csName);
                }
            }
            Collections.sort(this.n);
            Collections.sort(this.o);
        }

        public static String g(ArrayList arrayList, long j11) {
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                CsName csName = (CsName) it.next();
                if (csName.f80703c.longValue() >= j11) {
                    return csName.f80702b;
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

    public static class CsTimeFormatBuilder {

        /* renamed from: a, reason: collision with root package name */
        public final ArrayList f80704a = new ArrayList();

        /* renamed from: b, reason: collision with root package name */
        public final String f80705b;

        public CsTimeFormatBuilder(String str) {
            this.f80705b = str;
        }

        public final void a(long j11, boolean z11, String str) {
            this.f80704a.add(new CsName(z11, str, Long.valueOf(j11)));
        }

        public final CsTimeFormat b(Resources_sk resources_sk) {
            return new CsTimeFormat(this.f80705b, resources_sk, this.f80704a);
        }
    }

    @Override // ya0.d
    public final c a(ya0.c cVar) {
        if (cVar instanceof Minute) {
            CsTimeFormatBuilder csTimeFormatBuilder = new CsTimeFormatBuilder("Minute");
            csTimeFormatBuilder.a(1L, true, "minútu");
            csTimeFormatBuilder.a(4L, true, "minúty");
            csTimeFormatBuilder.a(Long.MAX_VALUE, true, "minút");
            csTimeFormatBuilder.a(1L, false, "minútou");
            csTimeFormatBuilder.a(Long.MAX_VALUE, false, "minútami");
            return csTimeFormatBuilder.b(this);
        }
        if (cVar instanceof Hour) {
            CsTimeFormatBuilder csTimeFormatBuilder2 = new CsTimeFormatBuilder("Hour");
            csTimeFormatBuilder2.a(1L, true, "hodinu");
            csTimeFormatBuilder2.a(4L, true, "hodiny");
            csTimeFormatBuilder2.a(Long.MAX_VALUE, true, "hodín");
            csTimeFormatBuilder2.a(1L, false, "hodinou");
            csTimeFormatBuilder2.a(Long.MAX_VALUE, false, "hodinami");
            return csTimeFormatBuilder2.b(this);
        }
        if (cVar instanceof Day) {
            CsTimeFormatBuilder csTimeFormatBuilder3 = new CsTimeFormatBuilder("Day");
            csTimeFormatBuilder3.a(1L, true, "deň");
            csTimeFormatBuilder3.a(4L, true, "dni");
            csTimeFormatBuilder3.a(Long.MAX_VALUE, true, "dní");
            csTimeFormatBuilder3.a(1L, false, "dňom");
            csTimeFormatBuilder3.a(Long.MAX_VALUE, false, "dňami");
            return csTimeFormatBuilder3.b(this);
        }
        if (cVar instanceof Week) {
            CsTimeFormatBuilder csTimeFormatBuilder4 = new CsTimeFormatBuilder("Week");
            csTimeFormatBuilder4.a(1L, true, "týždeň");
            csTimeFormatBuilder4.a(4L, true, "týždne");
            csTimeFormatBuilder4.a(Long.MAX_VALUE, true, "týždňov");
            csTimeFormatBuilder4.a(1L, false, "týždňom");
            csTimeFormatBuilder4.a(Long.MAX_VALUE, false, "týždňami");
            return csTimeFormatBuilder4.b(this);
        }
        if (cVar instanceof Month) {
            CsTimeFormatBuilder csTimeFormatBuilder5 = new CsTimeFormatBuilder("Month");
            csTimeFormatBuilder5.a(1L, true, "mesiac");
            csTimeFormatBuilder5.a(4L, true, "mesiace");
            csTimeFormatBuilder5.a(Long.MAX_VALUE, true, "mesiacov");
            csTimeFormatBuilder5.a(1L, false, "mesiacom");
            csTimeFormatBuilder5.a(Long.MAX_VALUE, false, "mesiacmi");
            return csTimeFormatBuilder5.b(this);
        }
        if (!(cVar instanceof Year)) {
            return null;
        }
        CsTimeFormatBuilder csTimeFormatBuilder6 = new CsTimeFormatBuilder("Year");
        csTimeFormatBuilder6.a(1L, true, "rok");
        csTimeFormatBuilder6.a(4L, true, "roky");
        csTimeFormatBuilder6.a(Long.MAX_VALUE, true, "rokov");
        csTimeFormatBuilder6.a(1L, false, "rokom");
        csTimeFormatBuilder6.a(Long.MAX_VALUE, false, "rokmi");
        return csTimeFormatBuilder6.b(this);
    }

    @Override // java.util.ListResourceBundle
    public final Object[][] getContents() {
        return f80700a;
    }
}
