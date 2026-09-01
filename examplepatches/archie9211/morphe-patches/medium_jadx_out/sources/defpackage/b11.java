package defpackage;

import com.drew.metadata.mov.QuickTimeAtomTypes;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class b11 {
    public static final Map a;
    public static final LinkedHashMap b;
    public static final Set c;
    public static final Set d;

    static {
        z05 z05Var = lnc.j;
        f09 f09Var = new f09(z05Var.a(n98.e("name")).i(), mnc.d);
        f09 f09Var2 = new f09(z05Var.a(n98.e("ordinal")).i(), n98.e("ordinal"));
        f09 f09Var3 = new f09(yi2.J(lnc.C, "size"), n98.e("size"));
        y05 y05Var = lnc.G;
        Map mapQ = ei7.Q(f09Var, f09Var2, f09Var3, new f09(yi2.J(y05Var, "size"), n98.e("size")), new f09(lnc.e.a(n98.e("length")).i(), n98.e("length")), new f09(yi2.J(y05Var, QuickTimeAtomTypes.ATOM_KEYS), n98.e("keySet")), new f09(yi2.J(y05Var, "values"), n98.e("values")), new f09(yi2.J(y05Var, "entries"), n98.e("entrySet")), new f09(yi2.J(lnc.a0, "size"), n98.e("length")), new f09(yi2.J(lnc.b0, "size"), n98.e("length")), new f09(yi2.J(lnc.c0, "size"), n98.e("length")));
        a = mapQ;
        Set<Map.Entry> setEntrySet = mapQ.entrySet();
        ArrayList<f09> arrayList = new ArrayList(cu1.k0(setEntrySet, 10));
        for (Map.Entry entry : setEntrySet) {
            arrayList.add(new f09(((y05) entry.getKey()).a.g(), entry.getValue()));
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (f09 f09Var4 : arrayList) {
            n98 n98Var = (n98) f09Var4.b;
            Object arrayList2 = linkedHashMap.get(n98Var);
            if (arrayList2 == null) {
                arrayList2 = new ArrayList();
                linkedHashMap.put(n98Var, arrayList2);
            }
            ((List) arrayList2).add((n98) f09Var4.a);
        }
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(ei7.P(linkedHashMap.size()));
        for (Map.Entry entry2 : linkedHashMap.entrySet()) {
            linkedHashMap2.put(entry2.getKey(), bu1.r0((Iterable) entry2.getValue()));
        }
        b = linkedHashMap2;
        Map map = a;
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        for (Map.Entry entry3 : map.entrySet()) {
            String str = s96.a;
            mn1 mn1VarG = s96.g(((y05) entry3.getKey()).b().a);
            mn1VarG.getClass();
            linkedHashSet.add(mn1VarG.a().a((n98) entry3.getValue()));
        }
        Set setKeySet = a.keySet();
        c = setKeySet;
        Set set = setKeySet;
        ArrayList arrayList3 = new ArrayList(cu1.k0(set, 10));
        Iterator it2 = set.iterator();
        while (it2.hasNext()) {
            arrayList3.add(((y05) it2.next()).a.g());
        }
        d = bu1.q1(arrayList3);
    }
}
