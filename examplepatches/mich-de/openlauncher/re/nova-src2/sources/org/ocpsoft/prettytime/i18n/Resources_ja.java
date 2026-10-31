package org.ocpsoft.prettytime.i18n;

import b.c0;
import com.amplitude.core.events.Identify;
import java.util.ListResourceBundle;
import java.util.concurrent.ConcurrentHashMap;
import org.ocpsoft.prettytime.units.Decade;
import org.ocpsoft.prettytime.units.Millennium;
import wa0.c;
import ya0.d;

/* loaded from: classes5.dex */
public class Resources_ja extends ListResourceBundle implements d {

    /* renamed from: b, reason: collision with root package name */
    public static final Object[][] f80672b = {new Object[]{"CenturyPattern", "%n%u"}, new Object[]{"CenturyFuturePrefix", "今から"}, new Object[]{"CenturyFutureSuffix", "後"}, new Object[]{"CenturyPastPrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"CenturyPastSuffix", "前"}, new Object[]{"CenturySingularName", "世紀"}, new Object[]{"CenturyPluralName", "世紀"}, new Object[]{"DayPattern", "%n%u"}, new Object[]{"DayFuturePrefix", "今から"}, new Object[]{"DayFutureSuffix", "後"}, new Object[]{"DayPastPrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"DayPastSuffix", "前"}, new Object[]{"DaySingularName", "日"}, new Object[]{"DayPluralName", "日"}, new Object[]{"DecadePattern", "%n%u"}, new Object[]{"DecadeFuturePrefix", "今から"}, new Object[]{"DecadeFutureSuffix", "後"}, new Object[]{"DecadePastPrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"DecadePastSuffix", "前"}, new Object[]{"DecadeSingularName", "年"}, new Object[]{"DecadePluralName", "年"}, new Object[]{"HourPattern", "%n%u"}, new Object[]{"HourFuturePrefix", "今から"}, new Object[]{"HourFutureSuffix", "後"}, new Object[]{"HourPastPrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"HourPastSuffix", "前"}, new Object[]{"HourSingularName", "時間"}, new Object[]{"HourPluralName", "時間"}, new Object[]{"JustNowPattern", "%u"}, new Object[]{"JustNowFuturePrefix", "今から"}, new Object[]{"JustNowFutureSuffix", "すぐ"}, new Object[]{"JustNowPastPrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"JustNowPastSuffix", "たった今"}, new Object[]{"JustNowSingularName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"JustNowPluralName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillenniumPattern", "%n%u"}, new Object[]{"MillenniumFuturePrefix", "今から"}, new Object[]{"MillenniumFutureSuffix", "後"}, new Object[]{"MillenniumPastPrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillenniumPastSuffix", "前"}, new Object[]{"MillenniumSingularName", "年"}, new Object[]{"MillenniumPluralName", "年"}, new Object[]{"MillisecondPattern", "%n%u"}, new Object[]{"MillisecondFuturePrefix", "今から"}, new Object[]{"MillisecondFutureSuffix", "後"}, new Object[]{"MillisecondPastPrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillisecondPastSuffix", "前"}, new Object[]{"MillisecondSingularName", "ミリ秒"}, new Object[]{"MillisecondPluralName", "ミリ秒"}, new Object[]{"MinutePattern", "%n%u"}, new Object[]{"MinuteFuturePrefix", "今から"}, new Object[]{"MinuteFutureSuffix", "後"}, new Object[]{"MinutePastPrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MinutePastSuffix", "前"}, new Object[]{"MinuteSingularName", "分"}, new Object[]{"MinutePluralName", "分"}, new Object[]{"MonthPattern", "%n%u"}, new Object[]{"MonthFuturePrefix", "今から"}, new Object[]{"MonthFutureSuffix", "後"}, new Object[]{"MonthPastPrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MonthPastSuffix", "前"}, new Object[]{"MonthSingularName", "ヶ月"}, new Object[]{"MonthPluralName", "ヶ月"}, new Object[]{"SecondPattern", "%n%u"}, new Object[]{"SecondFuturePrefix", "今から"}, new Object[]{"SecondFutureSuffix", "後"}, new Object[]{"SecondPastPrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"SecondPastSuffix", "前"}, new Object[]{"SecondSingularName", "秒"}, new Object[]{"SecondPluralName", "秒"}, new Object[]{"WeekPattern", "%n%u"}, new Object[]{"WeekFuturePrefix", "今から"}, new Object[]{"WeekFutureSuffix", "後"}, new Object[]{"WeekPastPrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"WeekPastSuffix", "前"}, new Object[]{"WeekSingularName", "週間"}, new Object[]{"WeekPluralName", "週間"}, new Object[]{"YearPattern", "%n%u"}, new Object[]{"YearFuturePrefix", "今から"}, new Object[]{"YearFutureSuffix", "後"}, new Object[]{"YearPastPrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"YearPastSuffix", "前"}, new Object[]{"YearSingularName", "年"}, new Object[]{"YearPluralName", "年"}, new Object[]{"AbstractTimeUnitPattern", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitFuturePrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitPastPrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitSingularName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitPluralName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}};

    /* renamed from: a, reason: collision with root package name */
    public final ConcurrentHashMap f80673a = new ConcurrentHashMap();

    public static class JaTimeFormat implements c {

        /* renamed from: a, reason: collision with root package name */
        public String f80674a;

        /* renamed from: b, reason: collision with root package name */
        public String f80675b;

        /* renamed from: c, reason: collision with root package name */
        public String f80676c;

        /* renamed from: d, reason: collision with root package name */
        public String f80677d;

        /* renamed from: e, reason: collision with root package name */
        public String f80678e;

        /* renamed from: f, reason: collision with root package name */
        public String f80679f;

        /* renamed from: g, reason: collision with root package name */
        public String f80680g;

        /* renamed from: h, reason: collision with root package name */
        public String f80681h;

        /* renamed from: i, reason: collision with root package name */
        public String f80682i;

        /* renamed from: j, reason: collision with root package name */
        public String f80683j;

        /* renamed from: k, reason: collision with root package name */
        public String f80684k;

        @Override // wa0.c
        public final String b(ya0.a aVar, String str) {
            StringBuilder sb2 = new StringBuilder();
            if (aVar.e()) {
                sb2.append(this.f80683j);
                sb2.append(str);
                sb2.append(this.f80684k);
            } else {
                sb2.append(this.f80681h);
                sb2.append(str);
                sb2.append(this.f80682i);
            }
            return sb2.toString().replaceAll("\\s+", " ").trim();
        }

        @Override // wa0.c
        public final String c(ya0.a aVar) {
            String str;
            String str2;
            String str3 = aVar.f97219a < 0 ? Identify.UNSET_VALUE : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            String str4 = (!aVar.d() || (str2 = this.f80676c) == null || str2.length() <= 0) ? (!aVar.e() || (str = this.f80678e) == null || str.length() <= 0) ? this.f80674a : this.f80678e : this.f80676c;
            if (Math.abs(Math.abs(aVar.b())) == 0 || Math.abs(Math.abs(aVar.b())) > 1) {
                str4 = (!aVar.d() || this.f80677d == null || this.f80676c.length() <= 0) ? (!aVar.e() || this.f80679f == null || this.f80678e.length() <= 0) ? this.f80675b : this.f80679f : this.f80677d;
            }
            long jAbs = Math.abs(aVar.b());
            ya0.c cVar = aVar.f97221c;
            if (cVar instanceof Decade) {
                jAbs *= 10;
            }
            if (cVar instanceof Millennium) {
                jAbs *= 1000;
            }
            return this.f80680g.replaceAll("%s", str3).replaceAll("%n", String.valueOf(jAbs)).replaceAll("%u", str4);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("JaTimeFormat [pattern=");
            sb2.append(this.f80680g);
            sb2.append(", futurePrefix=");
            sb2.append(this.f80681h);
            sb2.append(", futureSuffix=");
            sb2.append(this.f80682i);
            sb2.append(", pastPrefix=");
            sb2.append(this.f80683j);
            sb2.append(", pastSuffix=");
            return c0.q(sb2, this.f80684k, ", roundingTolerance=50]");
        }
    }

    @Override // ya0.d
    public final c a(ya0.c cVar) {
        return (c) this.f80673a.computeIfAbsent(cVar, new b(this, 1));
    }

    @Override // java.util.ListResourceBundle
    public final Object[][] getContents() {
        return f80672b;
    }
}
