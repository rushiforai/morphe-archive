package defpackage;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public abstract class szb extends vn7 {
    public static mzb F0(Iterator it2) {
        it2.getClass();
        return new j52(new j80(3, it2));
    }

    public static mzb G0(mzb mzbVar, int i) {
        if (i >= 0) {
            return i == 0 ? mzbVar : mzbVar instanceof en3 ? ((en3) mzbVar).a(i) : new an3(mzbVar, i);
        }
        ywb.g(ev6.w("Requested element count ", i, " is less than zero."));
        return null;
    }

    public static Object H0(zh4 zh4Var) {
        yh4 yh4Var = new yh4(zh4Var);
        if (yh4Var.hasNext()) {
            return yh4Var.next();
        }
        return null;
    }

    public static final ym4 I0(mzb mzbVar) {
        dsb dsbVar = new dsb(6);
        if (!(mzbVar instanceof srd)) {
            return new ym4(mzbVar, new qna(22), dsbVar);
        }
        srd srdVar = (srd) mzbVar;
        return new ym4(srdVar.a, srdVar.b, dsbVar);
    }

    public static mzb J0(m45 m45Var) {
        return new j52(new hi3(m45Var, new r00(8, m45Var), 2));
    }

    public static mzb K0(Object obj, x45 x45Var) {
        return obj == null ? my3.a : new hi3(new i5b(18, obj), x45Var, 2);
    }

    public static String L0(mzb mzbVar, String str) {
        mzbVar.getClass();
        StringBuilder sb = new StringBuilder();
        sb.append((CharSequence) "");
        int i = 0;
        for (Object obj : mzbVar) {
            i++;
            if (i > 1) {
                sb.append((CharSequence) str);
            }
            yo7.o(sb, obj, null);
        }
        sb.append((CharSequence) "");
        return sb.toString();
    }

    public static Object M0(mzb mzbVar) {
        Iterator it2 = mzbVar.iterator();
        if (!it2.hasNext()) {
            ywb.h("Sequence is empty.");
            return null;
        }
        Object next = it2.next();
        while (it2.hasNext()) {
            next = it2.next();
        }
        return next;
    }

    public static zh4 N0(mzb mzbVar, x45 x45Var) {
        return new zh4(new srd(mzbVar, x45Var), false, new dsb(7));
    }

    public static List O0(mzb mzbVar) {
        mzbVar.getClass();
        Iterator it2 = mzbVar.iterator();
        if (!it2.hasNext()) {
            return ey3.a;
        }
        Object next = it2.next();
        if (!it2.hasNext()) {
            return d46.Q(next);
        }
        ArrayList arrayList = new ArrayList();
        arrayList.add(next);
        while (it2.hasNext()) {
            arrayList.add(it2.next());
        }
        return arrayList;
    }
}
