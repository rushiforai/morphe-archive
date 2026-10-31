package sx;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.random.Random;

/* loaded from: classes4.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public final Random f87817a = Random.f71890a;

    public static o a(p pVar, LinkedHashMap linkedHashMap) {
        o oVar;
        Integer numValueOf;
        Random random = pVar.f87817a;
        if (linkedHashMap.isEmpty()) {
            return o.f87812c;
        }
        Iterator it = linkedHashMap.values().iterator();
        int i5 = 0;
        while (it.hasNext()) {
            i5 += ((k) it.next()).f87797b;
        }
        double dB = random.b();
        Object next = null;
        double dC0 = 0.15d;
        if (!linkedHashMap.isEmpty()) {
            Iterator it2 = linkedHashMap.values().iterator();
            if (it2.hasNext()) {
                numValueOf = Integer.valueOf(((k) it2.next()).f87797b);
                while (it2.hasNext()) {
                    Integer numValueOf2 = Integer.valueOf(((k) it2.next()).f87797b);
                    if (numValueOf.compareTo(numValueOf2) < 0) {
                        numValueOf = numValueOf2;
                    }
                }
            } else {
                numValueOf = null;
            }
            int iIntValue = numValueOf != null ? numValueOf.intValue() : 0;
            dC0 = kotlin.ranges.a.c0(0.15d - ((iIntValue <= 0 ? 0.0d : kotlin.ranges.a.c0(iIntValue / (iIntValue + 10), 0.0d, 1.0d)) * 0.13d), 0.02d, 0.15d);
        }
        if (dB < dC0) {
            return (o) b70.g.v1(linkedHashMap.keySet(), random);
        }
        Iterator it3 = linkedHashMap.entrySet().iterator();
        if (it3.hasNext()) {
            next = it3.next();
            if (it3.hasNext()) {
                double dC = ((k) ((Map.Entry) next).getValue()).c(i5);
                do {
                    Object next2 = it3.next();
                    double dC2 = ((k) ((Map.Entry) next2).getValue()).c(i5);
                    if (Double.compare(dC, dC2) < 0) {
                        next = next2;
                        dC = dC2;
                    }
                } while (it3.hasNext());
            }
        }
        Map.Entry entry = (Map.Entry) next;
        return (entry == null || (oVar = (o) entry.getKey()) == null) ? o.f87812c : oVar;
    }
}
