package kotlin.collections;

import androidx.compose.ui.node.LayoutNode;
import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.markers.KMappedMarker;

@SinceKotlin
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\b\u0007\b'\u0018\u0000*\u0006\b\u0000\u0010\u0001 \u00012\b\u0012\u0004\u0012\u00028\u00000\u00022\b\u0012\u0004\u0012\u00028\u00000\u0003:\u0004\u0006\u0007\b\tB\t\b\u0004¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\n"}, d2 = {"Lkotlin/collections/AbstractList;", "E", "Lkotlin/collections/AbstractCollection;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "kotlin/collections/b", "b70/a", "kotlin/collections/a", k.O, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public abstract class AbstractList<E> extends AbstractCollection<E> implements List<E>, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public static final Companion f71712a = new Companion(0);

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\b\u0080\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u0005\u0010\u0006¨\u0006\u0007"}, d2 = {"Lkotlin/collections/AbstractList$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "maxArraySize", "I", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(int i5) {
            this();
        }

        public static void a(int i5, int i11, int i12) {
            if (i5 < 0 || i11 > i12) {
                StringBuilder sbT = c0.t(i5, "startIndex: ", ", endIndex: ", i11, ", size: ");
                sbT.append(i12);
                throw new IndexOutOfBoundsException(sbT.toString());
            }
            if (i5 > i11) {
                throw new IllegalArgumentException(c0.g(i5, i11, "startIndex: ", " > endIndex: "));
            }
        }

        public static void b(int i5, int i11) {
            if (i5 < 0 || i5 >= i11) {
                throw new IndexOutOfBoundsException(c0.g(i5, i11, "index: ", ", size: "));
            }
        }

        public static void c(int i5, int i11) {
            if (i5 < 0 || i5 > i11) {
                throw new IndexOutOfBoundsException(c0.g(i5, i11, "index: ", ", size: "));
            }
        }

        public static void d(int i5, int i11, int i12) {
            if (i5 < 0 || i11 > i12) {
                StringBuilder sbT = c0.t(i5, "fromIndex: ", ", toIndex: ", i11, ", size: ");
                sbT.append(i12);
                throw new IndexOutOfBoundsException(sbT.toString());
            }
            if (i5 > i11) {
                throw new IllegalArgumentException(c0.g(i5, i11, "fromIndex: ", " > toIndex: "));
            }
        }

        public static int e(int i5, int i11) {
            int i12 = i5 + (i5 >> 1);
            if (i12 - i11 < 0) {
                i12 = i11;
            }
            if (i12 - 2147483639 <= 0) {
                return i12;
            }
            if (i11 > 2147483639) {
                return LayoutNode.NotPlacedPlaceOrder;
            }
            return 2147483639;
        }

        private Companion() {
        }
    }

    @Override // java.util.List
    public final void add(int i5, Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List
    public final boolean addAll(int i5, Collection collection) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof List)) {
            return false;
        }
        Collection collection = (Collection) obj;
        f71712a.getClass();
        if (size() == collection.size()) {
            Iterator<E> it = collection.iterator();
            Iterator<E> it2 = iterator();
            while (it2.hasNext()) {
                if (!Intrinsics.b(it2.next(), it.next())) {
                }
            }
            return true;
        }
        return false;
    }

    public abstract Object get(int i5);

    @Override // java.util.Collection, java.util.List
    public final int hashCode() {
        f71712a.getClass();
        Iterator<E> it = iterator();
        int iHashCode = 1;
        while (it.hasNext()) {
            E next = it.next();
            iHashCode = (iHashCode * 31) + (next != null ? next.hashCode() : 0);
        }
        return iHashCode;
    }

    public int indexOf(Object obj) {
        Iterator<E> it = iterator();
        int i5 = 0;
        while (it.hasNext()) {
            if (Intrinsics.b(it.next(), obj)) {
                return i5;
            }
            i5++;
        }
        return -1;
    }

    @Override // java.util.Collection, java.lang.Iterable, java.util.List
    public Iterator iterator() {
        return new b70.a(this);
    }

    public int lastIndexOf(Object obj) {
        ListIterator<E> listIterator = listIterator(size());
        while (listIterator.hasPrevious()) {
            if (Intrinsics.b(listIterator.previous(), obj)) {
                return listIterator.nextIndex();
            }
        }
        return -1;
    }

    public ListIterator listIterator() {
        return new a(this, 0);
    }

    @Override // java.util.List
    public final Object remove(int i5) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List
    public final Object set(int i5, Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List
    public List subList(int i5, int i11) {
        return new b(this, i5, i11);
    }

    public ListIterator listIterator(int i5) {
        return new a(this, i5);
    }
}
