package kotlin.collections;

import b70.h;
import b70.k;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.TransformingSequence;
import x7.f;

@Metadata(d1 = {"x7/f", "b70/k", "kotlin/collections/MapsKt", "kotlin/collections/MapsKt", "kotlin/collections/MapsKt"}, d2 = {}, k = 4, mv = {2, 1, 0}, xi = 49)
/* loaded from: classes.dex */
public final class MapsKt extends k {
    private MapsKt() {
    }

    public static Object g0(Object obj, Map map) {
        Intrinsics.g(map, "<this>");
        return f.G(obj, map);
    }

    public static HashMap h0(Pair... pairArr) {
        HashMap map = new HashMap(k.d0(pairArr.length));
        o0(map, pairArr);
        return map;
    }

    public static LinkedHashMap i0(Pair... pairArr) {
        LinkedHashMap linkedHashMap = new LinkedHashMap(k.d0(pairArr.length));
        o0(linkedHashMap, pairArr);
        return linkedHashMap;
    }

    public static Map j0(Pair... pairArr) {
        if (pairArr.length <= 0) {
            return h.f17594a;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(k.d0(pairArr.length));
        o0(linkedHashMap, pairArr);
        return linkedHashMap;
    }

    public static LinkedHashMap k0(Pair... pairArr) {
        LinkedHashMap linkedHashMap = new LinkedHashMap(k.d0(pairArr.length));
        o0(linkedHashMap, pairArr);
        return linkedHashMap;
    }

    public static final Map l0(LinkedHashMap linkedHashMap) {
        int size = linkedHashMap.size();
        return size != 0 ? size != 1 ? linkedHashMap : k.f0(linkedHashMap) : h.f17594a;
    }

    public static LinkedHashMap m0(Map map, Map map2) {
        Intrinsics.g(map, "<this>");
        Intrinsics.g(map2, "map");
        LinkedHashMap linkedHashMap = new LinkedHashMap(map);
        linkedHashMap.putAll(map2);
        return linkedHashMap;
    }

    public static Map n0(Map map, Pair pair) {
        Intrinsics.g(map, "<this>");
        if (map.isEmpty()) {
            return k.e0(pair);
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(map);
        linkedHashMap.put(pair.f71683a, pair.f71684b);
        return linkedHashMap;
    }

    public static void o0(HashMap map, Pair[] pairArr) {
        for (Pair pair : pairArr) {
            map.put(pair.f71683a, pair.f71684b);
        }
    }

    public static void p0(Map map, Iterable pairs) {
        Intrinsics.g(map, "<this>");
        Intrinsics.g(pairs, "pairs");
        Iterator it = pairs.iterator();
        while (it.hasNext()) {
            Pair pair = (Pair) it.next();
            map.put(pair.f71683a, pair.f71684b);
        }
    }

    public static List q0(Map map) {
        Intrinsics.g(map, "<this>");
        if (map.size() == 0) {
            return EmptyList.f71733a;
        }
        Iterator it = map.entrySet().iterator();
        if (!it.hasNext()) {
            return EmptyList.f71733a;
        }
        Map.Entry entry = (Map.Entry) it.next();
        if (!it.hasNext()) {
            return ul.b.P(new Pair(entry.getKey(), entry.getValue()));
        }
        ArrayList arrayList = new ArrayList(map.size());
        arrayList.add(new Pair(entry.getKey(), entry.getValue()));
        do {
            Map.Entry entry2 = (Map.Entry) it.next();
            arrayList.add(new Pair(entry2.getKey(), entry2.getValue()));
        } while (it.hasNext());
        return arrayList;
    }

    public static Map r0(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        if (!(iterable instanceof Collection)) {
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            p0(linkedHashMap, iterable);
            return l0(linkedHashMap);
        }
        Collection collection = (Collection) iterable;
        int size = collection.size();
        if (size == 0) {
            return h.f17594a;
        }
        if (size == 1) {
            return k.e0((Pair) (iterable instanceof List ? ((List) iterable).get(0) : collection.iterator().next()));
        }
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(k.d0(collection.size()));
        p0(linkedHashMap2, iterable);
        return linkedHashMap2;
    }

    public static Map s0(Map map) {
        Intrinsics.g(map, "<this>");
        int size = map.size();
        return size != 0 ? size != 1 ? u0(map) : k.f0(map) : h.f17594a;
    }

    public static Map t0(TransformingSequence transformingSequence) {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        TransformingSequence.AnonymousClass1 anonymousClass1 = new TransformingSequence.AnonymousClass1();
        while (anonymousClass1.f71993a.hasNext()) {
            Pair pair = (Pair) anonymousClass1.next();
            linkedHashMap.put(pair.f71683a, pair.f71684b);
        }
        return l0(linkedHashMap);
    }

    public static LinkedHashMap u0(Map map) {
        Intrinsics.g(map, "<this>");
        return new LinkedHashMap(map);
    }
}
