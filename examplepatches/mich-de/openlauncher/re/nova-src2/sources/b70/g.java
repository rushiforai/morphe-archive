package b70;

import ab.e0;
import b.c0;
import java.io.IOException;
import java.util.AbstractCollection;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.ListIterator;
import java.util.NoSuchElementException;
import java.util.RandomAccess;
import java.util.Set;
import kotlin.Pair;
import kotlin.collections.CollectionsKt___CollectionsKt$asSequence$$inlined$Sequence$1;
import kotlin.collections.EmptyList;
import kotlin.collections.EmptySet;
import kotlin.collections.IndexingIterable;
import kotlin.collections.SlidingWindowKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.random.Random;
import kotlin.ranges.IntRange;

/* loaded from: classes.dex */
public abstract class g extends e {
    public static Object A1(List list) {
        Intrinsics.g(list, "<this>");
        if (list.size() == 1) {
            return list.get(0);
        }
        return null;
    }

    public static List B1(List list, IntRange indices) {
        Intrinsics.g(list, "<this>");
        Intrinsics.g(indices, "indices");
        return indices.isEmpty() ? EmptyList.f71733a : I1(list.subList(indices.f71906a, indices.f71907b + 1));
    }

    public static List C1(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        if (!(iterable instanceof Collection)) {
            List listL1 = L1(iterable);
            c.x0(listL1);
            return listL1;
        }
        Collection collection = (Collection) iterable;
        if (collection.size() <= 1) {
            return I1(iterable);
        }
        Object[] array = collection.toArray(new Comparable[0]);
        u90.b.e0((Comparable[]) array);
        return u90.b.f(array);
    }

    public static List D1(Comparator comparator, Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        Intrinsics.g(comparator, "comparator");
        if (!(iterable instanceof Collection)) {
            List listL1 = L1(iterable);
            c.y0(listL1, comparator);
            return listL1;
        }
        Collection collection = (Collection) iterable;
        if (collection.size() <= 1) {
            return I1(iterable);
        }
        Object[] array = collection.toArray(new Object[0]);
        u90.b.f0(array, comparator);
        return u90.b.f(array);
    }

    public static List E1(Iterable iterable, int i5) {
        Intrinsics.g(iterable, "<this>");
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.i(i5, "Requested element count ", " is less than zero.").toString());
        }
        if (i5 == 0) {
            return EmptyList.f71733a;
        }
        if (iterable instanceof Collection) {
            if (i5 >= ((Collection) iterable).size()) {
                return I1(iterable);
            }
            if (i5 == 1) {
                return ul.b.P(V0(iterable));
            }
        }
        ArrayList arrayList = new ArrayList(i5);
        Iterator it = iterable.iterator();
        int i11 = 0;
        while (it.hasNext()) {
            arrayList.add(it.next());
            i11++;
            if (i11 == i5) {
                break;
            }
        }
        return ul.b.U(arrayList);
    }

    public static List F1(int i5, List list) {
        Intrinsics.g(list, "<this>");
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.i(i5, "Requested element count ", " is less than zero.").toString());
        }
        if (i5 == 0) {
            return EmptyList.f71733a;
        }
        int size = list.size();
        if (i5 >= size) {
            return I1(list);
        }
        if (i5 == 1) {
            return ul.b.P(h1(list));
        }
        ArrayList arrayList = new ArrayList(i5);
        if (list instanceof RandomAccess) {
            for (int i11 = size - i5; i11 < size; i11++) {
                arrayList.add(list.get(i11));
            }
        } else {
            ListIterator listIterator = list.listIterator(size - i5);
            while (listIterator.hasNext()) {
                arrayList.add(listIterator.next());
            }
        }
        return arrayList;
    }

    public static final void G1(Iterable iterable, AbstractCollection abstractCollection) {
        Intrinsics.g(iterable, "<this>");
        Iterator it = iterable.iterator();
        while (it.hasNext()) {
            abstractCollection.add(it.next());
        }
    }

    public static int[] H1(Collection collection) {
        Intrinsics.g(collection, "<this>");
        int[] iArr = new int[collection.size()];
        Iterator it = collection.iterator();
        int i5 = 0;
        while (it.hasNext()) {
            iArr[i5] = ((Number) it.next()).intValue();
            i5++;
        }
        return iArr;
    }

    public static List I1(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        if (!(iterable instanceof Collection)) {
            return ul.b.U(L1(iterable));
        }
        Collection collection = (Collection) iterable;
        int size = collection.size();
        if (size == 0) {
            return EmptyList.f71733a;
        }
        if (size != 1) {
            return K1(collection);
        }
        return ul.b.P(iterable instanceof List ? ((List) iterable).get(0) : collection.iterator().next());
    }

    public static long[] J1(Collection collection) {
        Intrinsics.g(collection, "<this>");
        long[] jArr = new long[collection.size()];
        Iterator it = collection.iterator();
        int i5 = 0;
        while (it.hasNext()) {
            jArr[i5] = ((Number) it.next()).longValue();
            i5++;
        }
        return jArr;
    }

    public static ArrayList K1(Collection collection) {
        Intrinsics.g(collection, "<this>");
        return new ArrayList(collection);
    }

    public static final List L1(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        if (iterable instanceof Collection) {
            return K1((Collection) iterable);
        }
        ArrayList arrayList = new ArrayList();
        G1(iterable, arrayList);
        return arrayList;
    }

    public static CollectionsKt___CollectionsKt$asSequence$$inlined$Sequence$1 M0(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        return new CollectionsKt___CollectionsKt$asSequence$$inlined$Sequence$1(iterable);
    }

    public static Set M1(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        if (iterable instanceof Collection) {
            return new LinkedHashSet((Collection) iterable);
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        G1(iterable, linkedHashSet);
        return linkedHashSet;
    }

    public static ArrayList N0(Iterable iterable, int i5) {
        Intrinsics.g(iterable, "<this>");
        SlidingWindowKt.a(i5, i5);
        if (!(iterable instanceof RandomAccess) || !(iterable instanceof List)) {
            ArrayList arrayList = new ArrayList();
            Iterator itB = SlidingWindowKt.b(iterable.iterator(), i5, i5);
            while (itB.hasNext()) {
                arrayList.add((List) itB.next());
            }
            return arrayList;
        }
        List list = (List) iterable;
        int size = list.size();
        ArrayList arrayList2 = new ArrayList((size / i5) + (size % i5 == 0 ? 0 : 1));
        int i11 = 0;
        while (i11 >= 0 && i11 < size) {
            int i12 = size - i11;
            if (i5 <= i12) {
                i12 = i5;
            }
            ArrayList arrayList3 = new ArrayList(i12);
            for (int i13 = 0; i13 < i12; i13++) {
                arrayList3.add(list.get(i13 + i11));
            }
            arrayList2.add(arrayList3);
            i11 += i5;
        }
        return arrayList2;
    }

    public static Set N1(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        if (!(iterable instanceof Collection)) {
            LinkedHashSet linkedHashSet = new LinkedHashSet();
            G1(iterable, linkedHashSet);
            int size = linkedHashSet.size();
            return size != 0 ? size != 1 ? linkedHashSet : e0.U(linkedHashSet.iterator().next()) : EmptySet.f71734a;
        }
        Collection collection = (Collection) iterable;
        int size2 = collection.size();
        if (size2 == 0) {
            return EmptySet.f71734a;
        }
        if (size2 == 1) {
            return e0.U(iterable instanceof List ? ((List) iterable).get(0) : collection.iterator().next());
        }
        LinkedHashSet linkedHashSet2 = new LinkedHashSet(k.d0(collection.size()));
        G1(iterable, linkedHashSet2);
        return linkedHashSet2;
    }

    public static boolean O0(Iterable iterable, Object obj) {
        Intrinsics.g(iterable, "<this>");
        return iterable instanceof Collection ? ((Collection) iterable).contains(obj) : a1(iterable, obj) >= 0;
    }

    public static IndexingIterable O1(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        return new IndexingIterable(new as.c(iterable, 5));
    }

    public static List P0(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        return I1(M1(iterable));
    }

    public static ArrayList P1(Iterable iterable, Iterable other) {
        Intrinsics.g(iterable, "<this>");
        Intrinsics.g(other, "other");
        Iterator it = iterable.iterator();
        Iterator it2 = other.iterator();
        ArrayList arrayList = new ArrayList(Math.min(c.u0(iterable, 10), c.u0(other, 10)));
        while (it.hasNext() && it2.hasNext()) {
            arrayList.add(new Pair(it.next(), it2.next()));
        }
        return arrayList;
    }

    public static List Q0(Iterable iterable, int i5) {
        ArrayList arrayList;
        Intrinsics.g(iterable, "<this>");
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.i(i5, "Requested element count ", " is less than zero.").toString());
        }
        if (i5 == 0) {
            return I1(iterable);
        }
        if (iterable instanceof Collection) {
            int size = ((Collection) iterable).size() - i5;
            if (size <= 0) {
                return EmptyList.f71733a;
            }
            if (size == 1) {
                return ul.b.P(g1(iterable));
            }
            arrayList = new ArrayList(size);
            if (iterable instanceof List) {
                if (iterable instanceof RandomAccess) {
                    List list = (List) iterable;
                    int size2 = list.size();
                    while (i5 < size2) {
                        arrayList.add(list.get(i5));
                        i5++;
                    }
                } else {
                    ListIterator listIterator = ((List) iterable).listIterator(i5);
                    while (listIterator.hasNext()) {
                        arrayList.add(listIterator.next());
                    }
                }
                return arrayList;
            }
        } else {
            arrayList = new ArrayList();
        }
        int i11 = 0;
        for (Object obj : iterable) {
            if (i11 >= i5) {
                arrayList.add(obj);
            } else {
                i11++;
            }
        }
        return ul.b.U(arrayList);
    }

    public static List R0(List list) {
        Intrinsics.g(list, "<this>");
        List list2 = list;
        int size = list.size() - 1;
        if (size < 0) {
            size = 0;
        }
        return E1(list2, size);
    }

    public static final Object S0(Iterable iterable, int i5) {
        Intrinsics.g(iterable, "<this>");
        boolean z11 = iterable instanceof List;
        if (z11) {
            return ((List) iterable).get(i5);
        }
        f fVar = new f(i5, 0);
        if (z11) {
            List list = (List) iterable;
            if (i5 >= 0 && i5 < list.size()) {
                return list.get(i5);
            }
            fVar.invoke(Integer.valueOf(i5));
            throw null;
        }
        if (i5 < 0) {
            fVar.invoke(Integer.valueOf(i5));
            throw null;
        }
        int i11 = 0;
        for (Object obj : iterable) {
            int i12 = i11 + 1;
            if (i5 == i11) {
                return obj;
            }
            i11 = i12;
        }
        fVar.invoke(Integer.valueOf(i5));
        throw null;
    }

    public static ArrayList T0(Iterable iterable, Function1 function1) {
        Intrinsics.g(iterable, "<this>");
        ArrayList arrayList = new ArrayList();
        for (Object obj : iterable) {
            if (((Boolean) function1.invoke(obj)).booleanValue()) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    public static ArrayList U0(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        ArrayList arrayList = new ArrayList();
        for (Object obj : iterable) {
            if (obj != null) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    public static Object V0(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        if (iterable instanceof List) {
            return W0((List) iterable);
        }
        Iterator it = iterable.iterator();
        if (it.hasNext()) {
            return it.next();
        }
        throw new NoSuchElementException("Collection is empty.");
    }

    public static Object W0(List list) {
        Intrinsics.g(list, "<this>");
        if (list.isEmpty()) {
            throw new NoSuchElementException("List is empty.");
        }
        return list.get(0);
    }

    public static Object X0(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        if (iterable instanceof List) {
            List list = (List) iterable;
            if (list.isEmpty()) {
                return null;
            }
            return list.get(0);
        }
        Iterator it = iterable.iterator();
        if (it.hasNext()) {
            return it.next();
        }
        return null;
    }

    public static Object Y0(List list) {
        Intrinsics.g(list, "<this>");
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    public static Object Z0(int i5, List list) {
        Intrinsics.g(list, "<this>");
        if (i5 < 0 || i5 >= list.size()) {
            return null;
        }
        return list.get(i5);
    }

    public static int a1(Iterable iterable, Object obj) {
        Intrinsics.g(iterable, "<this>");
        if (iterable instanceof List) {
            return ((List) iterable).indexOf(obj);
        }
        int i5 = 0;
        for (Object obj2 : iterable) {
            if (i5 < 0) {
                ul.b.e0();
                throw null;
            }
            if (Intrinsics.b(obj, obj2)) {
                return i5;
            }
            i5++;
        }
        return -1;
    }

    public static int b1(List list, Object obj) {
        Intrinsics.g(list, "<this>");
        return list.indexOf(obj);
    }

    public static Set c1(Iterable iterable, Iterable other) {
        Intrinsics.g(iterable, "<this>");
        Intrinsics.g(other, "other");
        Set setM1 = M1(iterable);
        setM1.retainAll(d.B0(other));
        return setM1;
    }

    public static final void d1(Iterable iterable, Appendable buffer, CharSequence charSequence, CharSequence prefix, CharSequence postfix, int i5, CharSequence charSequence2, Function1 function1) throws IOException {
        Intrinsics.g(iterable, "<this>");
        Intrinsics.g(buffer, "buffer");
        Intrinsics.g(prefix, "prefix");
        Intrinsics.g(postfix, "postfix");
        buffer.append(prefix);
        int i11 = 0;
        for (Object obj : iterable) {
            i11++;
            if (i11 > 1) {
                buffer.append(charSequence);
            }
            if (i5 >= 0 && i11 > i5) {
                break;
            } else {
                bh.g.B(buffer, obj, function1);
            }
        }
        if (i5 >= 0 && i11 > i5) {
            buffer.append(charSequence2);
        }
        buffer.append(postfix);
    }

    public static /* synthetic */ void e1(Iterable iterable, StringBuilder sb2, String str, String str2, String str3, Function1 function1, int i5) throws IOException {
        String str4 = (i5 & 4) != 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str2;
        String str5 = (i5 & 8) != 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str3;
        if ((i5 & 64) != 0) {
            function1 = null;
        }
        d1(iterable, sb2, str, str4, str5, -1, "...", function1);
    }

    public static String f1(Iterable iterable, String str, String str2, String str3, int i5, Function1 function1, int i11) throws IOException {
        if ((i11 & 1) != 0) {
            str = ", ";
        }
        String str4 = str;
        int i12 = i11 & 2;
        String str5 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        String prefix = i12 != 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str2;
        String str6 = (i11 & 4) != 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str3;
        if ((i11 & 8) != 0) {
            i5 = -1;
        }
        int i13 = i5;
        if ((i11 & 16) != 0) {
            str5 = "...";
        }
        String str7 = str5;
        if ((i11 & 32) != 0) {
            function1 = null;
        }
        Intrinsics.g(iterable, "<this>");
        Intrinsics.g(prefix, "prefix");
        StringBuilder sb2 = new StringBuilder();
        d1(iterable, sb2, str4, prefix, str6, i13, str7, function1);
        return sb2.toString();
    }

    public static Object g1(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        if (iterable instanceof List) {
            return h1((List) iterable);
        }
        Iterator it = iterable.iterator();
        if (!it.hasNext()) {
            throw new NoSuchElementException("Collection is empty.");
        }
        Object next = it.next();
        while (it.hasNext()) {
            next = it.next();
        }
        return next;
    }

    public static Object h1(List list) {
        Intrinsics.g(list, "<this>");
        if (list.isEmpty()) {
            throw new NoSuchElementException("List is empty.");
        }
        return list.get(ul.b.K(list));
    }

    public static Object i1(List list) {
        Intrinsics.g(list, "<this>");
        if (list.isEmpty()) {
            return null;
        }
        return a2.c.e(1, list);
    }

    public static Comparable j1(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        Iterator it = iterable.iterator();
        if (!it.hasNext()) {
            return null;
        }
        Comparable comparable = (Comparable) it.next();
        while (it.hasNext()) {
            Comparable comparable2 = (Comparable) it.next();
            if (comparable.compareTo(comparable2) < 0) {
                comparable = comparable2;
            }
        }
        return comparable;
    }

    public static Double k1(ArrayList arrayList) {
        Iterator it = arrayList.iterator();
        if (!it.hasNext()) {
            return null;
        }
        double dDoubleValue = ((Number) it.next()).doubleValue();
        while (it.hasNext()) {
            dDoubleValue = Math.max(dDoubleValue, ((Number) it.next()).doubleValue());
        }
        return Double.valueOf(dDoubleValue);
    }

    public static Float l1(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        Iterator it = iterable.iterator();
        if (!it.hasNext()) {
            return null;
        }
        float fFloatValue = ((Number) it.next()).floatValue();
        while (it.hasNext()) {
            fFloatValue = Math.max(fFloatValue, ((Number) it.next()).floatValue());
        }
        return Float.valueOf(fFloatValue);
    }

    public static Comparable m1(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        Iterator it = iterable.iterator();
        if (!it.hasNext()) {
            return null;
        }
        Comparable comparable = (Comparable) it.next();
        while (it.hasNext()) {
            Comparable comparable2 = (Comparable) it.next();
            if (comparable.compareTo(comparable2) > 0) {
                comparable = comparable2;
            }
        }
        return comparable;
    }

    public static Float n1(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        Iterator it = iterable.iterator();
        if (!it.hasNext()) {
            return null;
        }
        float fFloatValue = ((Number) it.next()).floatValue();
        while (it.hasNext()) {
            fFloatValue = Math.min(fFloatValue, ((Number) it.next()).floatValue());
        }
        return Float.valueOf(fFloatValue);
    }

    public static Object o1(Comparator comparator, Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        Iterator it = iterable.iterator();
        if (!it.hasNext()) {
            return null;
        }
        Object next = it.next();
        while (it.hasNext()) {
            Object next2 = it.next();
            if (comparator.compare(next, next2) > 0) {
                next = next2;
            }
        }
        return next;
    }

    public static ArrayList p1(Iterable iterable, Object obj) {
        Intrinsics.g(iterable, "<this>");
        ArrayList arrayList = new ArrayList(c.u0(iterable, 10));
        boolean z11 = false;
        for (Object obj2 : iterable) {
            boolean z12 = true;
            if (!z11 && Intrinsics.b(obj2, obj)) {
                z11 = true;
                z12 = false;
            }
            if (z12) {
                arrayList.add(obj2);
            }
        }
        return arrayList;
    }

    public static List q1(List list, Collection elements) {
        Intrinsics.g(elements, "elements");
        Collection collectionB0 = d.B0(elements);
        if (collectionB0.isEmpty()) {
            return I1(list);
        }
        ArrayList arrayList = new ArrayList();
        for (Object obj : list) {
            if (!collectionB0.contains(obj)) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    public static ArrayList r1(Iterable iterable, Iterable elements) {
        Intrinsics.g(iterable, "<this>");
        Intrinsics.g(elements, "elements");
        if (iterable instanceof Collection) {
            return t1(elements, (Collection) iterable);
        }
        ArrayList arrayList = new ArrayList();
        d.z0(iterable, arrayList);
        d.z0(elements, arrayList);
        return arrayList;
    }

    public static ArrayList s1(Iterable iterable, Object obj) {
        Intrinsics.g(iterable, "<this>");
        if (iterable instanceof Collection) {
            return u1((Collection) iterable, obj);
        }
        ArrayList arrayList = new ArrayList();
        d.z0(iterable, arrayList);
        arrayList.add(obj);
        return arrayList;
    }

    public static ArrayList t1(Iterable elements, Collection collection) {
        Intrinsics.g(collection, "<this>");
        Intrinsics.g(elements, "elements");
        if (!(elements instanceof Collection)) {
            ArrayList arrayList = new ArrayList(collection);
            d.z0(elements, arrayList);
            return arrayList;
        }
        Collection collection2 = (Collection) elements;
        ArrayList arrayList2 = new ArrayList(collection2.size() + collection.size());
        arrayList2.addAll(collection);
        arrayList2.addAll(collection2);
        return arrayList2;
    }

    public static ArrayList u1(Collection collection, Object obj) {
        Intrinsics.g(collection, "<this>");
        ArrayList arrayList = new ArrayList(collection.size() + 1);
        arrayList.addAll(collection);
        arrayList.add(obj);
        return arrayList;
    }

    public static Object v1(Collection collection, Random random) {
        Intrinsics.g(collection, "<this>");
        Intrinsics.g(random, "random");
        if (collection.isEmpty()) {
            throw new NoSuchElementException("Collection is empty.");
        }
        return S0(collection, random.f(collection.size()));
    }

    public static List w1(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        if ((iterable instanceof Collection) && ((Collection) iterable).size() <= 1) {
            return I1(iterable);
        }
        List listL1 = L1(iterable);
        Collections.reverse(listL1);
        return listL1;
    }

    public static Object x1(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        if (iterable instanceof List) {
            return y1((List) iterable);
        }
        Iterator it = iterable.iterator();
        if (!it.hasNext()) {
            throw new NoSuchElementException("Collection is empty.");
        }
        Object next = it.next();
        if (it.hasNext()) {
            throw new IllegalArgumentException("Collection has more than one element.");
        }
        return next;
    }

    public static Object y1(List list) {
        Intrinsics.g(list, "<this>");
        int size = list.size();
        if (size == 0) {
            throw new NoSuchElementException("List is empty.");
        }
        if (size == 1) {
            return list.get(0);
        }
        throw new IllegalArgumentException("List has more than one element.");
    }

    public static Object z1(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        if (iterable instanceof List) {
            List list = (List) iterable;
            if (list.size() == 1) {
                return list.get(0);
            }
            return null;
        }
        Iterator it = iterable.iterator();
        if (!it.hasNext()) {
            return null;
        }
        Object next = it.next();
        if (it.hasNext()) {
            return null;
        }
        return next;
    }
}
