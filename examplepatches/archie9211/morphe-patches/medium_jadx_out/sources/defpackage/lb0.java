package defpackage;

import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Llb0;", "Lque;", "jb0", "fb0", "gp2", "stats_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class lb0 extends que {
    public final String b;
    public final String c;
    public final e95 d;
    public final ax2 e;
    public final vob f;
    public final String g;
    public final SourceParameter h;
    public boolean i;
    public final wua j;
    public final r6c k;

    public lb0(String str, String str2, e95 e95Var, ax2 ax2Var, vob vobVar, kb2 kb2Var) {
        str.getClass();
        str2.getClass();
        vobVar.getClass();
        this.b = str;
        this.c = str2;
        this.d = e95Var;
        this.e = ax2Var;
        this.f = vobVar;
        this.g = "stats_audience";
        this.h = new SourceParameter("stats_audience", str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -4, 8191, null);
        this.j = bo.e0(w2g.r(new u50(12, new ra(this, null)), kb2Var), f76.F(this), l7c.b, ib0.a);
        this.k = k40.x(0, 7, null);
    }

    public final Calendar e() {
        Long l = (Long) this.f.a("month_selected");
        if (l != null) {
            return pwd.G(l);
        }
        Calendar calendarG = pwd.G(null);
        calendarG.set(2, 0);
        pwd.C(calendarG);
        return calendarG;
    }

    public final jb0 f(Object obj, Calendar calendar) {
        Throwable thB = bjb.b(obj);
        if (thB != null) {
            return new hb0(m4.I(thB));
        }
        c95 c95Var = (c95) obj;
        boolean z = true;
        if (!(c95Var instanceof b95)) {
            return new hb0(new w14(null, true));
        }
        Calendar calendarG = pwd.G(Long.valueOf(calendar.getTimeInMillis()));
        calendarG.set(2, 0);
        pwd.C(calendarG);
        Calendar calendarG2 = pwd.G(Long.valueOf(calendar.getTimeInMillis()));
        calendarG2.set(2, 11);
        pwd.I(calendarG2);
        Long lValueOf = Long.valueOf(calendarG.getTimeInMillis());
        Long lValueOf2 = Long.valueOf(calendarG2.getTimeInMillis());
        long jLongValue = lValueOf.longValue();
        long jLongValue2 = lValueOf2.longValue();
        b95 b95Var = (b95) c95Var;
        List listF1 = bu1.f1(b95Var.f, new js4(8));
        ArrayList arrayList = new ArrayList();
        for (Object obj2 : listF1) {
            long j = ((a95) obj2).c;
            if (jLongValue <= j && j <= jLongValue2) {
                arrayList.add(obj2);
            }
        }
        Long l = b95Var.a;
        n46 n46Var = new n46(pwd.G(Long.valueOf(l != null ? l.longValue() : 1343779200000L)).get(1), pwd.G(null).get(1), 1);
        ArrayList arrayList2 = new ArrayList(cu1.k0(n46Var, 10));
        Iterator it2 = n46Var.iterator();
        while (((m46) it2).c) {
            int iNextInt = ((g46) it2).nextInt();
            Calendar calendarG3 = pwd.G(null);
            pwd.C(calendarG3);
            calendarG3.set(z ? 1 : 0, iNextInt);
            long timeInMillis = calendarG3.getTimeInMillis();
            if (jLongValue > timeInMillis || timeInMillis > jLongValue2) {
                z = false;
            }
            arrayList2.add(new rv2(timeInMillis, z));
            z = true;
        }
        List listF12 = bu1.f1(arrayList2, new js4(9));
        va0 va0Var = new va0(b95Var.a, b95Var.b, b95Var.c, b95Var.d, b95Var.e);
        sv2 sv2Var = new sv2(listF12);
        ArrayList arrayList3 = new ArrayList(cu1.k0(arrayList, 10));
        Iterator it3 = arrayList.iterator();
        while (it3.hasNext()) {
            arrayList3.add(new kb9(Float.valueOf(r13.a), ((a95) it3.next()).c, null));
        }
        ArrayList arrayListA0 = flb.A0(arrayList3, calendar);
        ArrayList arrayList4 = new ArrayList(cu1.k0(arrayList, 10));
        Iterator it4 = arrayList.iterator();
        while (it4.hasNext()) {
            arrayList4.add(new kb9(Float.valueOf(r5.b), ((a95) it4.next()).c, null));
        }
        return new gb0(false, va0Var, new za0(jLongValue, jLongValue2, sv2Var, arrayListA0, flb.A0(arrayList4, calendar)), this.h);
    }
}
