package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.Vm, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1303Vm {
    public static int A00(@CheckForNull List<?> list, Object element) {
        if (list instanceof RandomAccess) {
            return A02(list, element);
        }
        ListIterator<?> listIterator = list.listIterator();
        while (listIterator.hasNext()) {
            if (A6.A01(element, listIterator.next())) {
                return listIterator.previousIndex();
            }
        }
        return -1;
    }

    public static int A01(@CheckForNull List<?> list, Object element) {
        if (list instanceof RandomAccess) {
            return A03(list, element);
        }
        ListIterator<?> listIterator = list.listIterator(list.size());
        while (listIterator.hasPrevious()) {
            if (A6.A01(element, listIterator.previous())) {
                return listIterator.nextIndex();
            }
        }
        return -1;
    }

    public static int A02(@CheckForNull List<?> list, Object element) {
        int size = list.size();
        if (element == null) {
            for (int i5 = 0; i5 < size; i5++) {
                if (list.get(i5) == null) {
                    return i5;
                }
            }
            return -1;
        }
        for (int i11 = 0; i11 < size; i11++) {
            if (element.equals(list.get(i11))) {
                return i11;
            }
        }
        return -1;
    }

    public static int A03(@CheckForNull List<?> list, Object element) {
        if (element == null) {
            for (int size = list.size() - 1; size >= 0; size--) {
                if (list.get(size) == null) {
                    return size;
                }
            }
            return -1;
        }
        int i5 = list.size();
        for (int i11 = i5 - 1; i11 >= 0; i11--) {
            if (element.equals(list.get(i11))) {
                return i11;
            }
        }
        return -1;
    }

    public static <E> ArrayList<E> A04() {
        return new ArrayList<>();
    }

    public static <E> ArrayList<E> A05(Iterator<? extends E> elements) {
        ArrayList<E> list = A04();
        AbstractC1304Vn.A0A(list, elements);
        return list;
    }

    public static boolean A06(@CheckForNull List<?> thisList, Object other) {
        if (other == AbstractC1335Wu.A04(thisList)) {
            return true;
        }
        if (!(other instanceof List)) {
            return false;
        }
        List<?> thisList2 = (List) other;
        int size = thisList.size();
        if (size != thisList2.size()) {
            return false;
        }
        if ((thisList instanceof RandomAccess) && (thisList2 instanceof RandomAccess)) {
            for (int i5 = 0; i5 < size; i5++) {
                if (!A6.A01(thisList.get(i5), thisList2.get(i5))) {
                    return false;
                }
            }
            return true;
        }
        return AbstractC1304Vn.A0F(thisList.iterator(), thisList2.iterator());
    }
}
