package j$.time.format;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class o implements f {
    public final j$.time.temporal.n a;
    public final a0 b;
    public final b c;
    public volatile i d;

    public o(j$.time.temporal.n nVar, a0 a0Var, b bVar) {
        this.a = nVar;
        this.b = a0Var;
        this.c = bVar;
    }

    @Override // j$.time.format.f
    public final boolean h(t tVar, StringBuilder sb) {
        String strG;
        Long lA = tVar.a(this.a);
        DateTimeFormatter dateTimeFormatter = tVar.b;
        if (lA == null) {
            return false;
        }
        j$.time.chrono.a aVar = (j$.time.chrono.a) tVar.a.m(j$.time.temporal.o.b);
        if (aVar == null || aVar == j$.time.chrono.s.c) {
            b bVar = this.c;
            long jLongValue = lA.longValue();
            a0 a0Var = this.b;
            Locale locale = dateTimeFormatter.b;
            strG = bVar.a.g(jLongValue, a0Var);
        } else {
            b bVar2 = this.c;
            long jLongValue2 = lA.longValue();
            a0 a0Var2 = this.b;
            Locale locale2 = dateTimeFormatter.b;
            strG = bVar2.a.g(jLongValue2, a0Var2);
        }
        if (strG != null) {
            sb.append(strG);
            return true;
        }
        if (this.d == null) {
            this.d = new i(this.a, 1, 19, z.NORMAL);
        }
        return this.d.h(tVar, sb);
    }

    @Override // j$.time.format.f
    public final int i(q qVar, CharSequence charSequence, int i) {
        b bVar = this.c;
        j$.time.temporal.n nVar = this.a;
        int length = charSequence.length();
        if (i < 0 || i > length) {
            throw new IndexOutOfBoundsException();
        }
        boolean z = qVar.c;
        DateTimeFormatter dateTimeFormatter = qVar.a;
        Iterator it2 = null;
        a0 a0Var = z ? this.b : null;
        j$.time.chrono.a aVar = qVar.c().c;
        if (aVar == null && (aVar = qVar.a.e) == null) {
            aVar = j$.time.chrono.s.c;
        }
        if (aVar == null || aVar == j$.time.chrono.s.c) {
            Locale locale = dateTimeFormatter.b;
            List list = (List) ((HashMap) ((Map) bVar.a.c)).get(a0Var);
            if (list != null) {
                it2 = list.iterator();
            }
        } else {
            List list2 = (List) ((HashMap) ((Map) bVar.a.c)).get(a0Var);
            if (list2 != null) {
                it2 = list2.iterator();
            }
        }
        Iterator it3 = it2;
        if (it3 != null) {
            while (it3.hasNext()) {
                Map.Entry entry = (Map.Entry) it3.next();
                String str = (String) entry.getKey();
                if (qVar.g(str, 0, charSequence, i, str.length())) {
                    return qVar.f(this.a, ((Long) entry.getValue()).longValue(), i, str.length() + i);
                }
            }
            if (nVar == j$.time.temporal.a.ERA && !qVar.c) {
                Iterator it4 = aVar.A().iterator();
                while (it4.hasNext()) {
                    String string = ((j$.time.chrono.m) it4.next()).toString();
                    if (qVar.g(string, 0, charSequence, i, string.length())) {
                        return qVar.f(this.a, r8.getValue(), i, string.length() + i);
                    }
                }
            }
            if (qVar.c) {
                return ~i;
            }
        }
        if (this.d == null) {
            this.d = new i(this.a, 1, 19, z.NORMAL);
        }
        return this.d.i(qVar, charSequence, i);
    }

    public final String toString() {
        a0 a0Var = a0.FULL;
        a0 a0Var2 = this.b;
        j$.time.temporal.n nVar = this.a;
        if (a0Var2 == a0Var) {
            return "Text(" + nVar + ")";
        }
        return "Text(" + nVar + "," + a0Var2 + ")";
    }
}
