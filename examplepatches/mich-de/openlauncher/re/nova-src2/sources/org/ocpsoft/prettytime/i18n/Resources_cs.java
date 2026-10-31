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
public class Resources_cs extends ListResourceBundle implements d {

    /* renamed from: a, reason: collision with root package name */
    public static final Object[][] f80639a = {new Object[]{"CenturyPattern", "%n %u"}, new Object[]{"CenturyFuturePrefix", "za "}, new Object[]{"CenturyFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"CenturyPastPrefix", "před "}, new Object[]{"CenturyPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"CenturySingularName", "století"}, new Object[]{"CenturyPluralName", "století"}, new Object[]{"CenturyPastSingularName", "stoletím"}, new Object[]{"CenturyPastPluralName", "stoletími"}, new Object[]{"CenturyFutureSingularName", "století"}, new Object[]{"CenturyFuturePluralName", "století"}, new Object[]{"DayPattern", "%n %u"}, new Object[]{"DayFuturePrefix", "za "}, new Object[]{"DayFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"DayPastPrefix", "před "}, new Object[]{"DayPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"DaySingularName", "den"}, new Object[]{"DayPluralName", "dny"}, new Object[]{"DecadePattern", "%n %u"}, new Object[]{"DecadeFuturePrefix", "za "}, new Object[]{"DecadeFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"DecadePastPrefix", "před "}, new Object[]{"DecadePastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"DecadeSingularName", "desetiletí"}, new Object[]{"DecadePluralName", "desetiletí"}, new Object[]{"DecadePastSingularName", "desetiletím"}, new Object[]{"DecadePastPluralName", "desetiletími"}, new Object[]{"DecadeFutureSingularName", "desetiletí"}, new Object[]{"DecadeFuturePluralName", "desetiletí"}, new Object[]{"HourPattern", "%n %u"}, new Object[]{"HourFuturePrefix", "za "}, new Object[]{"HourFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"HourPastPrefix", "před"}, new Object[]{"HourPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"HourSingularName", "hodina"}, new Object[]{"HourPluralName", "hodiny"}, new Object[]{"JustNowPattern", "%u"}, new Object[]{"JustNowFuturePrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"JustNowFutureSuffix", "za chvíli"}, new Object[]{"JustNowPastPrefix", "před chvílí"}, new Object[]{"JustNowPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"JustNowSingularName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"JustNowPluralName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillenniumPattern", "%n %u"}, new Object[]{"MillenniumFuturePrefix", "za "}, new Object[]{"MillenniumFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillenniumPastPrefix", "před "}, new Object[]{"MillenniumPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillenniumSingularName", "tisíciletí"}, new Object[]{"MillenniumPluralName", "tisíciletí"}, new Object[]{"MillisecondPattern", "%n %u"}, new Object[]{"MillisecondFuturePrefix", "za "}, new Object[]{"MillisecondFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillisecondPastPrefix", "před "}, new Object[]{"MillisecondPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillisecondSingularName", "milisekunda"}, new Object[]{"MillisecondPluralName", "milisekundy"}, new Object[]{"MillisecondPastSingularName", "milisekundou"}, new Object[]{"MillisecondPastPluralName", "milisekundami"}, new Object[]{"MillisecondFutureSingularName", "milisekundu"}, new Object[]{"MillisecondFuturePluralName", "milisekund"}, new Object[]{"MinutePattern", "%n %u"}, new Object[]{"MinuteFuturePrefix", "za "}, new Object[]{"MinuteFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MinutePastPrefix", "před "}, new Object[]{"MinutePastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MinuteSingularName", "minuta"}, new Object[]{"MinutePluralName", "minuty"}, new Object[]{"MonthPattern", "%n %u"}, new Object[]{"MonthFuturePrefix", "za "}, new Object[]{"MonthFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MonthPastPrefix", "před "}, new Object[]{"MonthPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MonthSingularName", "měsíc"}, new Object[]{"MonthPluralName", "měsíce"}, new Object[]{"SecondPattern", "%n %u"}, new Object[]{"SecondFuturePrefix", "za "}, new Object[]{"SecondFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"SecondPastPrefix", "před "}, new Object[]{"SecondPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"SecondSingularName", "sekunda"}, new Object[]{"SecondPluralName", "sekundy"}, new Object[]{"WeekPattern", "%n %u"}, new Object[]{"WeekFuturePrefix", "za "}, new Object[]{"WeekFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"WeekPastPrefix", "před "}, new Object[]{"WeekPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"WeekSingularName", "týden"}, new Object[]{"WeekPluralName", "týdny"}, new Object[]{"YearPattern", "%n %u"}, new Object[]{"YearFuturePrefix", "za "}, new Object[]{"YearFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"YearPastPrefix", "před "}, new Object[]{"YearPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"YearSingularName", "rok"}, new Object[]{"YearPluralName", "roky"}, new Object[]{"AbstractTimeUnitPattern", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitFuturePrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitPastPrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitSingularName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitPluralName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}};

    public static class CsName implements Comparable<CsName> {

        /* renamed from: a, reason: collision with root package name */
        public final boolean f80640a;

        /* renamed from: b, reason: collision with root package name */
        public final String f80641b;

        /* renamed from: c, reason: collision with root package name */
        public final Long f80642c;

        public CsName(boolean z11, String str, Long l9) {
            this.f80640a = z11;
            this.f80641b = str;
            this.f80642c = l9;
        }

        @Override // java.lang.Comparable
        public final int compareTo(CsName csName) {
            Long l9 = csName.f80642c;
            l9.longValue();
            return this.f80642c.compareTo(l9);
        }
    }

    public static class CsTimeFormat extends xa0.a {
        public final ArrayList n = new ArrayList();
        public final ArrayList o = new ArrayList();

        public CsTimeFormat(String str, Resources_cs resources_cs, ArrayList arrayList) {
            this.f95743h = resources_cs.getString(str + "Pattern");
            this.f95744i = resources_cs.getString(str + "FuturePrefix").trim();
            this.f95745j = resources_cs.getString(str + "FutureSuffix").trim();
            this.f95746k = resources_cs.getString(str + "PastPrefix").trim();
            this.f95747l = resources_cs.getString(str + "PastSuffix").trim();
            this.f95737b = resources_cs.getString(str + "SingularName");
            this.f95738c = resources_cs.getString(str + "PluralName");
            try {
                this.f95740e = resources_cs.getString(str + "FuturePluralName");
            } catch (Exception unused) {
            }
            try {
                this.f95739d = resources_cs.getString(str + "FutureSingularName");
            } catch (Exception unused2) {
            }
            try {
                this.f95742g = resources_cs.getString(str + "PastPluralName");
            } catch (Exception unused3) {
            }
            try {
                this.f95741f = resources_cs.getString(str + "PastSingularName");
            } catch (Exception unused4) {
            }
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                CsName csName = (CsName) it.next();
                if (csName.f80640a) {
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
                if (csName.f80642c.longValue() >= j11) {
                    return csName.f80641b;
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
        public final ArrayList f80643a = new ArrayList();

        /* renamed from: b, reason: collision with root package name */
        public final String f80644b;

        public CsTimeFormatBuilder(String str) {
            this.f80644b = str;
        }

        public final void a(long j11, boolean z11, String str) {
            this.f80643a.add(new CsName(z11, str, Long.valueOf(j11)));
        }

        public final CsTimeFormat b(Resources_cs resources_cs) {
            return new CsTimeFormat(this.f80644b, resources_cs, this.f80643a);
        }
    }

    @Override // ya0.d
    public final c a(ya0.c cVar) {
        if (cVar instanceof Minute) {
            CsTimeFormatBuilder csTimeFormatBuilder = new CsTimeFormatBuilder("Minute");
            csTimeFormatBuilder.a(1L, true, "minutu");
            csTimeFormatBuilder.a(4L, true, "minuty");
            csTimeFormatBuilder.a(Long.MAX_VALUE, true, "minut");
            csTimeFormatBuilder.a(1L, false, "minutou");
            csTimeFormatBuilder.a(Long.MAX_VALUE, false, "minutami");
            return csTimeFormatBuilder.b(this);
        }
        if (cVar instanceof Hour) {
            CsTimeFormatBuilder csTimeFormatBuilder2 = new CsTimeFormatBuilder("Hour");
            csTimeFormatBuilder2.a(1L, true, "hodinu");
            csTimeFormatBuilder2.a(4L, true, "hodiny");
            csTimeFormatBuilder2.a(Long.MAX_VALUE, true, "hodin");
            csTimeFormatBuilder2.a(1L, false, "hodinou");
            csTimeFormatBuilder2.a(Long.MAX_VALUE, false, "hodinami");
            return csTimeFormatBuilder2.b(this);
        }
        if (cVar instanceof Day) {
            CsTimeFormatBuilder csTimeFormatBuilder3 = new CsTimeFormatBuilder("Day");
            csTimeFormatBuilder3.a(1L, true, "den");
            csTimeFormatBuilder3.a(4L, true, "dny");
            csTimeFormatBuilder3.a(Long.MAX_VALUE, true, "dní");
            csTimeFormatBuilder3.a(1L, false, "dnem");
            csTimeFormatBuilder3.a(Long.MAX_VALUE, false, "dny");
            return csTimeFormatBuilder3.b(this);
        }
        if (cVar instanceof Week) {
            CsTimeFormatBuilder csTimeFormatBuilder4 = new CsTimeFormatBuilder("Week");
            csTimeFormatBuilder4.a(1L, true, "týden");
            csTimeFormatBuilder4.a(4L, true, "týdny");
            csTimeFormatBuilder4.a(Long.MAX_VALUE, true, "týdnů");
            csTimeFormatBuilder4.a(1L, false, "týdnem");
            csTimeFormatBuilder4.a(Long.MAX_VALUE, false, "týdny");
            return csTimeFormatBuilder4.b(this);
        }
        if (cVar instanceof Month) {
            CsTimeFormatBuilder csTimeFormatBuilder5 = new CsTimeFormatBuilder("Month");
            csTimeFormatBuilder5.a(1L, true, "měsíc");
            csTimeFormatBuilder5.a(4L, true, "měsíce");
            csTimeFormatBuilder5.a(Long.MAX_VALUE, true, "měsíců");
            csTimeFormatBuilder5.a(1L, false, "měsícem");
            csTimeFormatBuilder5.a(Long.MAX_VALUE, false, "měsíci");
            return csTimeFormatBuilder5.b(this);
        }
        if (!(cVar instanceof Year)) {
            return null;
        }
        CsTimeFormatBuilder csTimeFormatBuilder6 = new CsTimeFormatBuilder("Year");
        csTimeFormatBuilder6.a(1L, true, "rok");
        csTimeFormatBuilder6.a(4L, true, "roky");
        csTimeFormatBuilder6.a(Long.MAX_VALUE, true, "let");
        csTimeFormatBuilder6.a(1L, false, "rokem");
        csTimeFormatBuilder6.a(Long.MAX_VALUE, false, "roky");
        return csTimeFormatBuilder6.b(this);
    }

    @Override // java.util.ListResourceBundle
    public final Object[][] getContents() {
        return f80639a;
    }
}
