package j$.time.format;

import j$.util.Objects;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class p {
    public static final a f = new a(0);
    public p a;
    public final p b;
    public final List c;
    public final boolean d;
    public int e;

    static {
        HashMap map = new HashMap();
        map.put('G', j$.time.temporal.a.ERA);
        map.put('y', j$.time.temporal.a.YEAR_OF_ERA);
        map.put('u', j$.time.temporal.a.YEAR);
        j$.time.temporal.g gVar = j$.time.temporal.i.a;
        map.put('Q', gVar);
        map.put('q', gVar);
        j$.time.temporal.a aVar = j$.time.temporal.a.MONTH_OF_YEAR;
        map.put('M', aVar);
        map.put('L', aVar);
        map.put('D', j$.time.temporal.a.DAY_OF_YEAR);
        map.put('d', j$.time.temporal.a.DAY_OF_MONTH);
        map.put('F', j$.time.temporal.a.ALIGNED_DAY_OF_WEEK_IN_MONTH);
        j$.time.temporal.a aVar2 = j$.time.temporal.a.DAY_OF_WEEK;
        map.put('E', aVar2);
        map.put('c', aVar2);
        map.put('e', aVar2);
        map.put('a', j$.time.temporal.a.AMPM_OF_DAY);
        map.put('H', j$.time.temporal.a.HOUR_OF_DAY);
        map.put('k', j$.time.temporal.a.CLOCK_HOUR_OF_DAY);
        map.put('K', j$.time.temporal.a.HOUR_OF_AMPM);
        map.put('h', j$.time.temporal.a.CLOCK_HOUR_OF_AMPM);
        map.put('m', j$.time.temporal.a.MINUTE_OF_HOUR);
        map.put('s', j$.time.temporal.a.SECOND_OF_MINUTE);
        j$.time.temporal.a aVar3 = j$.time.temporal.a.NANO_OF_SECOND;
        map.put('S', aVar3);
        map.put('A', j$.time.temporal.a.MILLI_OF_DAY);
        map.put('n', aVar3);
        map.put('N', j$.time.temporal.a.NANO_OF_DAY);
        map.put('g', j$.time.temporal.k.a);
    }

    public p() {
        this.a = this;
        this.c = new ArrayList();
        this.e = -1;
        this.b = null;
        this.d = false;
    }

    public final void a(DateTimeFormatter dateTimeFormatter) {
        Objects.requireNonNull(dateTimeFormatter, "formatter");
        e eVar = dateTimeFormatter.a;
        if (eVar.b) {
            eVar = new e(eVar.a, false);
        }
        b(eVar);
    }

    public final int b(f fVar) {
        Objects.requireNonNull(fVar, "pp");
        p pVar = this.a;
        pVar.getClass();
        ((ArrayList) pVar.c).add(fVar);
        this.a.e = -1;
        return ((ArrayList) r1.c).size() - 1;
    }

    public final void c(char c) {
        b(new d(c));
    }

    public final void d(String str) {
        Objects.requireNonNull(str, "literal");
        if (str.isEmpty()) {
            return;
        }
        if (str.length() == 1) {
            b(new d(str.charAt(0)));
        } else {
            b(new n(str));
        }
    }

    public final void e(j$.time.temporal.a aVar, Map map) {
        Objects.requireNonNull(aVar, "field");
        Objects.requireNonNull(map, "textLookup");
        LinkedHashMap linkedHashMap = new LinkedHashMap(map);
        a0 a0Var = a0.FULL;
        b(new o(aVar, a0Var, new b(new v(Collections.singletonMap(a0Var, linkedHashMap)))));
    }

    public final void f(i iVar) {
        i iVarB;
        p pVar = this.a;
        int i = pVar.e;
        if (i < 0) {
            pVar.e = b(iVar);
            return;
        }
        i iVar2 = (i) ((ArrayList) pVar.c).get(i);
        int i2 = iVar.b;
        int i3 = iVar.c;
        if (i2 == i3 && iVar.d == z.NOT_NEGATIVE) {
            iVarB = iVar2.c(i3);
            b(iVar.b());
            this.a.e = i;
        } else {
            iVarB = iVar2.b();
            this.a.e = b(iVar);
        }
        ((ArrayList) this.a.c).set(i, iVarB);
    }

    public final void g(j$.time.temporal.n nVar, int i) {
        Objects.requireNonNull(nVar, "field");
        if (i < 1 || i > 19) {
            j$.time.h.l("The width must be from 1 to 19 inclusive but was ", i);
        } else {
            f(new i(nVar, i, i, z.NOT_NEGATIVE));
        }
    }

    public final void h(j$.time.temporal.n nVar, int i, int i2, z zVar) {
        if (i == i2 && zVar == z.NOT_NEGATIVE) {
            g(nVar, i2);
            return;
        }
        Objects.requireNonNull(nVar, "field");
        Objects.requireNonNull(zVar, "signStyle");
        if (i < 1 || i > 19) {
            j$.time.h.l("The minimum width must be from 1 to 19 inclusive but was ", i);
            return;
        }
        if (i2 < 1 || i2 > 19) {
            j$.time.h.l("The maximum width must be from 1 to 19 inclusive but was ", i2);
            return;
        }
        if (i2 >= i) {
            f(new i(nVar, i, i2, zVar));
            return;
        }
        throw new IllegalArgumentException("The maximum width must exceed or equal the minimum width but " + i2 + " < " + i);
    }

    public final void i() {
        p pVar = this.a;
        if (pVar.b == null) {
            throw new IllegalStateException("Cannot call optionalEnd() as there was no previous call to optionalStart()");
        }
        int size = ((ArrayList) pVar.c).size();
        p pVar2 = this.a;
        if (size <= 0) {
            this.a = pVar2.b;
            return;
        }
        e eVar = new e(pVar2.c, pVar2.d);
        this.a = this.a.b;
        b(eVar);
    }

    public final void j() {
        p pVar = this.a;
        pVar.e = -1;
        this.a = new p(pVar);
    }

    public final DateTimeFormatter k(y yVar, j$.time.chrono.a aVar) {
        return l(Locale.getDefault(), yVar, aVar);
    }

    public final DateTimeFormatter l(Locale locale, y yVar, j$.time.chrono.a aVar) {
        Objects.requireNonNull(locale, "locale");
        while (this.a.b != null) {
            i();
        }
        e eVar = new e(this.c, false);
        w wVar = w.a;
        return new DateTimeFormatter(eVar, locale, yVar, aVar);
    }

    public p(p pVar) {
        this.a = this;
        this.c = new ArrayList();
        this.e = -1;
        this.b = pVar;
        this.d = true;
    }
}
