package j$.time.format;

import j$.time.temporal.TemporalAccessor;
import j$.util.Objects;
import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class DateTimeFormatter {
    public static final DateTimeFormatter ISO_INSTANT;
    public static final DateTimeFormatter ISO_LOCAL_DATE;
    public static final DateTimeFormatter ISO_OFFSET_DATE_TIME;
    public final e a;
    public final Locale b;
    public final w c;
    public final y d;
    public final j$.time.chrono.a e;

    static {
        p pVar = new p();
        j$.time.temporal.a aVar = j$.time.temporal.a.YEAR;
        z zVar = z.EXCEEDS_PAD;
        pVar.h(aVar, 4, 10, zVar);
        pVar.c('-');
        j$.time.temporal.a aVar2 = j$.time.temporal.a.MONTH_OF_YEAR;
        pVar.g(aVar2, 2);
        pVar.c('-');
        j$.time.temporal.a aVar3 = j$.time.temporal.a.DAY_OF_MONTH;
        pVar.g(aVar3, 2);
        y yVar = y.STRICT;
        j$.time.chrono.s sVar = j$.time.chrono.s.c;
        DateTimeFormatter dateTimeFormatterK = pVar.k(yVar, sVar);
        ISO_LOCAL_DATE = dateTimeFormatterK;
        p pVar2 = new p();
        m mVar = m.INSENSITIVE;
        pVar2.b(mVar);
        pVar2.a(dateTimeFormatterK);
        j jVar = j.e;
        pVar2.b(jVar);
        pVar2.k(yVar, sVar);
        p pVar3 = new p();
        pVar3.b(mVar);
        pVar3.a(dateTimeFormatterK);
        pVar3.j();
        pVar3.b(jVar);
        pVar3.k(yVar, sVar);
        p pVar4 = new p();
        j$.time.temporal.a aVar4 = j$.time.temporal.a.HOUR_OF_DAY;
        pVar4.g(aVar4, 2);
        pVar4.c(':');
        j$.time.temporal.a aVar5 = j$.time.temporal.a.MINUTE_OF_HOUR;
        pVar4.g(aVar5, 2);
        pVar4.j();
        pVar4.c(':');
        j$.time.temporal.a aVar6 = j$.time.temporal.a.SECOND_OF_MINUTE;
        pVar4.g(aVar6, 2);
        pVar4.j();
        pVar4.b(new g(j$.time.temporal.a.NANO_OF_SECOND));
        DateTimeFormatter dateTimeFormatterK2 = pVar4.k(yVar, null);
        p pVar5 = new p();
        pVar5.b(mVar);
        pVar5.a(dateTimeFormatterK2);
        pVar5.b(jVar);
        pVar5.k(yVar, null);
        p pVar6 = new p();
        pVar6.b(mVar);
        pVar6.a(dateTimeFormatterK2);
        pVar6.j();
        pVar6.b(jVar);
        pVar6.k(yVar, null);
        p pVar7 = new p();
        pVar7.b(mVar);
        pVar7.a(dateTimeFormatterK);
        pVar7.c('T');
        pVar7.a(dateTimeFormatterK2);
        DateTimeFormatter dateTimeFormatterK3 = pVar7.k(yVar, sVar);
        p pVar8 = new p();
        pVar8.b(mVar);
        pVar8.a(dateTimeFormatterK3);
        m mVar2 = m.LENIENT;
        pVar8.b(mVar2);
        pVar8.b(jVar);
        m mVar3 = m.STRICT;
        pVar8.b(mVar3);
        DateTimeFormatter dateTimeFormatterK4 = pVar8.k(yVar, sVar);
        ISO_OFFSET_DATE_TIME = dateTimeFormatterK4;
        p pVar9 = new p();
        pVar9.a(dateTimeFormatterK4);
        pVar9.j();
        pVar9.c('[');
        m mVar4 = m.SENSITIVE;
        pVar9.b(mVar4);
        int i = 1;
        pVar9.b(new h(i));
        pVar9.c(']');
        pVar9.k(yVar, sVar);
        p pVar10 = new p();
        pVar10.a(dateTimeFormatterK3);
        pVar10.j();
        pVar10.b(jVar);
        pVar10.j();
        pVar10.c('[');
        pVar10.b(mVar4);
        pVar10.b(new h(i));
        pVar10.c(']');
        pVar10.k(yVar, sVar);
        p pVar11 = new p();
        pVar11.b(mVar);
        pVar11.h(aVar, 4, 10, zVar);
        pVar11.c('-');
        pVar11.g(j$.time.temporal.a.DAY_OF_YEAR, 3);
        pVar11.j();
        pVar11.b(jVar);
        pVar11.k(yVar, sVar);
        p pVar12 = new p();
        pVar12.b(mVar);
        pVar12.h(j$.time.temporal.i.c, 4, 10, zVar);
        pVar12.d("-W");
        pVar12.g(j$.time.temporal.i.b, 2);
        pVar12.c('-');
        j$.time.temporal.a aVar7 = j$.time.temporal.a.DAY_OF_WEEK;
        pVar12.g(aVar7, 1);
        pVar12.j();
        pVar12.b(jVar);
        pVar12.k(yVar, sVar);
        p pVar13 = new p();
        pVar13.b(mVar);
        pVar13.b(new h(0));
        ISO_INSTANT = pVar13.k(yVar, null);
        p pVar14 = new p();
        pVar14.b(mVar);
        pVar14.g(aVar, 4);
        pVar14.g(aVar2, 2);
        pVar14.g(aVar3, 2);
        pVar14.j();
        pVar14.b(mVar2);
        pVar14.b(new j("+HHMMss", "Z"));
        pVar14.b(mVar3);
        pVar14.k(yVar, sVar);
        HashMap map = new HashMap();
        map.put(1L, "Mon");
        map.put(2L, "Tue");
        map.put(3L, "Wed");
        map.put(4L, "Thu");
        map.put(5L, "Fri");
        map.put(6L, "Sat");
        map.put(7L, "Sun");
        HashMap map2 = new HashMap();
        map2.put(1L, "Jan");
        map2.put(2L, "Feb");
        map2.put(3L, "Mar");
        map2.put(4L, "Apr");
        map2.put(5L, "May");
        map2.put(6L, "Jun");
        map2.put(7L, "Jul");
        map2.put(8L, "Aug");
        map2.put(9L, "Sep");
        map2.put(10L, "Oct");
        map2.put(11L, "Nov");
        map2.put(12L, "Dec");
        p pVar15 = new p();
        pVar15.b(mVar);
        pVar15.b(mVar2);
        pVar15.j();
        pVar15.e(aVar7, map);
        pVar15.d(", ");
        pVar15.i();
        pVar15.h(aVar3, 1, 2, z.NOT_NEGATIVE);
        pVar15.c(' ');
        pVar15.e(aVar2, map2);
        pVar15.c(' ');
        pVar15.g(aVar, 4);
        pVar15.c(' ');
        pVar15.g(aVar4, 2);
        pVar15.c(':');
        pVar15.g(aVar5, 2);
        pVar15.j();
        pVar15.c(':');
        pVar15.g(aVar6, 2);
        pVar15.i();
        pVar15.c(' ');
        pVar15.b(new j("+HHMM", "GMT"));
        pVar15.k(y.SMART, sVar);
    }

    public DateTimeFormatter(e eVar, Locale locale, y yVar, j$.time.chrono.a aVar) {
        w wVar = w.a;
        this.a = (e) Objects.requireNonNull(eVar, "printerParser");
        this.b = (Locale) Objects.requireNonNull(locale, "locale");
        this.c = (w) Objects.requireNonNull(wVar, "decimalStyle");
        this.d = (y) Objects.requireNonNull(yVar, "resolverStyle");
        this.e = aVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:132:0x0316  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0262  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final j$.time.format.x a(java.lang.CharSequence r24) {
        /*
            Method dump skipped, instruction units count: 1078
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.time.format.DateTimeFormatter.a(java.lang.CharSequence):j$.time.format.x");
    }

    public String format(TemporalAccessor temporalAccessor) {
        StringBuilder sb = new StringBuilder(32);
        e eVar = this.a;
        Objects.requireNonNull(temporalAccessor, "temporal");
        Objects.requireNonNull(sb, "appendable");
        try {
            eVar.h(new t(temporalAccessor, this), sb);
            return sb.toString();
        } catch (IOException e) {
            throw new j$.time.c(e.getMessage(), e);
        }
    }

    public TemporalAccessor parse(CharSequence charSequence) {
        String string;
        Objects.requireNonNull(charSequence, "text");
        try {
            return a(charSequence);
        } catch (r e) {
            throw e;
        } catch (RuntimeException e2) {
            if (charSequence.length() > 64) {
                string = charSequence.subSequence(0, 64).toString() + "...";
            } else {
                string = charSequence.toString();
            }
            throw new r("Text '" + string + "' could not be parsed: " + e2.getMessage(), charSequence, e2);
        }
    }

    public final String toString() {
        String string = this.a.toString();
        return string.startsWith("[") ? string : string.substring(1, string.length() - 1);
    }
}
