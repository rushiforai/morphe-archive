package z;

import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMutableCollection;
import kotlin.jvm.internal.markers.KMutableSet;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class f implements Collection, Set, KMutableCollection, KMutableSet {

    /* renamed from: a, reason: collision with root package name */
    public int[] f97764a;

    /* renamed from: b, reason: collision with root package name */
    public Object[] f97765b;

    /* renamed from: c, reason: collision with root package name */
    public int f97766c;

    public f(int i5) {
        this.f97764a = a0.a.f54a;
        this.f97765b = a0.a.f56c;
        if (i5 > 0) {
            w.a(this, i5);
        }
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean add(Object obj) {
        int i5;
        int iB;
        int i11 = this.f97766c;
        if (obj == null) {
            iB = w.b(this, null, 0);
            i5 = 0;
        } else {
            int iHashCode = obj.hashCode();
            i5 = iHashCode;
            iB = w.b(this, obj, iHashCode);
        }
        if (iB >= 0) {
            return false;
        }
        int i12 = ~iB;
        int[] iArr = this.f97764a;
        if (i11 >= iArr.length) {
            int i13 = 8;
            if (i11 >= 8) {
                i13 = (i11 >> 1) + i11;
            } else if (i11 < 4) {
                i13 = 4;
            }
            Object[] objArr = this.f97765b;
            int[] iArr2 = new int[i13];
            this.f97764a = iArr2;
            this.f97765b = new Object[i13];
            if (i11 != this.f97766c) {
                throw new ConcurrentModificationException();
            }
            if (iArr2.length != 0) {
                u90.b.u(0, iArr.length, iArr, iArr2, 6);
                u90.b.w(objArr, 0, this.f97765b, objArr.length, 6);
            }
        }
        if (i12 < i11) {
            int[] iArr3 = this.f97764a;
            int i14 = i12 + 1;
            u90.b.p(i14, i12, iArr3, iArr3, i11);
            Object[] objArr2 = this.f97765b;
            u90.b.t(objArr2, i14, objArr2, i12, i11);
        }
        int i15 = this.f97766c;
        if (i11 == i15) {
            int[] iArr4 = this.f97764a;
            if (i12 < iArr4.length) {
                iArr4[i12] = i5;
                this.f97765b[i12] = obj;
                this.f97766c = i15 + 1;
                return true;
            }
        }
        throw new ConcurrentModificationException();
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean addAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        c(elements.size() + this.f97766c);
        Iterator it = elements.iterator();
        boolean zAdd = false;
        while (it.hasNext()) {
            zAdd |= add(it.next());
        }
        return zAdd;
    }

    public final void c(int i5) {
        int i11 = this.f97766c;
        int[] iArr = this.f97764a;
        if (iArr.length < i5) {
            Object[] objArr = this.f97765b;
            int[] iArr2 = new int[i5];
            this.f97764a = iArr2;
            this.f97765b = new Object[i5];
            if (i11 > 0) {
                u90.b.u(0, i11, iArr, iArr2, 6);
                u90.b.w(objArr, 0, this.f97765b, this.f97766c, 6);
            }
        }
        if (this.f97766c != i11) {
            throw new ConcurrentModificationException();
        }
    }

    @Override // java.util.Collection, java.util.Set
    public final void clear() {
        if (this.f97766c != 0) {
            this.f97764a = a0.a.f54a;
            this.f97765b = a0.a.f56c;
            this.f97766c = 0;
        }
        if (this.f97766c != 0) {
            throw new ConcurrentModificationException();
        }
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        return (obj == null ? w.b(this, null, 0) : w.b(this, obj, obj.hashCode())) >= 0;
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean containsAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        Iterator it = elements.iterator();
        while (it.hasNext()) {
            if (!contains(it.next())) {
                return false;
            }
        }
        return true;
    }

    public final Object d(int i5) {
        int i11 = this.f97766c;
        Object[] objArr = this.f97765b;
        Object obj = objArr[i5];
        if (i11 <= 1) {
            clear();
            return obj;
        }
        int i12 = i11 - 1;
        int[] iArr = this.f97764a;
        if (iArr.length <= 8 || i11 >= iArr.length / 3) {
            if (i5 < i12) {
                int i13 = i5 + 1;
                u90.b.p(i5, i13, iArr, iArr, i11);
                Object[] objArr2 = this.f97765b;
                u90.b.t(objArr2, i5, objArr2, i13, i11);
            }
            this.f97765b[i12] = null;
        } else {
            int i14 = i11 > 8 ? i11 + (i11 >> 1) : 8;
            int[] iArr2 = new int[i14];
            this.f97764a = iArr2;
            this.f97765b = new Object[i14];
            if (i5 > 0) {
                u90.b.u(0, i5, iArr, iArr2, 6);
                u90.b.w(objArr, 0, this.f97765b, i5, 6);
            }
            if (i5 < i12) {
                int i15 = i5 + 1;
                u90.b.p(i5, i15, iArr, this.f97764a, i11);
                u90.b.t(objArr, i5, this.f97765b, i15, i11);
            }
        }
        if (i11 != this.f97766c) {
            throw new ConcurrentModificationException();
        }
        this.f97766c = i12;
        return obj;
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Set) || this.f97766c != ((Set) obj).size()) {
            return false;
        }
        try {
            int i5 = this.f97766c;
            for (int i11 = 0; i11 < i5; i11++) {
                if (!((Set) obj).contains(this.f97765b[i11])) {
                    return false;
                }
            }
            return true;
        } catch (ClassCastException | NullPointerException unused) {
            return false;
        }
    }

    @Override // java.util.Collection, java.util.Set
    public final int hashCode() {
        int[] iArr = this.f97764a;
        int i5 = this.f97766c;
        int i11 = 0;
        for (int i12 = 0; i12 < i5; i12++) {
            i11 += iArr[i12];
        }
        return i11;
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean isEmpty() {
        return this.f97766c <= 0;
    }

    @Override // java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        return new a(this);
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean remove(Object obj) {
        int iB = obj == null ? w.b(this, null, 0) : w.b(this, obj, obj.hashCode());
        if (iB < 0) {
            return false;
        }
        d(iB);
        return true;
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean removeAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        Iterator it = elements.iterator();
        boolean zRemove = false;
        while (it.hasNext()) {
            zRemove |= remove(it.next());
        }
        return zRemove;
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean retainAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        boolean z11 = false;
        for (int i5 = this.f97766c - 1; -1 < i5; i5--) {
            if (!b70.g.O0(elements, this.f97765b[i5])) {
                d(i5);
                z11 = true;
            }
        }
        return z11;
    }

    @Override // java.util.Collection, java.util.Set
    public final int size() {
        return this.f97766c;
    }

    @Override // java.util.Collection, java.util.Set
    public final Object[] toArray() {
        return u90.b.y(this.f97765b, 0, this.f97766c);
    }

    public final String toString() {
        if (isEmpty()) {
            return "{}";
        }
        StringBuilder sb2 = new StringBuilder(this.f97766c * 14);
        sb2.append(AbstractJsonLexerKt.BEGIN_OBJ);
        int i5 = this.f97766c;
        for (int i11 = 0; i11 < i5; i11++) {
            if (i11 > 0) {
                sb2.append(", ");
            }
            Object obj = this.f97765b[i11];
            if (obj != this) {
                sb2.append(obj);
            } else {
                sb2.append("(this Set)");
            }
        }
        sb2.append(AbstractJsonLexerKt.END_OBJ);
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    @Override // java.util.Collection, java.util.Set
    public final Object[] toArray(Object[] array) {
        Intrinsics.g(array, "array");
        Object[] objArrC = e1.c(this.f97766c, array);
        u90.b.t(this.f97765b, 0, objArrC, 0, this.f97766c);
        return objArrC;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public f(f fVar) {
        this(0);
        if (fVar != null) {
            int i5 = fVar.f97766c;
            c(this.f97766c + i5);
            if (this.f97766c != 0) {
                for (int i11 = 0; i11 < i5; i11++) {
                    add(fVar.f97765b[i11]);
                }
            } else if (i5 > 0) {
                u90.b.u(0, i5, fVar.f97764a, this.f97764a, 6);
                u90.b.w(fVar.f97765b, 0, this.f97765b, i5, 6);
                if (this.f97766c == 0) {
                    this.f97766c = i5;
                    return;
                }
                throw new ConcurrentModificationException();
            }
        }
    }

    public f(Collection collection) {
        this(0);
        if (collection != null) {
            addAll(collection);
        }
    }
}
