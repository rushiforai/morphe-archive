package xk;

import androidx.compose.ui.node.LayoutNode;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.SortedSet;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.time.Duration;

/* loaded from: classes3.dex */
public abstract class w {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f96036c = 3;

    public static Object[] d(int i5, int i11, Object[] objArr, Object[] objArr2) {
        return Arrays.copyOfRange(objArr, i5, i11, objArr2.getClass());
    }

    public static Object g(int i5) {
        if (i5 < 2 || i5 > 1073741824 || Integer.highestOneBit(i5) != i5) {
            throw new IllegalArgumentException(b.c0.h(i5, "must be power of 2 between 2^1 and 2^30: "));
        }
        return i5 <= 256 ? new byte[i5] : i5 <= 65536 ? new short[i5] : new int[i5];
    }

    public static boolean h(Set set, Object obj) {
        if (set == obj) {
            return true;
        }
        if (!(obj instanceof Set)) {
            return false;
        }
        Set set2 = (Set) obj;
        try {
            if (set.size() == set2.size()) {
                return set.containsAll(set2);
            }
            return false;
        } catch (ClassCastException | NullPointerException unused) {
            return false;
        }
    }

    public static e3 j(Set set, vk.m mVar) {
        if (set instanceof SortedSet) {
            Set set2 = (SortedSet) set;
            if (!(set2 instanceof e3)) {
                return new f3(set2, mVar);
            }
            e3 e3Var = (e3) set2;
            vk.m mVar2 = e3Var.f95905b;
            mVar2.getClass();
            return new f3((SortedSet) e3Var.f95904a, new vk.n(Arrays.asList(mVar2, mVar)));
        }
        if (!(set instanceof e3)) {
            set.getClass();
            return new e3(set, mVar);
        }
        e3 e3Var2 = (e3) set;
        vk.m mVar3 = e3Var2.f95905b;
        mVar3.getClass();
        return new e3(e3Var2.f95904a, new vk.n(Arrays.asList(mVar3, mVar)));
    }

    public static boolean k(Comparator comparator, Collection collection) {
        Object objComparator;
        comparator.getClass();
        collection.getClass();
        if (collection instanceof SortedSet) {
            objComparator = ((SortedSet) collection).comparator();
            if (objComparator == null) {
                objComparator = i2.f95937b;
            }
        } else {
            if (!(collection instanceof h3)) {
                return false;
            }
            objComparator = ((k1) ((h3) collection)).f95950d;
        }
        return comparator.equals(objComparator);
    }

    public static int l(Set set) {
        Iterator it = set.iterator();
        int i5 = 0;
        while (it.hasNext()) {
            Object next = it.next();
            i5 = ~(~(i5 + (next != null ? next.hashCode() : 0)));
        }
        return i5;
    }

    public static d3 n(Set set, d1 d1Var) {
        vk.b0.g(set, "set1");
        vk.b0.g(d1Var, "set2");
        return new d3(set, d1Var);
    }

    public static int o(int i5, int i11, int i12) {
        return (i5 & (~i12)) | (i11 & i12);
    }

    public static Comparable p(Duration duration, Duration duration2) {
        return duration.compareTo(duration2) >= 0 ? duration : duration2;
    }

    public static Object[] q(int i5, Object[] objArr) {
        if (objArr.length != 0) {
            objArr = Arrays.copyOf(objArr, 0);
        }
        return Arrays.copyOf(objArr, i5);
    }

    public static int r(int i5) {
        return (i5 + 1) * (i5 < 32 ? 4 : 2);
    }

    public static Set t() {
        return Collections.newSetFromMap(new ConcurrentHashMap());
    }

    public static HashSet u(int i5) {
        int iCeil;
        if (i5 < 3) {
            w20.e.e(i5, "expectedSize");
            iCeil = i5 + 1;
        } else {
            iCeil = i5 < 1073741824 ? (int) Math.ceil(i5 / 0.75d) : LayoutNode.NotPlacedPlaceOrder;
        }
        return new HashSet(iCeil);
    }

    public static StringBuilder v(int i5) {
        w20.e.e(i5, "size");
        return new StringBuilder((int) Math.min(i5 * 8, 1073741824L));
    }

    public static int w(Object obj, Object obj2, int i5, Object obj3, int[] iArr, Object[] objArr, Object[] objArr2) {
        int i11;
        int i12;
        int iQ = w20.h.q(obj);
        int i13 = iQ & i5;
        int iY = y(i13, obj3);
        if (iY != 0) {
            int i14 = ~i5;
            int i15 = iQ & i14;
            int i16 = -1;
            while (true) {
                i11 = iY - 1;
                i12 = iArr[i11];
                if ((i12 & i14) == i15 && ps.v.q(obj, objArr[i11]) && (objArr2 == null || ps.v.q(obj2, objArr2[i11]))) {
                    break;
                }
                int i17 = i12 & i5;
                if (i17 == 0) {
                    break;
                }
                i16 = i11;
                iY = i17;
            }
            int i18 = i12 & i5;
            if (i16 == -1) {
                z(i13, i18, obj3);
                return i11;
            }
            iArr[i16] = o(iArr[i16], i18, i5);
            return i11;
        }
        return -1;
    }

    public static boolean x(g3 g3Var, Collection collection) {
        collection.getClass();
        if (collection instanceof f2) {
            collection = ((f2) collection).a0();
        }
        boolean zRemove = false;
        if (!(collection instanceof Set) || collection.size() <= g3Var.size()) {
            Iterator it = collection.iterator();
            while (it.hasNext()) {
                zRemove |= g3Var.remove(it.next());
            }
            return zRemove;
        }
        Iterator<E> it2 = g3Var.iterator();
        while (it2.hasNext()) {
            if (collection.contains(it2.next())) {
                it2.remove();
                zRemove = true;
            }
        }
        return zRemove;
    }

    public static int y(int i5, Object obj) {
        return obj instanceof byte[] ? ((byte[]) obj)[i5] & 255 : obj instanceof short[] ? ((short[]) obj)[i5] & 65535 : ((int[]) obj)[i5];
    }

    public static void z(int i5, int i11, Object obj) {
        if (obj instanceof byte[]) {
            ((byte[]) obj)[i5] = (byte) i11;
        } else if (obj instanceof short[]) {
            ((short[]) obj)[i5] = (short) i11;
        } else {
            ((int[]) obj)[i5] = i11;
        }
    }

    public abstract Object delegate();

    public String toString() {
        switch (this.f96036c) {
            case 3:
                return delegate().toString();
            default:
                return super.toString();
        }
    }
}
