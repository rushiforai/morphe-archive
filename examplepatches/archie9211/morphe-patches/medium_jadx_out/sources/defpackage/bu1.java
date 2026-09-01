package defpackage;

import java.io.IOException;
import java.util.AbstractCollection;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public abstract class bu1 extends eu1 {
    public static Object A0(int i, List list) {
        list.getClass();
        if (i < 0 || i >= list.size()) {
            return null;
        }
        return list.get(i);
    }

    public static int B0(Iterable iterable, Object obj) {
        iterable.getClass();
        if (iterable instanceof List) {
            return ((List) iterable).indexOf(obj);
        }
        int i = 0;
        for (Object obj2 : iterable) {
            if (i < 0) {
                d46.i0();
                throw null;
            }
            if (g76.L(obj, obj2)) {
                return i;
            }
            i++;
        }
        return -1;
    }

    public static Set C0(Iterable iterable, Iterable iterable2) {
        iterable.getClass();
        iterable2.getClass();
        Set setP1 = p1(iterable);
        setP1.retainAll(iterable2 instanceof Collection ? (Collection) iterable2 : m1(iterable2));
        return setP1;
    }

    public static final void D0(Iterable iterable, Appendable appendable, CharSequence charSequence, CharSequence charSequence2, CharSequence charSequence3, CharSequence charSequence4, x45 x45Var) throws IOException {
        iterable.getClass();
        charSequence.getClass();
        charSequence2.getClass();
        charSequence3.getClass();
        appendable.append(charSequence2);
        int i = 0;
        for (Object obj : iterable) {
            i++;
            if (i > 1) {
                appendable.append(charSequence);
            }
            yo7.o(appendable, obj, x45Var);
        }
        appendable.append(charSequence3);
    }

    public static /* synthetic */ void E0(Iterable iterable, Appendable appendable, String str, String str2, String str3, x45 x45Var, int i) throws IOException {
        if ((i & 2) != 0) {
            str = ", ";
        }
        String str4 = str;
        String str5 = (i & 4) != 0 ? "" : str2;
        String str6 = (i & 8) != 0 ? "" : str3;
        if ((i & 64) != 0) {
            x45Var = null;
        }
        D0(iterable, appendable, str4, str5, str6, "...", x45Var);
    }

    public static String F0(Iterable iterable, CharSequence charSequence, String str, String str2, x45 x45Var, int i) throws IOException {
        if ((i & 1) != 0) {
            charSequence = ", ";
        }
        CharSequence charSequence2 = charSequence;
        String str3 = (i & 2) != 0 ? "" : str;
        String str4 = (i & 4) != 0 ? "" : str2;
        if ((i & 32) != 0) {
            x45Var = null;
        }
        iterable.getClass();
        charSequence2.getClass();
        str3.getClass();
        StringBuilder sb = new StringBuilder();
        D0(iterable, sb, charSequence2, str3, str4, "...", x45Var);
        return sb.toString();
    }

    public static Object G0(Iterable iterable) {
        iterable.getClass();
        if (iterable instanceof List) {
            return H0((List) iterable);
        }
        Iterator it2 = iterable.iterator();
        if (!it2.hasNext()) {
            ywb.h("Collection is empty.");
            return null;
        }
        Object next = it2.next();
        while (it2.hasNext()) {
            next = it2.next();
        }
        return next;
    }

    public static Object H0(List list) {
        list.getClass();
        if (!list.isEmpty()) {
            return list.get(list.size() - 1);
        }
        ywb.h("List is empty.");
        return null;
    }

    public static Object I0(List list) {
        list.getClass();
        if (list.isEmpty()) {
            return null;
        }
        return list.get(list.size() - 1);
    }

    public static Comparable J0(List list) {
        Iterator it2 = list.iterator();
        if (!it2.hasNext()) {
            return null;
        }
        Comparable comparable = (Comparable) it2.next();
        while (it2.hasNext()) {
            Comparable comparable2 = (Comparable) it2.next();
            if (comparable.compareTo(comparable2) < 0) {
                comparable = comparable2;
            }
        }
        return comparable;
    }

    public static Float K0(Iterable iterable) {
        iterable.getClass();
        Iterator it2 = iterable.iterator();
        if (!it2.hasNext()) {
            return null;
        }
        float fFloatValue = ((Number) it2.next()).floatValue();
        while (it2.hasNext()) {
            fFloatValue = Math.max(fFloatValue, ((Number) it2.next()).floatValue());
        }
        return Float.valueOf(fFloatValue);
    }

    public static Comparable L0(ArrayList arrayList) {
        Iterator it2 = arrayList.iterator();
        if (!it2.hasNext()) {
            ywb.n();
            return null;
        }
        Comparable comparable = (Comparable) it2.next();
        while (it2.hasNext()) {
            Comparable comparable2 = (Comparable) it2.next();
            if (comparable.compareTo(comparable2) < 0) {
                comparable = comparable2;
            }
        }
        return comparable;
    }

    public static Float M0(Iterable iterable) {
        iterable.getClass();
        Iterator it2 = iterable.iterator();
        if (!it2.hasNext()) {
            return null;
        }
        float fFloatValue = ((Number) it2.next()).floatValue();
        while (it2.hasNext()) {
            fFloatValue = Math.min(fFloatValue, ((Number) it2.next()).floatValue());
        }
        return Float.valueOf(fFloatValue);
    }

    public static ArrayList N0(Iterable iterable, Object obj) {
        iterable.getClass();
        ArrayList arrayList = new ArrayList(cu1.k0(iterable, 10));
        boolean z = false;
        for (Object obj2 : iterable) {
            boolean z2 = true;
            if (!z && g76.L(obj2, obj)) {
                z = true;
                z2 = false;
            }
            if (z2) {
                arrayList.add(obj2);
            }
        }
        return arrayList;
    }

    public static ArrayList O0(Iterable iterable, Iterable iterable2) {
        iterable.getClass();
        if (iterable instanceof Collection) {
            return Q0(iterable2, (Collection) iterable);
        }
        ArrayList arrayList = new ArrayList();
        n0(iterable, arrayList);
        n0(iterable2, arrayList);
        return arrayList;
    }

    public static ArrayList P0(Iterable iterable, Object obj) {
        if (iterable instanceof Collection) {
            return R0((Collection) iterable, obj);
        }
        ArrayList arrayList = new ArrayList();
        n0(iterable, arrayList);
        arrayList.add(obj);
        return arrayList;
    }

    public static ArrayList Q0(Iterable iterable, Collection collection) {
        collection.getClass();
        iterable.getClass();
        if (!(iterable instanceof Collection)) {
            ArrayList arrayList = new ArrayList(collection);
            n0(iterable, arrayList);
            return arrayList;
        }
        Collection collection2 = (Collection) iterable;
        ArrayList arrayList2 = new ArrayList(collection2.size() + collection.size());
        arrayList2.addAll(collection);
        arrayList2.addAll(collection2);
        return arrayList2;
    }

    public static ArrayList R0(Collection collection, Object obj) {
        collection.getClass();
        ArrayList arrayList = new ArrayList(collection.size() + 1);
        arrayList.addAll(collection);
        arrayList.add(obj);
        return arrayList;
    }

    public static void S0(List list, x45 x45Var) {
        int size;
        list.getClass();
        x45Var.getClass();
        if (!(list instanceof RandomAccess)) {
            if (!(list instanceof th6) || (list instanceof uh6)) {
                u0(list, x45Var, true);
                return;
            } else {
                pwd.b0("kotlin.collections.MutableIterable", list);
                throw null;
            }
        }
        int size2 = list.size() - 1;
        int i = 0;
        if (size2 >= 0) {
            int i2 = 0;
            while (true) {
                Object obj = list.get(i);
                if (!((Boolean) x45Var.invoke(obj)).booleanValue()) {
                    if (i2 != i) {
                        list.set(i2, obj);
                    }
                    i2++;
                }
                if (i == size2) {
                    break;
                } else {
                    i++;
                }
            }
            i = i2;
        }
        if (i >= list.size() || i > (size = list.size() - 1)) {
            return;
        }
        while (true) {
            list.remove(size);
            if (size == i) {
                return;
            } else {
                size--;
            }
        }
    }

    public static Object T0(ArrayList arrayList) {
        if (!arrayList.isEmpty()) {
            return arrayList.remove(0);
        }
        ywb.h("List is empty.");
        return null;
    }

    public static Object U0(List list) {
        list.getClass();
        if (!list.isEmpty()) {
            return list.remove(list.size() - 1);
        }
        ywb.h("List is empty.");
        return null;
    }

    public static Object V0(AbstractList abstractList) {
        if (abstractList.isEmpty()) {
            return null;
        }
        return abstractList.remove(abstractList.size() - 1);
    }

    public static final int W0(int i, List list) {
        if (i >= 0 && i <= list.size() - 1) {
            return (list.size() - 1) - i;
        }
        StringBuilder sbC = ev6.C("Element index ", i, " must be in range [");
        sbC.append(new n46(0, list.size() - 1, 1));
        sbC.append("].");
        throw new IndexOutOfBoundsException(sbC.toString());
    }

    public static final int X0(int i, List list) {
        if (i >= 0 && i <= list.size()) {
            return list.size() - i;
        }
        StringBuilder sbC = ev6.C("Position index ", i, " must be in range [");
        sbC.append(new n46(0, list.size(), 1));
        sbC.append("].");
        throw new IndexOutOfBoundsException(sbC.toString());
    }

    public static List Y0(Iterable iterable) {
        iterable.getClass();
        if ((iterable instanceof Collection) && ((Collection) iterable).size() <= 1) {
            return m1(iterable);
        }
        List listO1 = o1(iterable);
        Collections.reverse(listO1);
        return listO1;
    }

    public static Object Z0(Iterable iterable) {
        iterable.getClass();
        if (iterable instanceof List) {
            return a1((List) iterable);
        }
        Iterator it2 = iterable.iterator();
        if (!it2.hasNext()) {
            ywb.h("Collection is empty.");
            return null;
        }
        Object next = it2.next();
        if (!it2.hasNext()) {
            return next;
        }
        ay0.e("Collection has more than one element.");
        return null;
    }

    public static Object a1(List list) {
        list.getClass();
        int size = list.size();
        if (size == 0) {
            ywb.h("List is empty.");
            return null;
        }
        if (size == 1) {
            return list.get(0);
        }
        ay0.e("List has more than one element.");
        return null;
    }

    public static Object b1(Iterable iterable) {
        iterable.getClass();
        if (iterable instanceof List) {
            List list = (List) iterable;
            if (list.size() == 1) {
                return list.get(0);
            }
            return null;
        }
        Iterator it2 = iterable.iterator();
        if (!it2.hasNext()) {
            return null;
        }
        Object next = it2.next();
        if (it2.hasNext()) {
            return null;
        }
        return next;
    }

    public static Object c1(List list) {
        list.getClass();
        if (list.size() == 1) {
            return list.get(0);
        }
        return null;
    }

    public static List d1(List list, n46 n46Var) {
        list.getClass();
        n46Var.getClass();
        return n46Var.isEmpty() ? ey3.a : m1(list.subList(n46Var.a, n46Var.b + 1));
    }

    public static List e1(Iterable iterable) {
        iterable.getClass();
        if (!(iterable instanceof Collection)) {
            List listO1 = o1(iterable);
            eu1.l0(listO1);
            return listO1;
        }
        Collection collection = (Collection) iterable;
        if (collection.size() <= 1) {
            return m1(iterable);
        }
        Object[] array = collection.toArray(new Comparable[0]);
        Comparable[] comparableArr = (Comparable[]) array;
        comparableArr.getClass();
        if (comparableArr.length > 1) {
            Arrays.sort(comparableArr);
        }
        return k80.a0(array);
    }

    public static List f1(Iterable iterable, Comparator comparator) {
        iterable.getClass();
        if (!(iterable instanceof Collection)) {
            List listO1 = o1(iterable);
            eu1.m0(listO1, comparator);
            return listO1;
        }
        Collection collection = (Collection) iterable;
        if (collection.size() <= 1) {
            return m1(iterable);
        }
        Object[] array = collection.toArray(new Object[0]);
        array.getClass();
        if (array.length > 1) {
            Arrays.sort(array, comparator);
        }
        List listAsList = Arrays.asList(array);
        listAsList.getClass();
        return listAsList;
    }

    public static List g1(Iterable iterable, int i) {
        iterable.getClass();
        if (i < 0) {
            ywb.g(ev6.w("Requested element count ", i, " is less than zero."));
            return null;
        }
        if (i == 0) {
            return ey3.a;
        }
        if (iterable instanceof Collection) {
            if (i >= ((Collection) iterable).size()) {
                return m1(iterable);
            }
            if (i == 1) {
                return d46.Q(w0(iterable));
            }
        }
        ArrayList arrayList = new ArrayList(i);
        Iterator it2 = iterable.iterator();
        int i2 = 0;
        while (it2.hasNext()) {
            arrayList.add(it2.next());
            i2++;
            if (i2 == i) {
                break;
            }
        }
        return d46.U(arrayList);
    }

    public static List h1(int i, List list) {
        list.getClass();
        if (i < 0) {
            ywb.g(ev6.w("Requested element count ", i, " is less than zero."));
            return null;
        }
        if (i == 0) {
            return ey3.a;
        }
        int size = list.size();
        if (i >= size) {
            return m1(list);
        }
        if (i == 1) {
            return d46.Q(H0(list));
        }
        ArrayList arrayList = new ArrayList(i);
        if (list instanceof RandomAccess) {
            for (int i2 = size - i; i2 < size; i2++) {
                arrayList.add(list.get(i2));
            }
        } else {
            ListIterator listIterator = list.listIterator(size - i);
            while (listIterator.hasNext()) {
                arrayList.add(listIterator.next());
            }
        }
        return arrayList;
    }

    public static boolean[] i1(List list) {
        boolean[] zArr = new boolean[list.size()];
        Iterator it2 = list.iterator();
        int i = 0;
        while (it2.hasNext()) {
            zArr[i] = ((Boolean) it2.next()).booleanValue();
            i++;
        }
        return zArr;
    }

    public static final void j1(Iterable iterable, AbstractCollection abstractCollection) {
        iterable.getClass();
        Iterator it2 = iterable.iterator();
        while (it2.hasNext()) {
            abstractCollection.add(it2.next());
        }
    }

    public static float[] k1(List list) {
        float[] fArr = new float[list.size()];
        Iterator it2 = list.iterator();
        int i = 0;
        while (it2.hasNext()) {
            fArr[i] = ((Number) it2.next()).floatValue();
            i++;
        }
        return fArr;
    }

    public static int[] l1(List list) {
        int[] iArr = new int[list.size()];
        Iterator it2 = list.iterator();
        int i = 0;
        while (it2.hasNext()) {
            iArr[i] = ((Number) it2.next()).intValue();
            i++;
        }
        return iArr;
    }

    public static List m1(Iterable iterable) {
        iterable.getClass();
        if (!(iterable instanceof Collection)) {
            return d46.U(o1(iterable));
        }
        Collection collection = (Collection) iterable;
        int size = collection.size();
        if (size == 0) {
            return ey3.a;
        }
        if (size != 1) {
            return new ArrayList(collection);
        }
        return d46.Q(iterable instanceof List ? ((List) iterable).get(0) : collection.iterator().next());
    }

    public static void n0(Iterable iterable, Collection collection) {
        collection.getClass();
        iterable.getClass();
        if (iterable instanceof Collection) {
            collection.addAll((Collection) iterable);
            return;
        }
        Iterator it2 = iterable.iterator();
        while (it2.hasNext()) {
            collection.add(it2.next());
        }
    }

    public static ArrayList n1(Collection collection) {
        collection.getClass();
        return new ArrayList(collection);
    }

    public static j80 o0(Iterable iterable) {
        iterable.getClass();
        return new j80(1, iterable);
    }

    public static final List o1(Iterable iterable) {
        iterable.getClass();
        if (iterable instanceof Collection) {
            return new ArrayList((Collection) iterable);
        }
        ArrayList arrayList = new ArrayList();
        j1(iterable, arrayList);
        return arrayList;
    }

    public static boolean p0(Iterable iterable, Object obj) {
        iterable.getClass();
        return iterable instanceof Collection ? ((Collection) iterable).contains(obj) : B0(iterable, obj) >= 0;
    }

    public static Set p1(Iterable iterable) {
        iterable.getClass();
        if (iterable instanceof Collection) {
            return new LinkedHashSet((Collection) iterable);
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        j1(iterable, linkedHashSet);
        return linkedHashSet;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static int q0(n46 n46Var) {
        if (n46Var instanceof Collection) {
            return ((Collection) n46Var).size();
        }
        m46 m46Var = new m46(n46Var.a, n46Var.b, n46Var.c);
        int i = 0;
        while (m46Var.c) {
            m46Var.next();
            i++;
            if (i < 0) {
                d46.h0();
                throw null;
            }
        }
        return i;
    }

    public static Set q1(Iterable iterable) {
        iterable.getClass();
        if (iterable instanceof Collection) {
            Collection collection = (Collection) iterable;
            int size = collection.size();
            if (size != 0) {
                if (size == 1) {
                    return qo7.B(iterable instanceof List ? ((List) iterable).get(0) : collection.iterator().next());
                }
                LinkedHashSet linkedHashSet = new LinkedHashSet(ei7.P(collection.size()));
                j1(iterable, linkedHashSet);
                return linkedHashSet;
            }
        } else {
            LinkedHashSet linkedHashSet2 = new LinkedHashSet();
            j1(iterable, linkedHashSet2);
            int size2 = linkedHashSet2.size();
            if (size2 != 0) {
                return size2 != 1 ? linkedHashSet2 : qo7.B(linkedHashSet2.iterator().next());
            }
        }
        return ny3.a;
    }

    public static List r0(Iterable iterable) {
        iterable.getClass();
        return m1(p1(iterable));
    }

    public static ArrayList r1(Iterable iterable, int i, int i2) {
        iterable.getClass();
        if (i <= 0 || i2 <= 0) {
            ywb.g(i != i2 ? ev6.s(i, i2, "Both size ", " and step ", " must be greater than zero.") : ev6.w("size ", i, " must be greater than zero."));
            return null;
        }
        if (!(iterable instanceof RandomAccess) || !(iterable instanceof List)) {
            ArrayList arrayList = new ArrayList();
            Iterator it2 = iterable.iterator();
            it2.getClass();
            Iterator itF = !it2.hasNext() ? dy3.a : vn7.F(new dgc(i, i2, it2, null));
            while (itF.hasNext()) {
                arrayList.add((List) itF.next());
            }
            return arrayList;
        }
        List list = (List) iterable;
        int size = list.size();
        ArrayList arrayList2 = new ArrayList((size / i2) + (size % i2 == 0 ? 0 : 1));
        int i3 = 0;
        while (i3 >= 0 && i3 < size) {
            int i4 = size - i3;
            if (i <= i4) {
                i4 = i;
            }
            ArrayList arrayList3 = new ArrayList(i4);
            for (int i5 = 0; i5 < i4; i5++) {
                arrayList3.add(list.get(i5 + i3));
            }
            arrayList2.add(arrayList3);
            i3 += i2;
        }
        return arrayList2;
    }

    public static List s0(Iterable iterable, int i) {
        ArrayList arrayList;
        iterable.getClass();
        if (i < 0) {
            ywb.g(ev6.w("Requested element count ", i, " is less than zero."));
            return null;
        }
        if (i == 0) {
            return m1(iterable);
        }
        if (iterable instanceof Collection) {
            int size = ((Collection) iterable).size() - i;
            if (size <= 0) {
                return ey3.a;
            }
            if (size == 1) {
                return d46.Q(G0(iterable));
            }
            arrayList = new ArrayList(size);
            if (iterable instanceof List) {
                if (iterable instanceof RandomAccess) {
                    List list = (List) iterable;
                    int size2 = list.size();
                    while (i < size2) {
                        arrayList.add(list.get(i));
                        i++;
                    }
                } else {
                    ListIterator listIterator = ((List) iterable).listIterator(i);
                    while (listIterator.hasNext()) {
                        arrayList.add(listIterator.next());
                    }
                }
                return arrayList;
            }
        } else {
            arrayList = new ArrayList();
        }
        int i2 = 0;
        for (Object obj : iterable) {
            if (i2 >= i) {
                arrayList.add(obj);
            } else {
                i2++;
            }
        }
        return d46.U(arrayList);
    }

    public static i80 s1(List list) {
        list.getClass();
        return new i80(1, new l8(22, list));
    }

    public static List t0(List list) {
        list.getClass();
        int size = list.size() - 1;
        if (size < 0) {
            size = 0;
        }
        return g1(list, size);
    }

    public static ArrayList t1(Iterable iterable, List list) {
        list.getClass();
        Iterator it2 = list.iterator();
        Iterator it3 = iterable.iterator();
        ArrayList arrayList = new ArrayList(Math.min(cu1.k0(list, 10), cu1.k0(iterable, 10)));
        while (it2.hasNext() && it3.hasNext()) {
            arrayList.add(new f09(it2.next(), it3.next()));
        }
        return arrayList;
    }

    public static final boolean u0(Iterable iterable, x45 x45Var, boolean z) {
        Iterator it2 = iterable.iterator();
        boolean z2 = false;
        while (it2.hasNext()) {
            if (((Boolean) x45Var.invoke(it2.next())).booleanValue() == z) {
                it2.remove();
                z2 = true;
            }
        }
        return z2;
    }

    public static ArrayList v0(Iterable iterable) {
        iterable.getClass();
        ArrayList arrayList = new ArrayList();
        for (Object obj : iterable) {
            if (obj != null) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    public static Object w0(Iterable iterable) {
        iterable.getClass();
        if (iterable instanceof List) {
            return x0((List) iterable);
        }
        Iterator it2 = iterable.iterator();
        if (it2.hasNext()) {
            return it2.next();
        }
        ywb.h("Collection is empty.");
        return null;
    }

    public static Object x0(List list) {
        list.getClass();
        if (!list.isEmpty()) {
            return list.get(0);
        }
        ywb.h("List is empty.");
        return null;
    }

    public static Object y0(Iterable iterable) {
        if (iterable instanceof List) {
            List list = (List) iterable;
            if (list.isEmpty()) {
                return null;
            }
            return list.get(0);
        }
        Iterator it2 = iterable.iterator();
        if (it2.hasNext()) {
            return it2.next();
        }
        return null;
    }

    public static Object z0(List list) {
        list.getClass();
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }
}
