package wa0;

import aa.t;
import ab.f0;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ConcurrentHashMap;
import org.ocpsoft.prettytime.units.Century;
import org.ocpsoft.prettytime.units.Day;
import org.ocpsoft.prettytime.units.Decade;
import org.ocpsoft.prettytime.units.Hour;
import org.ocpsoft.prettytime.units.JustNow;
import org.ocpsoft.prettytime.units.Millennium;
import org.ocpsoft.prettytime.units.Millisecond;
import org.ocpsoft.prettytime.units.Minute;
import org.ocpsoft.prettytime.units.Month;
import org.ocpsoft.prettytime.units.Second;
import org.ocpsoft.prettytime.units.Week;
import org.ocpsoft.prettytime.units.Year;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public volatile Locale f94127a = Locale.getDefault();

    /* renamed from: b, reason: collision with root package name */
    public final ConcurrentHashMap f94128b = new ConcurrentHashMap();

    /* renamed from: c, reason: collision with root package name */
    public volatile List f94129c;

    public b() {
        a(new JustNow());
        a(new Millisecond());
        a(new Second());
        a(new Minute());
        a(new Hour());
        a(new Day());
        a(new Week());
        a(new Month());
        a(new Year());
        a(new Decade());
        a(new Century());
        a(new Millennium());
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void a(ya0.c cVar) {
        ya0.b bVar = new ya0.b(cVar);
        this.f94129c = null;
        this.f94128b.put(cVar, bVar);
        if (cVar instanceof a) {
            ((a) cVar).a(this.f94127a);
        }
        bVar.g(this.f94127a);
    }

    public final ya0.a b(Date date) {
        long j11;
        long time = (date == null ? new Date() : date).getTime() - Instant.now().toEpochMilli();
        long j12 = 0;
        if (time == 0) {
            time = 1;
        }
        long jAbs = Math.abs(time);
        if (this.f94129c == null) {
            ArrayList arrayList = new ArrayList(this.f94128b.keySet());
            Collections.sort(arrayList, Comparator.comparing(new t(23)));
            this.f94129c = Collections.unmodifiableList(arrayList);
        }
        List list = this.f94129c;
        ya0.a aVar = new ya0.a();
        int i5 = 0;
        while (i5 < list.size()) {
            ya0.c cVar = (ya0.c) list.get(i5);
            long jAbs2 = Math.abs(cVar.f97225c);
            long jAbs3 = Math.abs(cVar.f97224b);
            boolean z11 = i5 == list.size() + (-1);
            if (j12 != jAbs3 || z11) {
                j11 = j12;
            } else {
                j11 = j12;
                jAbs3 = ((ya0.c) list.get(i5 + 1)).f97225c / cVar.f97225c;
            }
            if (jAbs3 * jAbs2 > jAbs || z11) {
                aVar.h(cVar);
                if (jAbs2 > jAbs) {
                    aVar.g(j11 > time ? -1L : 1L);
                    aVar.f(j11);
                    return aVar;
                }
                aVar.g(time / jAbs2);
                aVar.f(time - (aVar.a() * jAbs2));
                return aVar;
            }
            i5++;
            j12 = j11;
        }
        return aVar;
    }

    public final String c(Date date) {
        if (date == null) {
            date = new Date();
        }
        return d(b(date));
    }

    public final String d(ya0.a aVar) {
        c cVar;
        ya0.c cVarC = aVar.c();
        if (cVarC == null) {
            cVar = null;
        } else {
            ConcurrentHashMap concurrentHashMap = this.f94128b;
            if (concurrentHashMap.get(cVarC) != null) {
                cVar = (c) concurrentHashMap.get(cVarC);
            } else {
                ConcurrentHashMap concurrentHashMap2 = new ConcurrentHashMap();
                concurrentHashMap.keySet().forEach(new f0(11, this, concurrentHashMap2));
                cVar = (c) concurrentHashMap2.get(cVarC.toString());
            }
        }
        return cVar.b(aVar, cVar.c(aVar));
    }

    public final String toString() {
        return "PrettyTime [reference=null, locale=" + this.f94127a + "]";
    }
}
