package org.ocpsoft.prettytime.i18n;

import java.util.ListResourceBundle;
import java.util.Map;
import java.util.function.Function;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import wa0.c;
import ya0.d;

/* loaded from: classes5.dex */
public class Resources_de extends ListResourceBundle implements d {

    /* renamed from: a, reason: collision with root package name */
    public static final Object[][] f80646a = {new Object[]{"CenturyPattern", "%n %u"}, new Object[]{"CenturyFuturePrefix", "in "}, new Object[]{"CenturyFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"CenturyPastPrefix", "vor "}, new Object[]{"CenturyPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"CenturySingularName", "Jahrhundert"}, new Object[]{"CenturyPluralName", "Jahrhunderte"}, new Object[]{"DayPattern", "%n %u"}, new Object[]{"DayFuturePrefix", "in "}, new Object[]{"DayFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"DayPastPrefix", "vor "}, new Object[]{"DayPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"DaySingularName", "Tag"}, new Object[]{"DayPluralName", "Tage"}, new Object[]{"DecadePattern", "%n %u"}, new Object[]{"DecadeFuturePrefix", "in "}, new Object[]{"DecadeFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"DecadePastPrefix", "vor "}, new Object[]{"DecadePastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"DecadeSingularName", "Jahrzehnt"}, new Object[]{"DecadePluralName", "Jahrzehnte"}, new Object[]{"HourPattern", "%n %u"}, new Object[]{"HourFuturePrefix", "in "}, new Object[]{"HourFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"HourPastPrefix", "vor "}, new Object[]{"HourPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"HourSingularName", "Stunde"}, new Object[]{"HourPluralName", "Stunden"}, new Object[]{"JustNowPattern", "%u"}, new Object[]{"JustNowFuturePrefix", "Jetzt"}, new Object[]{"JustNowFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"JustNowPastPrefix", "gerade eben"}, new Object[]{"JustNowPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"JustNowSingularName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"JustNowPluralName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillenniumPattern", "%n %u"}, new Object[]{"MillenniumFuturePrefix", "in "}, new Object[]{"MillenniumFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillenniumPastPrefix", "vor "}, new Object[]{"MillenniumPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillenniumSingularName", "Jahrtausend"}, new Object[]{"MillenniumPluralName", "Jahrtausende"}, new Object[]{"MillisecondPattern", "%n %u"}, new Object[]{"MillisecondFuturePrefix", "in "}, new Object[]{"MillisecondFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillisecondPastPrefix", "vor "}, new Object[]{"MillisecondPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MillisecondSingularName", "Millisekunde"}, new Object[]{"MillisecondPluralName", "Millisekunden"}, new Object[]{"MinutePattern", "%n %u"}, new Object[]{"MinuteFuturePrefix", "in "}, new Object[]{"MinuteFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MinutePastPrefix", "vor "}, new Object[]{"MinutePastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MinuteSingularName", "Minute"}, new Object[]{"MinutePluralName", "Minuten"}, new Object[]{"MonthPattern", "%n %u"}, new Object[]{"MonthFuturePrefix", "in "}, new Object[]{"MonthFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MonthPastPrefix", "vor "}, new Object[]{"MonthPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"MonthSingularName", "Monat"}, new Object[]{"MonthPluralName", "Monate"}, new Object[]{"SecondPattern", "%n %u"}, new Object[]{"SecondFuturePrefix", "in "}, new Object[]{"SecondFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"SecondPastPrefix", "vor "}, new Object[]{"SecondPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"SecondSingularName", "Sekunde"}, new Object[]{"SecondPluralName", "Sekunden"}, new Object[]{"WeekPattern", "%n %u"}, new Object[]{"WeekFuturePrefix", "in "}, new Object[]{"WeekFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"WeekPastPrefix", "vor "}, new Object[]{"WeekPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"WeekSingularName", "Woche"}, new Object[]{"WeekPluralName", "Wochen"}, new Object[]{"YearPattern", "%n %u"}, new Object[]{"YearFuturePrefix", "in "}, new Object[]{"YearFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"YearPastPrefix", "vor "}, new Object[]{"YearPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"YearSingularName", "Jahr"}, new Object[]{"YearPluralName", "Jahre"}, new Object[]{"AbstractTimeUnitPattern", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitFuturePrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitFutureSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitPastPrefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitPastSuffix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitSingularName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, new Object[]{"AbstractTimeUnitPluralName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}};

    public static class DeTimeFormat extends xa0.a {
        public static final Map n;
        public static final Pattern o;

        static {
            Map map = (Map) Stream.of((Object[]) new String[]{"Jahrtausende", "Jahrhunderte", "Jahrzehnte", "Jahre", "Monate", "Tage"}).collect(Collectors.toMap(Function.identity(), new a()));
            n = map;
            o = Pattern.compile("\\b(" + String.join("|", map.keySet()) + ")\\b");
        }

        @Override // xa0.a, wa0.c
        public final String b(ya0.a aVar, String str) {
            Matcher matcher = o.matcher(str);
            StringBuffer stringBuffer = new StringBuffer();
            while (matcher.find()) {
                matcher.appendReplacement(stringBuffer, (String) n.get(matcher.group(1)));
            }
            matcher.appendTail(stringBuffer);
            return super.b(aVar, stringBuffer.toString());
        }
    }

    @Override // ya0.d
    public final c a(ya0.c cVar) {
        DeTimeFormat deTimeFormat = new DeTimeFormat();
        String simpleName = cVar.getClass().getSimpleName();
        deTimeFormat.f95743h = getString(simpleName.concat("Pattern"));
        deTimeFormat.f95744i = getString(simpleName.concat("FuturePrefix")).trim();
        deTimeFormat.f95745j = getString(simpleName.concat("FutureSuffix")).trim();
        deTimeFormat.f95746k = getString(simpleName.concat("PastPrefix")).trim();
        deTimeFormat.f95747l = getString(simpleName.concat("PastSuffix")).trim();
        deTimeFormat.f95737b = getString(simpleName.concat("SingularName"));
        deTimeFormat.f95738c = getString(simpleName.concat("PluralName"));
        return deTimeFormat;
    }

    @Override // java.util.ListResourceBundle
    public final Object[][] getContents() {
        return f80646a;
    }
}
