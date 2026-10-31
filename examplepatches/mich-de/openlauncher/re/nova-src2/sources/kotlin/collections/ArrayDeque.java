package kotlin.collections;

import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.lang.reflect.Array;
import java.util.Collection;
import java.util.Iterator;
import java.util.NoSuchElementException;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.collections.AbstractList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;

@SinceKotlin
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u0000*\u0004\b\u0000\u0010\u00012\b\u0012\u0004\u0012\u00028\u00000\u0002:\u0001\u0005B\t\b\u0016¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0006"}, d2 = {"Lkotlin/collections/ArrayDeque;", "E", "Lkotlin/collections/AbstractMutableList;", "<init>", "()V", k.O, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class ArrayDeque<E> extends AbstractMutableList<E> {

    /* renamed from: d, reason: collision with root package name */
    public static final Object[] f71721d;

    /* renamed from: a, reason: collision with root package name */
    public int f71722a;

    /* renamed from: b, reason: collision with root package name */
    public Object[] f71723b;

    /* renamed from: c, reason: collision with root package name */
    public int f71724c;

    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0011\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\b\u0080\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0018\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0005X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0006R\u000e\u0010\u0007\u001a\u00020\bX\u0082T¢\u0006\u0002\n\u0000¨\u0006\t"}, d2 = {"Lkotlin/collections/ArrayDeque$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "emptyElementData", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "[Ljava/lang/Object;", "defaultMinCapacity", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(int i5) {
            this();
        }

        private Companion() {
        }
    }

    static {
        new Companion(0);
        f71721d = new Object[0];
    }

    public ArrayDeque(int i5) {
        Object[] objArr;
        if (i5 == 0) {
            objArr = f71721d;
        } else {
            if (i5 <= 0) {
                throw new IllegalArgumentException(c0.h(i5, "Illegal Capacity: "));
            }
            objArr = new Object[i5];
        }
        this.f71723b = objArr;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        addLast(obj);
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        if (elements.isEmpty()) {
            return false;
        }
        o();
        f(elements.size() + getF71724c());
        e(n(getF71724c() + this.f71722a), elements);
        return true;
    }

    public final void addFirst(Object obj) {
        o();
        f(this.f71724c + 1);
        int i5 = this.f71722a;
        int iC0 = i5 == 0 ? c.C0(this.f71723b) : i5 - 1;
        this.f71722a = iC0;
        this.f71723b[iC0] = obj;
        this.f71724c++;
    }

    public final void addLast(Object obj) {
        o();
        f(getF71724c() + 1);
        this.f71723b[n(getF71724c() + this.f71722a)] = obj;
        this.f71724c = getF71724c() + 1;
    }

    @Override // kotlin.collections.AbstractMutableList
    /* renamed from: c, reason: from getter */
    public final int getF71724c() {
        return this.f71724c;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final void clear() {
        if (!isEmpty()) {
            o();
            l(this.f71722a, n(getF71724c() + this.f71722a));
        }
        this.f71722a = 0;
        this.f71724c = 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    @Override // kotlin.collections.AbstractMutableList
    public final Object d(int i5) {
        AbstractList.Companion companion = AbstractList.f71712a;
        int i11 = this.f71724c;
        companion.getClass();
        AbstractList.Companion.b(i5, i11);
        if (i5 == ul.b.K(this)) {
            return removeLast();
        }
        if (i5 == 0) {
            return removeFirst();
        }
        o();
        int iN = n(this.f71722a + i5);
        Object[] objArr = this.f71723b;
        Object obj = objArr[iN];
        if (i5 < (this.f71724c >> 1)) {
            int i12 = this.f71722a;
            if (iN >= i12) {
                u90.b.t(objArr, i12 + 1, objArr, i12, iN);
            } else {
                u90.b.t(objArr, 1, objArr, 0, iN);
                Object[] objArr2 = this.f71723b;
                objArr2[0] = objArr2[objArr2.length - 1];
                int i13 = this.f71722a;
                u90.b.t(objArr2, i13 + 1, objArr2, i13, objArr2.length - 1);
            }
            Object[] objArr3 = this.f71723b;
            int i14 = this.f71722a;
            objArr3[i14] = null;
            this.f71722a = h(i14);
        } else {
            int iN2 = n(ul.b.K(this) + this.f71722a);
            if (iN <= iN2) {
                Object[] objArr4 = this.f71723b;
                u90.b.t(objArr4, iN, objArr4, iN + 1, iN2 + 1);
            } else {
                Object[] objArr5 = this.f71723b;
                u90.b.t(objArr5, iN, objArr5, iN + 1, objArr5.length);
                Object[] objArr6 = this.f71723b;
                objArr6[objArr6.length - 1] = objArr6[0];
                u90.b.t(objArr6, 0, objArr6, 1, iN2 + 1);
            }
            this.f71723b[iN2] = null;
        }
        this.f71724c--;
        return obj;
    }

    public final void e(int i5, Collection collection) {
        Iterator<E> it = collection.iterator();
        int length = this.f71723b.length;
        while (i5 < length && it.hasNext()) {
            this.f71723b[i5] = it.next();
            i5++;
        }
        int i11 = this.f71722a;
        for (int i12 = 0; i12 < i11 && it.hasNext(); i12++) {
            this.f71723b[i12] = it.next();
        }
        this.f71724c = collection.size() + this.f71724c;
    }

    public final void f(int i5) {
        if (i5 < 0) {
            throw new IllegalStateException("Deque is too big.");
        }
        Object[] objArr = this.f71723b;
        if (i5 <= objArr.length) {
            return;
        }
        if (objArr == f71721d) {
            if (i5 < 10) {
                i5 = 10;
            }
            this.f71723b = new Object[i5];
            return;
        }
        AbstractList.Companion companion = AbstractList.f71712a;
        int length = objArr.length;
        companion.getClass();
        Object[] objArr2 = new Object[AbstractList.Companion.e(length, i5)];
        Object[] objArr3 = this.f71723b;
        u90.b.t(objArr3, 0, objArr2, this.f71722a, objArr3.length);
        Object[] objArr4 = this.f71723b;
        int length2 = objArr4.length;
        int i11 = this.f71722a;
        u90.b.t(objArr4, length2 - i11, objArr2, 0, i11);
        this.f71722a = 0;
        this.f71723b = objArr2;
    }

    public final Object first() {
        if (isEmpty()) {
            throw new NoSuchElementException("ArrayDeque is empty.");
        }
        return this.f71723b[this.f71722a];
    }

    public final Object g() {
        if (isEmpty()) {
            return null;
        }
        return this.f71723b[this.f71722a];
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        AbstractList.Companion companion = AbstractList.f71712a;
        int i11 = this.f71724c;
        companion.getClass();
        AbstractList.Companion.b(i5, i11);
        return this.f71723b[n(this.f71722a + i5)];
    }

    public final int h(int i5) {
        if (i5 == c.C0(this.f71723b)) {
            return 0;
        }
        return i5 + 1;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        int i5;
        int iN = n(getF71724c() + this.f71722a);
        int length = this.f71722a;
        if (length < iN) {
            while (length < iN) {
                if (Intrinsics.b(obj, this.f71723b[length])) {
                    i5 = this.f71722a;
                } else {
                    length++;
                }
            }
            return -1;
        }
        if (length < iN) {
            return -1;
        }
        int length2 = this.f71723b.length;
        while (true) {
            if (length >= length2) {
                for (int i11 = 0; i11 < iN; i11++) {
                    if (Intrinsics.b(obj, this.f71723b[i11])) {
                        length = i11 + this.f71723b.length;
                        i5 = this.f71722a;
                    }
                }
                return -1;
            }
            if (Intrinsics.b(obj, this.f71723b[length])) {
                i5 = this.f71722a;
                break;
            }
            length++;
        }
        return length - i5;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean isEmpty() {
        return getF71724c() == 0;
    }

    public final Object j() {
        if (isEmpty()) {
            return null;
        }
        return this.f71723b[n(ul.b.K(this) + this.f71722a)];
    }

    public final int k(int i5) {
        return i5 < 0 ? i5 + this.f71723b.length : i5;
    }

    public final void l(int i5, int i11) {
        if (i5 < i11) {
            u90.b.B(i5, i11, null, this.f71723b);
            return;
        }
        Object[] objArr = this.f71723b;
        u90.b.B(i5, objArr.length, null, objArr);
        u90.b.B(0, i11, null, this.f71723b);
    }

    public final Object last() {
        if (isEmpty()) {
            throw new NoSuchElementException("ArrayDeque is empty.");
        }
        return this.f71723b[n(ul.b.K(this) + this.f71722a)];
    }

    @Override // java.util.AbstractList, java.util.List
    public final int lastIndexOf(Object obj) {
        int iC0;
        int i5;
        int iN = n(getF71724c() + this.f71722a);
        int i11 = this.f71722a;
        if (i11 < iN) {
            iC0 = iN - 1;
            if (i11 <= iC0) {
                while (!Intrinsics.b(obj, this.f71723b[iC0])) {
                    if (iC0 != i11) {
                        iC0--;
                    }
                }
                i5 = this.f71722a;
                return iC0 - i5;
            }
            return -1;
        }
        if (i11 > iN) {
            int i12 = iN - 1;
            while (true) {
                if (-1 >= i12) {
                    iC0 = c.C0(this.f71723b);
                    int i13 = this.f71722a;
                    if (i13 <= iC0) {
                        while (!Intrinsics.b(obj, this.f71723b[iC0])) {
                            if (iC0 != i13) {
                                iC0--;
                            }
                        }
                        i5 = this.f71722a;
                    }
                } else {
                    if (Intrinsics.b(obj, this.f71723b[i12])) {
                        iC0 = i12 + this.f71723b.length;
                        i5 = this.f71722a;
                        break;
                    }
                    i12--;
                }
            }
        }
        return -1;
    }

    public final int n(int i5) {
        Object[] objArr = this.f71723b;
        return i5 >= objArr.length ? i5 - objArr.length : i5;
    }

    public final void o() {
        ((java.util.AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean remove(Object obj) {
        int iIndexOf = indexOf(obj);
        if (iIndexOf == -1) {
            return false;
        }
        d(iIndexOf);
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean removeAll(Collection elements) {
        int iN;
        Intrinsics.g(elements, "elements");
        boolean z11 = false;
        z11 = false;
        z11 = false;
        if (!isEmpty() && this.f71723b.length != 0) {
            int iN2 = n(getF71724c() + this.f71722a);
            int i5 = this.f71722a;
            if (i5 < iN2) {
                iN = i5;
                while (i5 < iN2) {
                    Object obj = this.f71723b[i5];
                    if (elements.contains(obj)) {
                        z11 = true;
                    } else {
                        this.f71723b[iN] = obj;
                        iN++;
                    }
                    i5++;
                }
                u90.b.B(iN, iN2, null, this.f71723b);
            } else {
                int length = this.f71723b.length;
                boolean z12 = false;
                int i11 = i5;
                while (i5 < length) {
                    Object[] objArr = this.f71723b;
                    Object obj2 = objArr[i5];
                    objArr[i5] = null;
                    if (elements.contains(obj2)) {
                        z12 = true;
                    } else {
                        this.f71723b[i11] = obj2;
                        i11++;
                    }
                    i5++;
                }
                iN = n(i11);
                for (int i12 = 0; i12 < iN2; i12++) {
                    Object[] objArr2 = this.f71723b;
                    Object obj3 = objArr2[i12];
                    objArr2[i12] = null;
                    if (elements.contains(obj3)) {
                        z12 = true;
                    } else {
                        this.f71723b[iN] = obj3;
                        iN = h(iN);
                    }
                }
                z11 = z12;
            }
            if (z11) {
                o();
                this.f71724c = k(iN - this.f71722a);
            }
        }
        return z11;
    }

    public final Object removeFirst() {
        if (isEmpty()) {
            throw new NoSuchElementException("ArrayDeque is empty.");
        }
        o();
        Object[] objArr = this.f71723b;
        int i5 = this.f71722a;
        Object obj = objArr[i5];
        objArr[i5] = null;
        this.f71722a = h(i5);
        this.f71724c = getF71724c() - 1;
        return obj;
    }

    public final Object removeLast() {
        if (isEmpty()) {
            throw new NoSuchElementException("ArrayDeque is empty.");
        }
        o();
        int iN = n(ul.b.K(this) + this.f71722a);
        Object[] objArr = this.f71723b;
        Object obj = objArr[iN];
        objArr[iN] = null;
        this.f71724c = getF71724c() - 1;
        return obj;
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        AbstractList.Companion companion = AbstractList.f71712a;
        int i12 = this.f71724c;
        companion.getClass();
        AbstractList.Companion.d(i5, i11, i12);
        int i13 = i11 - i5;
        if (i13 == 0) {
            return;
        }
        if (i13 == this.f71724c) {
            clear();
            return;
        }
        if (i13 == 1) {
            d(i5);
            return;
        }
        o();
        if (i5 < this.f71724c - i11) {
            int iN = n((i5 - 1) + this.f71722a);
            int iN2 = n((i11 - 1) + this.f71722a);
            while (i5 > 0) {
                int i14 = iN + 1;
                int iMin = Math.min(i5, Math.min(i14, iN2 + 1));
                Object[] objArr = this.f71723b;
                int i15 = iN2 - iMin;
                int i16 = iN - iMin;
                u90.b.t(objArr, i15 + 1, objArr, i16 + 1, i14);
                iN = k(i16);
                iN2 = k(i15);
                i5 -= iMin;
            }
            int iN3 = n(this.f71722a + i13);
            l(this.f71722a, iN3);
            this.f71722a = iN3;
        } else {
            int iN4 = n(this.f71722a + i11);
            int iN5 = n(this.f71722a + i5);
            int i17 = this.f71724c;
            while (true) {
                i17 -= i11;
                if (i17 <= 0) {
                    break;
                }
                Object[] objArr2 = this.f71723b;
                i11 = Math.min(i17, Math.min(objArr2.length - iN4, objArr2.length - iN5));
                Object[] objArr3 = this.f71723b;
                int i18 = iN4 + i11;
                u90.b.t(objArr3, iN5, objArr3, iN4, i18);
                iN4 = n(i18);
                iN5 = n(iN5 + i11);
            }
            int iN6 = n(this.f71724c + this.f71722a);
            l(k(iN6 - i13), iN6);
        }
        this.f71724c -= i13;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean retainAll(Collection elements) {
        int iN;
        Intrinsics.g(elements, "elements");
        boolean z11 = false;
        z11 = false;
        z11 = false;
        if (!isEmpty() && this.f71723b.length != 0) {
            int iN2 = n(getF71724c() + this.f71722a);
            int i5 = this.f71722a;
            if (i5 < iN2) {
                iN = i5;
                while (i5 < iN2) {
                    Object obj = this.f71723b[i5];
                    if (elements.contains(obj)) {
                        this.f71723b[iN] = obj;
                        iN++;
                    } else {
                        z11 = true;
                    }
                    i5++;
                }
                u90.b.B(iN, iN2, null, this.f71723b);
            } else {
                int length = this.f71723b.length;
                boolean z12 = false;
                int i11 = i5;
                while (i5 < length) {
                    Object[] objArr = this.f71723b;
                    Object obj2 = objArr[i5];
                    objArr[i5] = null;
                    if (elements.contains(obj2)) {
                        this.f71723b[i11] = obj2;
                        i11++;
                    } else {
                        z12 = true;
                    }
                    i5++;
                }
                iN = n(i11);
                for (int i12 = 0; i12 < iN2; i12++) {
                    Object[] objArr2 = this.f71723b;
                    Object obj3 = objArr2[i12];
                    objArr2[i12] = null;
                    if (elements.contains(obj3)) {
                        this.f71723b[iN] = obj3;
                        iN = h(iN);
                    } else {
                        z12 = true;
                    }
                }
                z11 = z12;
            }
            if (z11) {
                o();
                this.f71724c = k(iN - this.f71722a);
            }
        }
        return z11;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        AbstractList.Companion companion = AbstractList.f71712a;
        int i11 = this.f71724c;
        companion.getClass();
        AbstractList.Companion.b(i5, i11);
        int iN = n(this.f71722a + i5);
        Object[] objArr = this.f71723b;
        Object obj2 = objArr[iN];
        objArr[iN] = obj;
        return obj2;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final Object[] toArray() {
        return toArray(new Object[getF71724c()]);
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        AbstractList.Companion companion = AbstractList.f71712a;
        int i11 = this.f71724c;
        companion.getClass();
        AbstractList.Companion.c(i5, i11);
        if (i5 == this.f71724c) {
            addLast(obj);
            return;
        }
        if (i5 == 0) {
            addFirst(obj);
            return;
        }
        o();
        f(this.f71724c + 1);
        int iN = n(this.f71722a + i5);
        int i12 = this.f71724c;
        if (i5 < ((i12 + 1) >> 1)) {
            int iC0 = iN == 0 ? c.C0(this.f71723b) : iN - 1;
            int i13 = this.f71722a;
            int iC02 = i13 == 0 ? c.C0(this.f71723b) : i13 - 1;
            int i14 = this.f71722a;
            if (iC0 >= i14) {
                Object[] objArr = this.f71723b;
                objArr[iC02] = objArr[i14];
                u90.b.t(objArr, i14, objArr, i14 + 1, iC0 + 1);
            } else {
                Object[] objArr2 = this.f71723b;
                u90.b.t(objArr2, i14 - 1, objArr2, i14, objArr2.length);
                Object[] objArr3 = this.f71723b;
                objArr3[objArr3.length - 1] = objArr3[0];
                u90.b.t(objArr3, 0, objArr3, 1, iC0 + 1);
            }
            this.f71723b[iC0] = obj;
            this.f71722a = iC02;
        } else {
            int iN2 = n(i12 + this.f71722a);
            if (iN < iN2) {
                Object[] objArr4 = this.f71723b;
                u90.b.t(objArr4, iN + 1, objArr4, iN, iN2);
            } else {
                Object[] objArr5 = this.f71723b;
                u90.b.t(objArr5, 1, objArr5, 0, iN2);
                Object[] objArr6 = this.f71723b;
                objArr6[0] = objArr6[objArr6.length - 1];
                u90.b.t(objArr6, iN + 1, objArr6, iN, objArr6.length - 1);
            }
            this.f71723b[iN] = obj;
        }
        this.f71724c++;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final Object[] toArray(Object[] array) throws NegativeArraySizeException {
        Intrinsics.g(array, "array");
        int length = array.length;
        int i5 = this.f71724c;
        if (length < i5) {
            Object objNewInstance = Array.newInstance(array.getClass().getComponentType(), i5);
            Intrinsics.e(objNewInstance, "null cannot be cast to non-null type kotlin.Array<T of kotlin.collections.ArraysKt__ArraysJVMKt.arrayOfNulls>");
            array = (Object[]) objNewInstance;
        }
        int iN = n(this.f71724c + this.f71722a);
        int i11 = this.f71722a;
        if (i11 < iN) {
            u90.b.w(this.f71723b, i11, array, iN, 2);
        } else if (!isEmpty()) {
            Object[] objArr = this.f71723b;
            u90.b.t(objArr, 0, array, this.f71722a, objArr.length);
            Object[] objArr2 = this.f71723b;
            u90.b.t(objArr2, objArr2.length - this.f71722a, array, 0, iN);
        }
        int i12 = this.f71724c;
        if (i12 < array.length) {
            array[i12] = null;
        }
        return array;
    }

    @Override // java.util.AbstractList, java.util.List
    public final boolean addAll(int i5, Collection elements) {
        Intrinsics.g(elements, "elements");
        AbstractList.Companion companion = AbstractList.f71712a;
        int i11 = this.f71724c;
        companion.getClass();
        AbstractList.Companion.c(i5, i11);
        if (elements.isEmpty()) {
            return false;
        }
        if (i5 == this.f71724c) {
            return addAll(elements);
        }
        o();
        f(elements.size() + this.f71724c);
        int iN = n(this.f71724c + this.f71722a);
        int iN2 = n(this.f71722a + i5);
        int size = elements.size();
        if (i5 < ((this.f71724c + 1) >> 1)) {
            int i12 = this.f71722a;
            int length = i12 - size;
            if (iN2 < i12) {
                Object[] objArr = this.f71723b;
                u90.b.t(objArr, length, objArr, i12, objArr.length);
                if (size >= iN2) {
                    Object[] objArr2 = this.f71723b;
                    u90.b.t(objArr2, objArr2.length - size, objArr2, 0, iN2);
                } else {
                    Object[] objArr3 = this.f71723b;
                    u90.b.t(objArr3, objArr3.length - size, objArr3, 0, size);
                    Object[] objArr4 = this.f71723b;
                    u90.b.t(objArr4, 0, objArr4, size, iN2);
                }
            } else if (length >= 0) {
                Object[] objArr5 = this.f71723b;
                u90.b.t(objArr5, length, objArr5, i12, iN2);
            } else {
                Object[] objArr6 = this.f71723b;
                length += objArr6.length;
                int i13 = iN2 - i12;
                int length2 = objArr6.length - length;
                if (length2 >= i13) {
                    u90.b.t(objArr6, length, objArr6, i12, iN2);
                } else {
                    u90.b.t(objArr6, length, objArr6, i12, i12 + length2);
                    Object[] objArr7 = this.f71723b;
                    u90.b.t(objArr7, 0, objArr7, this.f71722a + length2, iN2);
                }
            }
            this.f71722a = length;
            e(k(iN2 - size), elements);
            return true;
        }
        int i14 = iN2 + size;
        if (iN2 < iN) {
            int i15 = size + iN;
            Object[] objArr8 = this.f71723b;
            if (i15 <= objArr8.length) {
                u90.b.t(objArr8, i14, objArr8, iN2, iN);
            } else if (i14 >= objArr8.length) {
                u90.b.t(objArr8, i14 - objArr8.length, objArr8, iN2, iN);
            } else {
                int length3 = iN - (i15 - objArr8.length);
                u90.b.t(objArr8, 0, objArr8, length3, iN);
                Object[] objArr9 = this.f71723b;
                u90.b.t(objArr9, i14, objArr9, iN2, length3);
            }
        } else {
            Object[] objArr10 = this.f71723b;
            u90.b.t(objArr10, size, objArr10, 0, iN);
            Object[] objArr11 = this.f71723b;
            if (i14 >= objArr11.length) {
                u90.b.t(objArr11, i14 - objArr11.length, objArr11, iN2, objArr11.length);
            } else {
                u90.b.t(objArr11, 0, objArr11, objArr11.length - size, objArr11.length);
                Object[] objArr12 = this.f71723b;
                u90.b.t(objArr12, i14, objArr12, iN2, objArr12.length - size);
            }
        }
        e(iN2, elements);
        return true;
    }

    public ArrayDeque() {
        this.f71723b = f71721d;
    }
}
