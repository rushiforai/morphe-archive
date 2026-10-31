package b70;

import ab.e0;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class n extends e0 {
    public static LinkedHashSet Z(Set set, Object obj) {
        Intrinsics.g(set, "<this>");
        LinkedHashSet linkedHashSet = new LinkedHashSet(k.d0(set.size()));
        boolean z11 = false;
        for (Object obj2 : set) {
            boolean z12 = true;
            if (!z11 && Intrinsics.b(obj2, obj)) {
                z11 = true;
                z12 = false;
            }
            if (z12) {
                linkedHashSet.add(obj2);
            }
        }
        return linkedHashSet;
    }

    public static Set a0(Set set, Iterable elements) {
        Intrinsics.g(set, "<this>");
        Intrinsics.g(elements, "elements");
        Collection<?> collectionB0 = d.B0(elements);
        if (collectionB0.isEmpty()) {
            return g.N1(set);
        }
        if (!(collectionB0 instanceof Set)) {
            LinkedHashSet linkedHashSet = new LinkedHashSet(set);
            linkedHashSet.removeAll(collectionB0);
            return linkedHashSet;
        }
        LinkedHashSet linkedHashSet2 = new LinkedHashSet();
        for (Object obj : set) {
            if (!((Set) collectionB0).contains(obj)) {
                linkedHashSet2.add(obj);
            }
        }
        return linkedHashSet2;
    }

    public static LinkedHashSet b0(Set set, Iterable elements) {
        Intrinsics.g(set, "<this>");
        Intrinsics.g(elements, "elements");
        Integer numValueOf = elements instanceof Collection ? Integer.valueOf(((Collection) elements).size()) : null;
        LinkedHashSet linkedHashSet = new LinkedHashSet(k.d0(numValueOf != null ? set.size() + numValueOf.intValue() : set.size() * 2));
        linkedHashSet.addAll(set);
        d.z0(elements, linkedHashSet);
        return linkedHashSet;
    }

    public static LinkedHashSet c0(Set set, Object obj) {
        Intrinsics.g(set, "<this>");
        LinkedHashSet linkedHashSet = new LinkedHashSet(k.d0(set.size() + 1));
        linkedHashSet.addAll(set);
        linkedHashSet.add(obj);
        return linkedHashSet;
    }
}
