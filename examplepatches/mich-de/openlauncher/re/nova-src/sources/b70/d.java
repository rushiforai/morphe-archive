package b70;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.RandomAccess;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;
import kotlin.jvm.internal.markers.KMutableIterable;

/* loaded from: classes.dex */
public abstract class d extends c {
    public static void A0(Collection collection, Object[] elements) {
        Intrinsics.g(collection, "<this>");
        Intrinsics.g(elements, "elements");
        collection.addAll(u90.b.f(elements));
    }

    public static Collection B0(Iterable iterable) {
        Intrinsics.g(iterable, "<this>");
        return iterable instanceof Collection ? (Collection) iterable : g.I1(iterable);
    }

    public static final boolean C0(Iterable iterable, Function1 function1, boolean z11) {
        Iterator it = iterable.iterator();
        boolean z12 = false;
        while (it.hasNext()) {
            if (((Boolean) function1.invoke(it.next())).booleanValue() == z11) {
                it.remove();
                z12 = true;
            }
        }
        return z12;
    }

    public static void D0(Iterable iterable, Function1 function1) {
        Intrinsics.g(iterable, "<this>");
        C0(iterable, function1, true);
    }

    public static boolean E0(List list, Function1 predicate) {
        int i5;
        Intrinsics.g(list, "<this>");
        Intrinsics.g(predicate, "predicate");
        if (!(list instanceof RandomAccess)) {
            if ((list instanceof KMappedMarker) && !(list instanceof KMutableIterable)) {
                TypeIntrinsics.h(list, "kotlin.collections.MutableIterable");
                throw null;
            }
            try {
                return C0(list, predicate, true);
            } catch (ClassCastException e3) {
                Intrinsics.l(e3, TypeIntrinsics.class.getName());
                throw e3;
            }
        }
        int iK = ul.b.K(list);
        if (iK >= 0) {
            int i11 = 0;
            i5 = 0;
            while (true) {
                Object obj = list.get(i11);
                if (!((Boolean) predicate.invoke(obj)).booleanValue()) {
                    if (i5 != i11) {
                        list.set(i5, obj);
                    }
                    i5++;
                }
                if (i11 == iK) {
                    break;
                }
                i11++;
            }
        } else {
            i5 = 0;
        }
        if (i5 >= list.size()) {
            return false;
        }
        int iK2 = ul.b.K(list);
        if (i5 <= iK2) {
            while (true) {
                list.remove(iK2);
                if (iK2 == i5) {
                    break;
                }
                iK2--;
            }
        }
        return true;
    }

    public static Object F0(List list) {
        if (list.isEmpty()) {
            throw new NoSuchElementException("List is empty.");
        }
        return list.remove(0);
    }

    public static Object G0(List list) {
        Intrinsics.g(list, "<this>");
        if (list.isEmpty()) {
            return null;
        }
        return list.remove(0);
    }

    public static Object H0(List list) {
        Intrinsics.g(list, "<this>");
        if (list.isEmpty()) {
            throw new NoSuchElementException("List is empty.");
        }
        return list.remove(ul.b.K(list));
    }

    public static Object I0(List list) {
        Intrinsics.g(list, "<this>");
        if (list.isEmpty()) {
            return null;
        }
        return list.remove(ul.b.K(list));
    }

    public static void z0(Iterable elements, Collection collection) {
        Intrinsics.g(collection, "<this>");
        Intrinsics.g(elements, "elements");
        if (elements instanceof Collection) {
            collection.addAll((Collection) elements);
            return;
        }
        Iterator it = elements.iterator();
        while (it.hasNext()) {
            collection.add(it.next());
        }
    }
}
