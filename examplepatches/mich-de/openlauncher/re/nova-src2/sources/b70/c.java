package b70;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import kotlin.collections.CollectionsKt__IteratorsJVMKt$iterator$1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class c extends ul.b {
    public static int u0(Iterable iterable, int i5) {
        Intrinsics.g(iterable, "<this>");
        return iterable instanceof Collection ? ((Collection) iterable).size() : i5;
    }

    public static ArrayList v0(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        ArrayList arrayList = new ArrayList();
        Iterator it = iterable.iterator();
        while (it.hasNext()) {
            d.z0((Iterable) it.next(), arrayList);
        }
        return arrayList;
    }

    public static CollectionsKt__IteratorsJVMKt$iterator$1 w0(Enumeration enumeration) {
        Intrinsics.g(enumeration, "<this>");
        return new CollectionsKt__IteratorsJVMKt$iterator$1(enumeration);
    }

    public static void x0(List list) {
        if (list.size() > 1) {
            Collections.sort(list);
        }
    }

    public static void y0(List list, Comparator comparator) {
        Intrinsics.g(list, "<this>");
        Intrinsics.g(comparator, "comparator");
        if (list.size() > 1) {
            Collections.sort(list, comparator);
        }
    }
}
